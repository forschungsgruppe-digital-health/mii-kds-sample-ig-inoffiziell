#!/usr/bin/env python3
"""ig-stats — read-only-Vermessung eines FHIR-IG + Reporting (Markdown/Mermaid).

Subkommandos:
  analyze <ig-dir> [-o stats.json] [--label NAME]   statische Statistik -> ig-stats.json
  report  <stats.json> [-o report.md]               Einzel-IG-Report (Mermaid pie/quadrant)
  compare <stats.json…> [-o compare.md]             Vergleich über N IGs (normalisiert)

Metrik-Katalog (SSOT): skills/ig-analyze/references/metrics-catalog.md
Schema:                skills/ig-analyze/references/ig-stats-schema.json
Nur stdlib. Build-only-Metriken (qa.json) bleiben im statischen Modus null.
"""
import argparse, glob, json, os, re, subprocess, sys
try:
    from datetime import datetime, timezone
except Exception:
    datetime = None

SCHEMA_VERSION = "1.0"
MANDATORY_PAGES = ["index", "use-cases", "data-sets", "uml", "conformance",
                   "context", "references", "changes", "downloads",
                   "security-privacy", "translationinfo"]
SUPPLEMENT_TYPES = ("StructureDefinition", "CodeSystem", "Questionnaire")

# Aufwandsfaktoren (Stunden je Einheit) — KALIBRIERBAR (TODO:REVIEW nach realen Migrationen).
EFFORT_FACTORS = {
    "gofsh_flat": 8.0,        # Pauschale, falls keine FSH vorhanden (GoFSH-Vorlauf)
    "directive": 0.2,         # je Simplifier-/FQL-Direktive (Narrativ-Nacharbeit)
    "page": 0.5,              # je zu migrierender Narrative-Seite
    "floating_pin": 1.0,      # je floating Dependency (Auflösen/Test)
    "missing_mandatory": 1.0, # je fehlender Pflichtseite (neu schreiben)
}

# Simplifier-/FQL-Direktiven (label -> Regex). Bewusst kompakt; reichere Regeln:
# skills/mii-ig-migration/references/fql-rules.tsv (vom Migrations-Schritt genutzt).
DIRECTIVE_PATTERNS = {
    "page-title": r"\{\{page-title\}\}",
    "pagelink": r"\{\{pagelink",
    "render": r"\{\{render:",
    "tree": r"\{\{tree",
    "link": r"\{\{link[:}]",
    "xml": r"\{\{xml\}\}",
    "json": r"\{\{json\}\}",
    "fql": r"<fql",
    "fql-at": r"@```",
    "tabs": r"</?tab",
}
GENERIC_DIRECTIVE = r"\{\{[A-Za-z]|<fql|@```|</?tab"


# ---------- Hilfen -------------------------------------------------------------
def read(path):
    try:
        with open(path, encoding="utf-8", errors="replace") as f:
            return f.read()
    except Exception:
        return ""


def sushi_scalar(text, key):
    m = re.search(r'^%s:\s*"?([^"#\n]+?)"?\s*(?:#.*)?$' % re.escape(key), text, re.M)
    return m.group(1).strip() if m else None


def sushi_dependencies(text):
    deps = {}
    in_block = False
    for ln in text.splitlines():
        if re.match(r'^dependencies:\s*$', ln):
            in_block = True
            continue
        if in_block:
            if re.match(r'^\S', ln):
                break
            m = re.match(r'\s+([A-Za-z0-9._\-]+):\s*([^\s#]+)', ln)
            if m and not ln.lstrip().startswith("#"):
                deps[m.group(1)] = m.group(2)
    return deps


def sushi_langs(text):
    langs = []
    m = re.search(r'^\s*i18n-lang:\s*$', text, re.M)
    if m:
        for ln in text[m.end():].splitlines():
            mm = re.match(r'\s+-\s*([A-Za-z-]+)\s*$', ln)
            if mm:
                langs.append(mm.group(1))
            elif ln.strip() and not ln.startswith(" "):
                break
    return langs


