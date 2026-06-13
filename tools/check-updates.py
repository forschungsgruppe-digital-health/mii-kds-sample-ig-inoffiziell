#!/usr/bin/env python3
"""Prueft Aktualisierungen von FHIR-Packages, IG Publisher, SUSHI und der in den
Workflows genutzten GitHub-Actions. Schreibt einen Markdown-Report und setzt
has_updates (fuer GITHUB_OUTPUT). Netzwerkfehler werden tolerant behandelt."""
import json, os, re, sys, urllib.request, glob

TOKEN = os.environ.get("GITHUB_TOKEN", "")

def get_json(url, gh=False):
    req = urllib.request.Request(url, headers={"User-Agent": "mii-ig-update-check"})
    if gh and TOKEN:
        req.add_header("Authorization", f"Bearer {TOKEN}")
        req.add_header("Accept", "application/vnd.github+json")
    with urllib.request.urlopen(req, timeout=30) as r:
        return json.load(r)

lines, updates = [], 0

# 1) FHIR-Packages aus sushi-config.yaml (aktive, nicht auskommentierte deps)
def fhir_deps():
    deps, in_block = {}, False
    for ln in open("sushi-config.yaml", encoding="utf-8"):
        if re.match(r'^dependencies:', ln): in_block = True; continue
        if in_block:
            if re.match(r'^\S', ln): break          # Block-Ende
            m = re.match(r'\s+([a-z0-9.\-]+):\s*([0-9][^\s#]*)', ln)  # nur gepinnte, nicht-kommentiert
            if m and not ln.lstrip().startswith("#"):
                deps[m.group(1)] = m.group(2)
    return deps

lines.append("## FHIR-Packages")
for pkg, cur in fhir_deps().items():
    try:
        latest = get_json(f"https://packages.fhir.org/{pkg}").get("dist-tags", {}).get("latest", "?")
        flag = "  ⬆️ **Update**" if latest not in ("?", cur) else ""
        if flag: updates += 1
        lines.append(f"- `{pkg}`: aktuell `{cur}` → neueste `{latest}`{flag}")
    except Exception as e:
        lines.append(f"- `{pkg}`: Pruefung fehlgeschlagen ({e})")

# 2) IG Publisher (informativ; Build nutzt latest)
lines.append("\n## Werkzeuge")
try:
    tag = get_json("https://api.github.com/repos/HL7/fhir-ig-publisher/releases/latest", gh=True).get("tag_name", "?")
    lines.append(f"- HL7 IG Publisher: neueste Release `{tag}` (Build nutzt jeweils latest)")
except Exception as e:
    lines.append(f"- IG Publisher: Pruefung fehlgeschlagen ({e})")
try:
    s = get_json("https://registry.npmjs.org/fsh-sushi").get("dist-tags", {}).get("latest", "?")
    lines.append(f"- SUSHI (fsh-sushi): neueste `{s}`")
except Exception as e:
    lines.append(f"- SUSHI: Pruefung fehlgeschlagen ({e})")

# 3) GitHub-Actions aus Workflows
lines.append("\n## GitHub-Actions (in Workflows)")
used = set()
for wf in glob.glob(".github/workflows/*.yml"):
    for m in re.finditer(r'uses:\s*([^\s@]+)@([^\s]+)', open(wf, encoding="utf-8").read()):
        used.add((m.group(1), m.group(2)))
for action, ref in sorted(used):
    if "/" not in action: continue
    # Branch-Refs (master/main etc.) sind kein Versionsvergleich — sonst entsteht
    # bei jedem Lauf ein garantiertes False-Positive-Issue.
    if not re.match(r'^v?\d', ref):
        lines.append(f"- `{action}`: genutzt `{ref}` (Branch-Ref, kein Versionsvergleich)")
        continue
    owner_repo = "/".join(action.split("/")[:2])
    try:
        tag = get_json(f"https://api.github.com/repos/{owner_repo}/releases/latest", gh=True).get("tag_name", "?")
        cur_v, new_v = ref.lstrip("v"), tag.lstrip("v")
        if re.fullmatch(r'\d+', cur_v):
            # Major-gepinnt (z. B. v4): nur Major-Komponente vergleichen
            newer = tag != "?" and new_v.split(".")[0] != cur_v
        else:
            newer = tag != "?" and new_v != cur_v
        flag = "  ⬆️ **Update**" if newer else ""
        if flag: updates += 1
        lines.append(f"- `{action}`: genutzt `{ref}` → neueste `{tag}`{flag}")
    except Exception as e:
        lines.append(f"- `{action}` (`{ref}`): Pruefung fehlgeschlagen ({e})")

report = "Automatischer Abhängigkeits-Check (FHIR-Packages, Werkzeuge, Actions).\n\n" + "\n".join(lines)
open("update-report.md", "w", encoding="utf-8").write(report)
print(report)

gho = os.environ.get("GITHUB_OUTPUT")
if gho:
    with open(gho, "a") as f:
        f.write(f"has_updates={'true' if updates>0 else 'false'}\n")
print(f"\n[updates={updates}]", file=sys.stderr)
