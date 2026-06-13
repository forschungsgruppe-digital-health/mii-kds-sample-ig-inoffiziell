#!/usr/bin/env bash
# template-sanitize — entfernt nach erfolgter Migration die Dateien, die NUR der
# Erklärung des Vorlage-Repos bzw. der Migration dienen, aus einem migrierten
# Modul-Repo. Single Source of Truth für die Datei-Kategorien (siehe auch
# skills/mii-ig-migration/references/migration-agent-spec.md §5a.2).
#
# Sicherheitsmodell:
#   - Default = DRY-RUN: zeigt nur, WAS entfernt würde; löscht nichts.
#   - Echtes Entfernen nur mit --apply (via `git rm`, damit reversibel).
#   - Läuft nur in einem Git-Repo und (ohne --force-branch) nur im isolierten
#     Branch `hl7-ig-build` — der Default-Branch bleibt unberührt.
#   - Die NEVER-Liste (Modul-Inhalt/Build-Eingang) wird nie angefasst; ein
#     Treffer dort bricht hart ab.
#
# Verwendung:
#   tools/template-sanitize.sh                 # Dry-Run (Plan anzeigen)
#   tools/template-sanitize.sh --apply         # ALWAYS-Liste entfernen
#   tools/template-sanitize.sh --apply --include-ask   # zusätzlich ASK-Liste
#   tools/template-sanitize.sh --force-branch  # Branch-Guard überspringen
# Bash 3.2-kompatibel (keine mapfile/nameref).
set -u
cd "$(dirname "$0")/.."

APPLY=0; INCLUDE_ASK=0; FORCE_BRANCH=0
for a in "$@"; do case "$a" in
  --apply) APPLY=1;;
  --include-ask) INCLUDE_ASK=1;;
  --force-branch) FORCE_BRANCH=1;;
  *) echo "Unbekanntes Argument: $a" >&2; exit 2;;
esac; done

# --- Datei-Kategorien (SSOT) ---------------------------------------------------
# ALWAYS: reine Vorlage-/Migrations-Erklärung — gehören NICHT in ein Modul-Repo.
ALWAYS="MIGRATION.md DESIGN.md ROLES.md SOURCES.md AI_USAGE.md skills tools/verify-template.sh .ai-log input/images/mii-logo-PLATZHALTER.svg"
# ASK: vorlagengeprägt, im Modul aber evtl. erwünscht — nur mit --include-ask.
ASK="CONTRIBUTING.md COMMENT_RESOLUTION.md PUBLISHING.md NOTIFICATIONS.md TERMINOLOGY.md CODE_OF_CONDUCT.md SECURITY.md NOTICE CHANGELOG.md AGENTS.md CLAUDE.md .claude .agents .devcontainer .vscode advisor.json tools/check-updates.py"
# NEVER: Modul-Inhalt + Build-Eingang — niemals anfassen (Schutzliste).
NEVER="input/fsh input/pagecontent input/translations input/ignoreWarnings.txt input/includes sushi-config.yaml ig.ini package.json publication-request.json qc .gitignore LICENSE"

# --- Vorbedingungen ------------------------------------------------------------
git rev-parse --is-inside-work-tree >/dev/null 2>&1 || { echo "FEHLER: kein Git-Repo." >&2; exit 1; }
BRANCH="$(git rev-parse --abbrev-ref HEAD 2>/dev/null)"
if [ "$APPLY" = 1 ] && [ "$FORCE_BRANCH" = 0 ] && [ "$BRANCH" != "hl7-ig-build" ]; then
  echo "FEHLER: --apply nur im Branch 'hl7-ig-build' (aktuell: '$BRANCH'). Mit --force-branch überschreibbar." >&2
  exit 1
fi

guard_never() { # bricht ab, falls Ziel $1 eine NEVER-Regel verletzt
  local t="$1" n
  for n in $NEVER; do
    case "$t" in "$n"|"$n"/*) echo "ABBRUCH: Ziel '$t' kollidiert mit Schutzliste '$n'." >&2; exit 3;; esac
  done
}

present() { # echo Ziele aus $* , die existieren oder git-getrackt sind
  local t
  for t in "$@"; do
    guard_never "$t"
    if [ -e "$t" ] || git ls-files --error-unmatch "$t" >/dev/null 2>&1; then echo "$t"; fi
  done
}

ALWAYS_PRESENT="$(present $ALWAYS)"
ASK_PRESENT="$(present $ASK)"

echo "== template-sanitize (Branch: $BRANCH, Modus: $([ "$APPLY" = 1 ] && echo APPLY || echo DRY-RUN)) =="
echo "-- ALWAYS (entfernen): --"
echo "${ALWAYS_PRESENT:-   (keine)}" | sed 's/^/   /'
echo "-- ASK (nur mit --include-ask): --"
echo "${ASK_PRESENT:-   (keine)}" | sed 's/^/   /'

TARGETS="$ALWAYS_PRESENT"
[ "$INCLUDE_ASK" = 1 ] && TARGETS="$ALWAYS_PRESENT
$ASK_PRESENT"

if [ "$APPLY" = 0 ]; then
  echo
  echo "DRY-RUN — nichts entfernt. Zum Anwenden: tools/template-sanitize.sh --apply [--include-ask]"
  exit 0
fi

removed=0
echo "$TARGETS" | while IFS= read -r t; do
  [ -n "$t" ] || continue
  guard_never "$t"
  git rm -r --quiet "$t" 2>/dev/null || rm -rf "$t"
  echo "entfernt: $t"
done
echo
echo "Fertig. Git-Änderungen sind gestaged — prüfen mit 'git status', dann committen."
echo "Hinweis: Verbleibende Verweise auf entfernte Dateien (README/AGENTS/Workflows) manuell bereinigen."