def git_commit(d):
    try:
        return subprocess.run(["git", "-C", d, "rev-parse", "--short", "HEAD"],
                              capture_output=True, text=True, timeout=10).stdout.strip() or None
    except Exception:
        return None


# ---------- Artefakt-Zählung ---------------------------------------------------
def count_from_generated(gendir):
    c = dict.fromkeys(["profiles", "extensions", "valuesets", "codesystems",
                       "logicals", "capabilitystatements", "questionnaires",
                       "searchparameters", "operations", "examples"], 0)
    for fp in glob.glob(os.path.join(gendir, "*.json")):
        try:
            d = json.load(open(fp, encoding="utf-8"))
        except Exception:
            continue
        rt = d.get("resourceType")
        if rt == "StructureDefinition":
            if d.get("kind") == "logical":
                c["logicals"] += 1
            elif d.get("type") == "Extension":
                c["extensions"] += 1
            else:
                c["profiles"] += 1
        elif rt == "ValueSet":
            c["valuesets"] += 1
        elif rt == "CodeSystem":
            c["codesystems"] += 1
        elif rt == "CapabilityStatement":
            c["capabilitystatements"] += 1
        elif rt == "Questionnaire":
            c["questionnaires"] += 1
        elif rt == "SearchParameter":
            c["searchparameters"] += 1
        elif rt == "OperationDefinition":
            c["operations"] += 1
        elif rt == "ImplementationGuide":
            pass
        else:
            c["examples"] += 1   # konkrete Ressourceninstanzen = Beispiele
    c["mappings"] = c["invariants"] = c["rulesets"] = 0
    return c


def count_from_fsh(fshdir):
    c = dict.fromkeys(["profiles", "extensions", "valuesets", "codesystems",
                       "logicals", "capabilitystatements", "questionnaires",
                       "searchparameters", "operations", "examples",
                       "mappings", "invariants", "rulesets"], 0)
    inst = 0
    for fp in glob.glob(os.path.join(fshdir, "**", "*.fsh"), recursive=True):
        t = read(fp)
        c["profiles"] += len(re.findall(r'^Profile:', t, re.M))
        c["extensions"] += len(re.findall(r'^Extension:', t, re.M))
        c["valuesets"] += len(re.findall(r'^ValueSet:', t, re.M))
        c["codesystems"] += len(re.findall(r'^CodeSystem:', t, re.M))
        c["logicals"] += len(re.findall(r'^Logical:', t, re.M))
        c["mappings"] += len(re.findall(r'^Mapping:', t, re.M))
        c["invariants"] += len(re.findall(r'^Invariant:', t, re.M))
        c["rulesets"] += len(re.findall(r'^RuleSet:', t, re.M))
        inst += len(re.findall(r'^Instance:', t, re.M))
        c["capabilitystatements"] += len(re.findall(r'^InstanceOf:\s*CapabilityStatement', t, re.M))
        c["searchparameters"] += len(re.findall(r'^InstanceOf:\s*SearchParameter', t, re.M))
        c["operations"] += len(re.findall(r'^InstanceOf:\s*OperationDefinition', t, re.M))
        c["questionnaires"] += len(re.findall(r'^InstanceOf:\s*Questionnaire', t, re.M))
    c["examples"] = max(0, inst - c["capabilitystatements"] - c["searchparameters"]
                        - c["operations"] - c["questionnaires"])
    return c


# ---------- Narrative / Direktiven --------------------------------------------
def narrative_files(igdir):
    # Union: Ziel-Format (input/pagecontent) UND Quell-Format (implementation-guides/**),
    # damit Quell-IGs mit Simplifier-Guide-Struktur korrekt erfasst werden.
    files = set(glob.glob(os.path.join(igdir, "input", "pagecontent", "*.md")))
    files |= set(glob.glob(os.path.join(igdir, "implementation-guides", "**", "*.md"), recursive=True))
    return sorted(files)


def scan_directives(files):
    by = dict.fromkeys(DIRECTIVE_PATTERNS, 0)
    matched_lines = set()
    unknown = 0
    for fp in files:
        lines = read(fp).splitlines()
        for i, ln in enumerate(lines):
            hit = False
            for label, pat in DIRECTIVE_PATTERNS.items():
                if re.search(pat, ln):
                    by[label] += 1
                    matched_lines.add((fp, i))
                    hit = True
            if not hit and re.search(GENERIC_DIRECTIVE, ln):
                unknown += 1
    total = sum(by.values())
    return {"total": total, "by_label": {k: v for k, v in by.items() if v}, "unknown": unknown}


# ---------- analyze ------------------------------------------------------------
def analyze(igdir, label):
    sushi = read(os.path.join(igdir, "sushi-config.yaml"))
    pkg = {}
    try:
        pkg = json.load(open(os.path.join(igdir, "package.json"), encoding="utf-8"))
    except Exception:
        pkg = {}

    version = sushi_scalar(sushi, "version") or pkg.get("version")
    identity = {
        "id": sushi_scalar(sushi, "id"),
        "canonical": sushi_scalar(sushi, "canonical") or pkg.get("canonical"),
        "packageId": sushi_scalar(sushi, "packageId") or pkg.get("name"),
        "name": sushi_scalar(sushi, "name") or pkg.get("name"),
        "title": sushi_scalar(sushi, "title") or pkg.get("title"),
        "version": version,
        "calver": bool(version and re.match(r'^\d{4}\.\d+\.\d+', version)),
        "status": sushi_scalar(sushi, "status"),
        "fhirVersion": sushi_scalar(sushi, "fhirVersion") or (pkg.get("fhirVersions") or [None])[0],
        "license": sushi_scalar(sushi, "license") or pkg.get("license"),
        "publisher": None,
    }
    mp = re.search(r'^publisher:\s*\n\s+name:\s*"?([^"#\n]+)', sushi, re.M)
    identity["publisher"] = mp.group(1).strip() if mp else sushi_scalar(sushi, "publisher")

    gendir = os.path.join(igdir, "fsh-generated", "resources")
    fshdir = os.path.join(igdir, "input", "fsh")
    fsh_present = bool(glob.glob(os.path.join(fshdir, "**", "*.fsh"), recursive=True))
    if os.path.isdir(gendir) and glob.glob(os.path.join(gendir, "*.json")):
        artifacts = count_from_generated(gendir)
    else:
        artifacts = count_from_fsh(fshdir)
    for k in ("mappings", "invariants", "rulesets"):
        artifacts.setdefault(k, 0)
    artifacts["total"] = sum(v for k, v in artifacts.items() if k != "total")

    deps = sushi_dependencies(sushi)
    floating = [k for k, v in deps.items() if re.search(r'(x|current|dev|latest)', v)]
    dependencies = {"count": len(deps), "pinned": len(deps) - len(floating),
                    "floating": len(floating), "items": deps, "floating_items": floating}

    nfiles = narrative_files(igdir)
    words = sum(len(read(f).split()) for f in nfiles)
    images = len(glob.glob(os.path.join(igdir, "input", "images", "*"))) \
        + len(glob.glob(os.path.join(igdir, "implementation-guides", "**", "images", "*"), recursive=True))
    pc_base = {os.path.basename(f)[:-3] for f in glob.glob(os.path.join(igdir, "input", "pagecontent", "*.md"))}
    present = [p for p in MANDATORY_PAGES if p in pc_base]
    missing = [p for p in MANDATORY_PAGES if p not in pc_base] if pc_base else []
    narrative = {"pages": len(nfiles), "words": words, "images": images,
                 "mandatory_present": present, "mandatory_missing": missing}

    langs = sushi_langs(sushi)
    supp = 0
    for lang in (langs or []):
        for ext in ("po", "json", "xliff"):
            for f in glob.glob(os.path.join(igdir, "input", "translations", lang, "*." + ext)):
                stem = os.path.basename(f).rsplit(".", 1)[0]
                if stem.split("-", 1)[0] in SUPPLEMENT_TYPES:
                    supp += 1
    tpages = len(glob.glob(os.path.join(igdir, "input", "pagecontent", "*-??.md")))
    fsh_trans = any(re.search(r'insert Translation\(|StructureDefinition/translation', read(f))
                    for f in glob.glob(os.path.join(fshdir, "**", "*.fsh"), recursive=True))
    i18n = {"default_lang": sushi_scalar(sushi, "i18n-default-lang"),
            "languages": langs, "translation_supplements": supp,
            "translated_pages": tpages, "fsh_translation_ext": bool(fsh_trans)}

    directives = scan_directives(nfiles)

    qc = os.path.join(igdir, "qc", "custom.rules.yaml")
    qc_rules = len(re.findall(r'^\s*-\s+(action|name):', read(qc), re.M)) if os.path.exists(qc) else None
    ign = read(os.path.join(igdir, "input", "ignoreWarnings.txt"))
    suppressed = len([l for l in ign.splitlines() if l.strip() and not l.lstrip().startswith("#")
                      and not l.startswith("==")]) if ign else None
    quality = {"qc_rules_defined": qc_rules, "suppressed_messages": suppressed,
               "qa_errors": None, "qa_warnings": None, "qa_hints": None,
               "broken_links": None, "qa_categories": None}

    # Aufwands-Schätzung (statisch berechenbare Treiber)
    drivers = {
        "gofsh_needed": (not fsh_present),
        "directives": directives["total"],
        "pages": narrative["pages"],
        "floating_pins": dependencies["floating"],
    }
    base = (EFFORT_FACTORS["gofsh_flat"] if drivers["gofsh_needed"] else 0.0) \
        + drivers["directives"] * EFFORT_FACTORS["directive"] \
        + drivers["pages"] * EFFORT_FACTORS["page"] \
        + drivers["floating_pins"] * EFFORT_FACTORS["floating_pin"]
    low, high = round(base * 0.8, 1), round(base * 1.3, 1)
    band = "S" if high < 8 else "M" if high < 40 else "L" if high < 120 else "XL"
    effort = {"drivers": drivers, "factors": EFFORT_FACTORS,
              "hours_low": low, "hours_high": high, "band": band,
              "assumptions": [
                  "Nur statisch berechenbare Treiber; id/url-Mismatch, QC-Verletzungen und "
                  "quell-intrinsische Validierungsfehler erfordern einen Build (full-Modus).",
                  "Faktoren in EFFORT_FACTORS sind unkalibriert (TODO:REVIEW).",
                  "Spanne = base × 0,8…1,3."]}

    ts = None
    if datetime:
        try:
            ts = datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
        except Exception:
            ts = None
    return {
        "schemaVersion": SCHEMA_VERSION, "tool": "ig-stats.py", "mode": "static",
        "analyzed": {"path": os.path.abspath(igdir), "label": label or identity["id"] or os.path.basename(os.path.abspath(igdir)),
                     "git_commit": git_commit(igdir), "timestamp": ts},
        "identity": identity, "artifacts": artifacts, "dependencies": dependencies,
        "narrative": narrative, "i18n": i18n, "directives": directives,
        "quality": quality, "effort": effort,
    }


# ---------- Reporting ----------------------------------------------------------
def _pie(title, mapping):
    items = [(k, v) for k, v in mapping.items() if isinstance(v, int) and v > 0]
    if not items:
        return ""
    out = ["```mermaid", "pie showData title %s" % title]
    for k, v in items:
        out.append('    "%s" : %d' % (k, v))
    out.append("```")
    return "\n".join(out)


def report(stats, out):
    i, a = stats["identity"], stats["artifacts"]
    d, n, t, e = stats["dependencies"], stats["narrative"], stats["directives"], stats["effort"]
    L = []
    L.append("# IG-Statistik — %s" % (stats["analyzed"]["label"]))
    L.append("")
    L.append("> Modus: `%s` · Stand: %s · Commit: %s" %
             (stats["mode"], stats["analyzed"]["timestamp"], stats["analyzed"]["git_commit"]))
    L.append("")
    L.append("## Steckbrief")
    L.append("| Feld | Wert |\n|---|---|")
    for k in ("id", "canonical", "version", "status", "fhirVersion", "license", "publisher"):
        L.append("| `%s` | %s |" % (k, i.get(k)))
    L.append("| CalVer | %s |" % i.get("calver"))
    L.append("")
    L.append("## Artefakte (Σ %d)" % a.get("total", 0))
    L.append(_pie("Artefakt-Verteilung", {k: v for k, v in a.items() if k != "total"}))
    L.append("")
    L.append("## Abhängigkeiten")
    L.append("- Anzahl: **%d** (gepinnt %d, floating %d)" % (d["count"], d["pinned"], d["floating"]))
    if d["floating_items"]:
        L.append("- ⚠ floating: %s" % ", ".join("`%s`" % x for x in d["floating_items"]))
    L.append("")
    L.append("## Narrative & Doku")
    L.append("- Seiten: **%d** · Wörter: ~%d · Bilder: %d" % (n["pages"], n["words"], n["images"]))
    if n["mandatory_missing"]:
        L.append("- Fehlende Pflichtseiten: %s" % ", ".join("`%s`" % x for x in n["mandatory_missing"]))
    L.append("")
    if t["total"]:
        L.append("## Simplifier-/FQL-Direktiven (Migrations-Aufwandstreiber)")
        L.append("- Gesamt: **%d** · unbekannt: %d" % (t["total"], t["unknown"]))
        L.append(_pie("Direktiven", t["by_label"]))
        L.append("")
    L.append("## Mehrsprachigkeit")
    L.append("- Default: `%s` · Sprachen: %s · Supplements: %d · FSH-Translation-Ext: %s" %
             (stats["i18n"]["default_lang"], stats["i18n"]["languages"] or "—",
              stats["i18n"]["translation_supplements"], stats["i18n"]["fsh_translation_ext"]))
    L.append("")
    L.append("## Migrations-Aufwand (Schätzung, statisch)")
    L.append("**Band: %s** · Spanne: **%s–%s h**" % (e["band"], e["hours_low"], e["hours_high"]))
    L.append("")
    L.append("| Treiber | Wert |\n|---|---|")
    for k, v in e["drivers"].items():
        L.append("| %s | %s |" % (k, v))
    L.append("")
    L.append("_Annahmen:_ " + " ".join("• " + x for x in e["assumptions"]))
    txt = "\n".join(L) + "\n"
    if out:
        open(out, "w", encoding="utf-8").write(txt)
    return txt


def compare(statslist, out):
    def lab(s): return s["analyzed"]["label"]
    L = ["# IG-Vergleich (%d IGs)" % len(statslist), ""]
    # Kennzahlen-Tabelle
    L.append("## Kennzahlen")
    head = ["Metrik"] + [lab(s) for s in statslist]
    L.append("| " + " | ".join(head) + " |")
    L.append("|" + "---|" * len(head))
    rows = [
        ("Artefakte gesamt", lambda s: s["artifacts"]["total"]),
        ("Profile", lambda s: s["artifacts"].get("profiles", 0)),
        ("ValueSets", lambda s: s["artifacts"].get("valuesets", 0)),
        ("CodeSystems", lambda s: s["artifacts"].get("codesystems", 0)),
        ("Beispiele", lambda s: s["artifacts"].get("examples", 0)),
        ("Dependencies (floating)", lambda s: "%d (%d)" % (s["dependencies"]["count"], s["dependencies"]["floating"])),
        ("Narrative-Seiten", lambda s: s["narrative"]["pages"]),
        ("FQL-/Direktiven", lambda s: s["directives"]["total"]),
        ("Fehlende Pflichtseiten", lambda s: len(s["narrative"]["mandatory_missing"])),
        ("FSH-Translation-Ext", lambda s: "ja" if s["i18n"]["fsh_translation_ext"] else "—"),
        ("Aufwand h (Band)", lambda s: "%s–%s (%s)" % (s["effort"]["hours_low"], s["effort"]["hours_high"], s["effort"]["band"])),
    ]
    for name, fn in rows:
        L.append("| " + name + " | " + " | ".join(str(fn(s)) for s in statslist) + " |")
    L.append("")
    # Normalisiert: Direktiven je Seite, Beispiele je Profil
    L.append("## Normalisierte Kennzahlen (fairer Vergleich)")
    L.append("| Metrik | " + " | ".join(lab(s) for s in statslist) + " |")
    L.append("|" + "---|" * (len(statslist) + 1))
    def per(s, num, den):
        dv = den(s)
        return round(num(s) / dv, 2) if dv else 0
    L.append("| Direktiven je Seite | " + " | ".join(
        str(per(s, lambda x: x["directives"]["total"], lambda x: x["narrative"]["pages"])) for s in statslist) + " |")
    L.append("| Beispiele je Profil | " + " | ".join(
        str(per(s, lambda x: x["artifacts"].get("examples", 0), lambda x: x["artifacts"].get("profiles", 0))) for s in statslist) + " |")
    L.append("")
    # Quadrant: Scope (x) vs. Migrationsaufwand (y), normalisiert auf max
    maxart = max((s["artifacts"]["total"] for s in statslist), default=1) or 1
    maxh = max((s["effort"]["hours_high"] for s in statslist), default=1) or 1
    L.append("## Scope vs. Migrationsaufwand")
    L.append("```mermaid")
    L.append("quadrantChart")
    L.append("    title Scope vs. Migrationsaufwand")
    L.append("    x-axis Klein --> Gross")
    L.append("    y-axis Geringer Aufwand --> Hoher Aufwand")
    L.append("    quadrant-1 gross & aufwaendig")
    L.append("    quadrant-2 klein & aufwaendig")
    L.append("    quadrant-3 klein & einfach")
    L.append("    quadrant-4 gross & einfach")
    for s in statslist:
        x = round(s["artifacts"]["total"] / maxart, 3)
        y = round(s["effort"]["hours_high"] / maxh, 3)
        L.append('    "%s": [%s, %s]' % (lab(s), x, y))
    L.append("```")
    L.append("")
    txt = "\n".join(L) + "\n"
    if out:
        open(out, "w", encoding="utf-8").write(txt)
    return txt


# ---------- CLI ----------------------------------------------------------------
def main():
    ap = argparse.ArgumentParser(prog="ig-stats.py", description="FHIR-IG vermessen + Reporting")
    sub = ap.add_subparsers(dest="cmd", required=True)
    pa = sub.add_parser("analyze"); pa.add_argument("igdir"); pa.add_argument("-o"); pa.add_argument("--label")
    pr = sub.add_parser("report"); pr.add_argument("stats"); pr.add_argument("-o")
    pc = sub.add_parser("compare"); pc.add_argument("stats", nargs="+"); pc.add_argument("-o")
    args = ap.parse_args()

    if args.cmd == "analyze":
        if not os.path.isdir(args.igdir):
            print("FEHLER: kein Verzeichnis: %s" % args.igdir, file=sys.stderr); return 2
        stats = analyze(args.igdir, args.label)
        out = json.dumps(stats, ensure_ascii=False, indent=2)
        if args.o:
            open(args.o, "w", encoding="utf-8").write(out + "\n")
            print("ig-stats -> %s  (Artefakte %d, Aufwand %s)" % (args.o, stats["artifacts"]["total"], stats["effort"]["band"]))
        else:
            print(out)
    elif args.cmd == "report":
        stats = json.load(open(args.stats, encoding="utf-8"))
        txt = report(stats, args.o)
        if args.o:
            print("Report -> %s" % args.o)
        else:
            print(txt)
    elif args.cmd == "compare":
        statslist = [json.load(open(p, encoding="utf-8")) for p in args.stats]
        txt = compare(statslist, args.o)
        if args.o:
            print("Vergleich -> %s" % args.o)
        else:
            print(txt)
    return 0


if __name__ == "__main__":
    sys.exit(main())
