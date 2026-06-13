#!/usr/bin/env bash
# Strukturelle Selbstpruefung: bildet das Repo die in SOURCES.md dokumentierten
# Konventionen/Vorgaben ab? Exit-Code != 0 bei Fehlern.
#
# Modi:
#   (ohne Argument)  Vollpruefung des Template-Repos (Selbstpruefung).
#   --migrated       Nur IG-relevante Pruefungen fuer ein MIGRIERTES Modul-Repo
#                    (Toolchain, Sprache, Pflichtseiten, Best Practices, FSH,
#                    Workflows). Template-spezifische Pruefungen (Governance-
#                    Doku, Skills, neutraler Namensraum etc.) entfallen, da sie
#                    laut Spec §5a nicht uebernommen werden.
set -u
MODE=template
[ "${1:-}" = "--migrated" ] && MODE=migrated
cd "$(dirname "$0")/.."
pass=0; fail=0
ok(){ echo "  [PASS] $1"; pass=$((pass+1)); }
no(){ echo "  [FAIL] $1"; fail=$((fail+1)); }
chk(){ if eval "$2"; then ok "$1"; else no "$1"; fi; }

echo "== IG-Toolchain & Struktur (Modus: $MODE) =="
chk "ig.ini mit Template" "grep -q '^template' ig.ini"
chk "sushi-config canonical" "grep -q '^canonical:' sushi-config.yaml"
chk "FHIR R4 4.0.1" "grep -q 'fhirVersion: 4.0.1' sushi-config.yaml"
# In migrierten Modulen kommen die Basisprofile oft transitiv (z. B. via
# kds.base); eine direkte Pin-Pruefung gilt nur fuer das Template selbst.
if [ "$MODE" = "template" ]; then
  chk "de.basisprofil.r4 gepinnt (nicht current)" "grep -qE 'de.basisprofil.r4: [0-9]' sushi-config.yaml"
fi
chk "Dependencies exakt gepinnt (kein current/dev)" "! grep -E '^\s{2}[a-z0-9.-]+:\s*(current|dev)\s*$' sushi-config.yaml | grep -vq '#'"

echo "== Sprache: deutsch fuehrend (Governance §4.4) =="
chk "i18n-default-lang: de" "grep -q 'i18n-default-lang: de' sushi-config.yaml"
chk "i18n-lang enthaelt en" "grep -A2 'i18n-lang:' sushi-config.yaml | grep -q '\- en'"
chk "translation-sources en" "grep -q 'input/translations/en' sushi-config.yaml"
chk "EN .po vorhanden" "ls input/translations/en/*.po >/dev/null 2>&1"

echo "== Manteldokument-Pflichtseiten =="
for f in index use-cases data-sets uml conformance context references changes downloads translationinfo; do
  chk "pagecontent/$f.md" "test -f input/pagecontent/$f.md"
done

echo "== Best Practices (EU/International) =="
chk "Zielgruppen/Intended Audience" "grep -qi 'Zielgruppen' input/pagecontent/index.md"
chk "Model-to-Profile-Mapping" "grep -qi 'Model-to-Profile' input/pagecontent/data-sets.md"
if [ "$MODE" = "template" ]; then
  chk "EU-Schichtung (optional)" "grep -qi 'hl7.fhir.eu.base' sushi-config.yaml"
fi
chk "Security & Privacy Seite" "test -f input/pagecontent/security-privacy.md"
chk "Must Support / fehlende Daten" "grep -qi 'Must Support' input/pagecontent/conformance.md"

echo "== FSH-Artefakte (MII-Namenskonventionen) =="
chk "Profil mii-pr-" "grep -rq 'Id: mii-pr-' input/fsh"
chk "Extension mii-ex-" "grep -rq 'Id: mii-ex-' input/fsh"
chk "ValueSet mii-vs-" "grep -rq 'Id: mii-vs-' input/fsh"
chk "CodeSystem mii-cs-" "grep -rq 'Id: mii-cs-' input/fsh"
# Pfadunabhaengig: Module legen das CapabilityStatement z. B. unter
# input/fsh/definitions/ ab, nicht zwingend als input/fsh/capabilitystatement.fsh.
chk "CapabilityStatement (InstanceOf, pfadunabhaengig)" "grep -rqE 'InstanceOf:[[:space:]]*CapabilityStatement' input/fsh"
chk "Logical Model" "grep -rq '^Logical:' input/fsh"

echo "== Workflows (Validierung + Pages) =="
chk "ig-validate.yml" "test -f .github/workflows/ig-validate.yml"
chk "ig-publish-pages.yml" "test -f .github/workflows/ig-publish-pages.yml"
chk "Pages-Deployment" "grep -q 'actions/deploy-pages' .github/workflows/ig-publish-pages.yml"
if [ "$MODE" = "migrated" ]; then
  # Nur die AKTIVE branches:-Zeile prüfen (Kommentare entfernen), sonst matcht der
  # Hinweis-Kommentar in der Vorlage und der Check wäre ein No-Op / False-PASS.
  # Robust gegen Inline- (`[ main ]`) und Listenform (`- main`).
  chk "Pages-Branchfilter = hl7-ig-build (Spec §5a.3)" "awk '!/^[[:space:]]*#/' .github/workflows/ig-publish-pages.yml | grep -A2 -E '^[[:space:]]*branches:' | grep -q 'hl7-ig-build' && ! awk '!/^[[:space:]]*#/' .github/workflows/ig-publish-pages.yml | grep -A2 -E '^[[:space:]]*branches:' | grep -qE '[\"[:space:]]main[\"[:space:]]|[-][[:space:]]+main'"
  echo
  echo "Ergebnis ($MODE): $pass PASS / $fail FAIL"
  test "$fail" -eq 0
  exit $?
fi

echo "== Agenten-Konventionen (AGENTS.md / Agent Skills) =="
chk "AGENTS.md vorhanden" "test -f AGENTS.md"
chk "CLAUDE.md -> AGENTS.md (Symlink)" "test -L CLAUDE.md && test \"\$(readlink CLAUDE.md)\" = 'AGENTS.md'"
chk "SKILL.md vorhanden" "test -f skills/mii-ig-migration/SKILL.md"
chk "SKILL.md Frontmatter name" "grep -q '^name:' skills/mii-ig-migration/SKILL.md"
chk "SKILL.md Frontmatter description" "grep -q '^description:' skills/mii-ig-migration/SKILL.md"
chk "references/ vorhanden" "test -d skills/mii-ig-migration/references"
chk ".claude/skills -> ../skills" "test -L .claude/skills && test \"\$(readlink .claude/skills)\" = '../skills'"
chk ".agents/skills -> ../skills" "test -L .agents/skills && test \"\$(readlink .agents/skills)\" = '../skills'"

echo "== Dokumentation & Provenienz =="
chk "MIGRATION.md" "test -f MIGRATION.md"
chk "CONTRIBUTING.md (Kommentierung/Ballot)" "grep -qi 'Ballot' CONTRIBUTING.md"
chk "SOURCES.md" "test -f SOURCES.md"
chk "README verweist auf SOURCES" "grep -q 'SOURCES.md' README.md"
chk "AGENTS verweist auf SOURCES" "grep -q 'SOURCES.md' AGENTS.md"

echo "== CI-Build, Pages, Registry & Dev-Umgebung =="
chk "Workflow nutzt fhir-ig-action" "grep -rq 'qligier/fhir-ig-action' .github/workflows"
chk "Pages-Deployment (deploy-pages)" "grep -q 'actions/deploy-pages' .github/workflows/ig-publish-pages.yml"
chk ".devcontainer/devcontainer.json" "test -f .devcontainer/devcontainer.json"
chk "devcontainer: MII-Image" "grep -q 'cybernop/vscode-ig-publisher' .devcontainer/devcontainer.json"
chk "devcontainer: .fhir-Mount" "grep -q '.fhir' .devcontainer/devcontainer.json"
chk "devcontainer: FSH-Extension" "grep -q 'vscode-language-fsh' .devcontainer/devcontainer.json"
chk ".vscode/extensions.json (FSH)" "grep -q 'vscode-language-fsh' .vscode/extensions.json"
chk "PUBLISHING.md" "test -f PUBLISHING.md"
chk "PUBLISHING: Pages-Einstellung" "grep -qi 'Build and deployment' PUBLISHING.md"
chk "PUBLISHING: ig-registry/Feed" "grep -q 'ig-registry' PUBLISHING.md"
chk "PUBLISHING: auto-ig-builder" "grep -q 'auto-ig-builder' PUBLISHING.md"
chk "README verweist auf PUBLISHING" "grep -q 'PUBLISHING.md' README.md"

echo "== Logo, Disclaimer, Design & Update-Check =="
chk "MII-Logo-Platzhalter" "test -f input/images/mii-logo-PLATZHALTER.svg"
chk "Disclaimer-Banner (index.md)" "grep -qi 'keine offizielle' input/pagecontent/index.md"
chk "Inoffiziell-Markierung (README)" "grep -qi 'inoffiziell' README.md"
chk "Inoffiziell-Markierung (sushi-config)" "grep -qi 'INOFFIZIELLE' sushi-config.yaml"
chk "DESIGN.md" "test -f DESIGN.md"
chk "DESIGN: Versionierung CalVer" "grep -qi 'YYYY.MINOR.PATCH' DESIGN.md"
chk "DESIGN: Logo-Einbau" "grep -qi 'Logo' DESIGN.md"
chk "Update-Check Workflow" "test -f .github/workflows/dependency-check.yml"
chk "Update-Check deaktivierbar" "grep -q 'ENABLE_UPDATE_CHECK' .github/workflows/dependency-check.yml"
chk "Update-Check erstellt Issue" "grep -q 'gh issue create' .github/workflows/dependency-check.yml"
chk "check-updates.py" "test -f tools/check-updates.py"
chk "dependabot.yml (Actions)" "test -f .github/dependabot.yml"

echo "== Issue-Templates, Kommentar-Auflösung & Lizenz =="
chk "Update-Check läuft monatlich" "grep -q '0 6 1 [*] [*]' .github/workflows/dependency-check.yml"
chk "Dependabot monatlich" "grep -q 'monthly' .github/dependabot.yml"
chk "Issue-Template Ballot-Kommentar" "test -f .github/ISSUE_TEMPLATE/ballot-comment.yml"
chk "Ballot-Template: Verfahrenstyp" "grep -q 'Verfahrenstyp' .github/ISSUE_TEMPLATE/ballot-comment.yml"
chk "Ballot-Template: Kommentar-Typ" "grep -qi 'Kommentar-Typ' .github/ISSUE_TEMPLATE/ballot-comment.yml"
chk "Issue-Template config (Portal-Link)" "grep -q 'portal.hl7.de' .github/ISSUE_TEMPLATE/config.yml"
chk "COMMENT_RESOLUTION.md" "test -f COMMENT_RESOLUTION.md"
chk "Comment-Resolution: Quorum" "grep -qi 'Quorum' COMMENT_RESOLUTION.md"
chk "Comment-Resolution: Reconciliation" "grep -qi 'nicht überzeugend' COMMENT_RESOLUTION.md"
chk "LICENSE (CC-BY-4.0)" "grep -q 'CC-BY-4.0' LICENSE"
chk "NOTICE vorhanden" "test -f NOTICE"
chk "NOTICE: MII-Markenklarstellung" "grep -qi 'Medizininformatik-Initiative' NOTICE"
chk "NOTICE: FHIR-Marke" "grep -q 'FHIR(R)' NOTICE"

echo "== QC, Benachrichtigung & Namensraum-Absicherung =="
chk "QC-Regeln (qc/custom.rules.yaml)" "test -f qc/custom.rules.yaml"
chk "QC: Namenskonvention-Regel" "grep -q 'naming-convention-id' qc/custom.rules.yaml"
chk "CI: main.yml (offizielle Reusable-Workflows)" "test -f .github/workflows/main.yml"
chk "CI nutzt ci_dotnet_validation (Reusable)" "grep -q 'ci_dotnet_validation' .github/workflows/main.yml"
chk "Ressourcen-IDs MII-konform (lm/cps/exa)" "grep -rq 'mii-lm-beispiel' input/fsh && grep -rq 'mii-cps-beispiel' input/fsh && grep -rq 'mii-exa-beispiel' input/fsh"
chk "NOTIFICATIONS.md" "test -f NOTIFICATIONS.md"
chk "NOTIFICATIONS: Releases-Atom-Feed" "grep -q 'releases.atom' NOTIFICATIONS.md"
chk "CI: RELEASE-Job + JAVA-Validation" "grep -q 'RELEASE' .github/workflows/main.yml && grep -q 'ci_java_validation' .github/workflows/main.yml"
chk "advisor.json (Validator Advisor Framework)" "test -f advisor.json"
chk "QC-Namensregex vollständig (qst/obsdef/msr)" "grep -q 'qst|obsdef|msr' qc/custom.rules.yaml"
chk "FSH-name Upper_Snake_Case (MII_PR_)" "grep -q 'MII_PR_Beispiel_Patient' input/fsh/profile.fsh"
chk "AGENTS verweist auf qc-SSOT" "grep -q 'Single Source of Truth' AGENTS.md"
chk "DevContainer = MII-Image (cybernop)" "grep -q 'cybernop/vscode-ig-publisher' .devcontainer/devcontainer.json"
chk "Terminologie: SU-TermServ" "grep -q 'mii-termserv' TERMINOLOGY.md"
chk "Notifications: MII-Zulip" "grep -qi 'zulip' NOTIFICATIONS.md"
chk "Meta-Wiki als SSOT (SOURCES)" "grep -q 'MII-Meta-Wiki' SOURCES.md"
chk "Namensraum-Hinweis (sushi-config)" "grep -q 'HINWEIS (Namensraum)' sushi-config.yaml"
chk "NOTICE: Namensraum-Klarstellung" "grep -qi 'der MII vorbehalten' NOTICE"

echo "== Rollen / Perspektiven =="
chk "ROLES.md vorhanden" "test -f ROLES.md"
chk "ROLES: Rollen-zu-Artefakt-Matrix" "grep -q 'Rollen-zu-Artefakt-Matrix' ROLES.md"
chk "ROLES: alle vier Rollen benannt" "grep -q 'Fachvertretung' ROLES.md && grep -q 'Informationsmodell' ROLES.md && grep -q 'FHIR-Profilierung' ROLES.md && grep -q 'DIZ-Pilot' ROLES.md"
chk "Seiten tragen 'Relevant für'-Zeile" "test \$(grep -rl 'Relevant für' input/pagecontent | wc -l) -ge 8"
chk "index.md: Rollen-Abschnitt" "grep -q 'Rollen im Entwicklungsprozess' input/pagecontent/index.md"
chk "README verweist auf ROLES.md" "grep -q 'ROLES.md' README.md"

echo "== Namensraum (neutral), Perspektive & Changelog =="
chk "canonical neutral (example.org)" "grep -q 'canonical: https://example.org/fhir/kds-sample' sushi-config.yaml"
chk "Package-Id neutral (example.fhir.kds.sample)" "grep -q 'id: example.fhir.kds.sample' sushi-config.yaml"
chk "Publisher nicht 'MII'" "! grep -q 'name: Medizininformatik-Initiative' sushi-config.yaml"
chk "ig.ini zeigt auf neue IG-Id" "grep -q 'ImplementationGuide-example.fhir.kds.sample.json' ig.ini"
chk "Issue-Template: Perspektive/Rolle" "grep -q 'Perspektive' .github/ISSUE_TEMPLATE/ballot-comment.yml"
chk "CHANGELOG.md vorhanden" "test -f CHANGELOG.md"
chk "CHANGELOG: Keep-a-Changelog-Format" "grep -qi 'Keep a Changelog' CHANGELOG.md"

echo "== Template, Security/Community, Terminologie, KI =="
chk "Template = fhir2.base.template" "grep -q 'template = fhir2.base.template#current' ig.ini"
chk "fhir.base nicht mehr aktiv gesetzt" "! grep -qE '^template = fhir.base.template' ig.ini"
chk "Windows _genonce.bat" "test -f _genonce.bat"
chk "Windows _updatePublisher.bat" "test -f _updatePublisher.bat"
chk "SECURITY.md" "test -f SECURITY.md"
chk "CODE_OF_CONDUCT.md (Contributor Covenant)" "grep -qi 'Contributor Covenant' CODE_OF_CONDUCT.md"
chk "CODEOWNERS" "test -f .github/CODEOWNERS"
chk "TERMINOLOGY.md (SNOMED/LOINC-Lizenz)" "grep -qi 'SNOMED CT' TERMINOLOGY.md && grep -qi 'LOINC' TERMINOLOGY.md"
chk "AI_USAGE.md" "test -f AI_USAGE.md"
chk "DSGVO/Synthetik-Hinweis (Beispiele)" "grep -qi 'synthetisch' input/pagecontent/security-privacy.md && grep -qi 'DSGVO' input/fsh/examples.fsh"

echo "== Erweiterungen (Translation, latest SUSHI, Migration-Branch, Wiki-Skill) =="
chk "Profil: Translation-Extension" "grep -q 'StructureDefinition/translation' input/fsh/profile.fsh"
chk "DevContainer: latest SUSHI" "grep -q 'fsh-sushi@latest' .devcontainer/devcontainer.json"
chk "DevContainer: latest-Image" "grep -q 'vscode-ig-publisher:latest' .devcontainer/devcontainer.json"
chk "Migration: Vorlagen-Beispiele entfernen" "grep -qi 'Vorlagen-Beispiele' skills/mii-ig-migration/references/migration-agent-spec.md && grep -qi 'examples.fsh' MIGRATION.md"
chk "Migration: isolierter Branch hl7-ig-build" "grep -q 'hl7-ig-build' skills/mii-ig-migration/references/migration-agent-spec.md && grep -q 'hl7-ig-build' MIGRATION.md"
chk "Manifest: never_touch_default_branch" "grep -q 'never_touch_default_branch' skills/mii-ig-migration/references/agent-manifest.yaml"
chk "Skill: wiki-consistency-check" "test -f skills/wiki-consistency-check/SKILL.md"
chk "Skill: Prüfmatrix" "test -f skills/wiki-consistency-check/references/check-matrix.md"

echo "== Kommentarauflösung (zwei Schichten) =="
chk "COMMENT_RESOLUTION: interne Phase (Governance/NSG)" "grep -q 'Interne Kommentierung' COMMENT_RESOLUTION.md && grep -q 'NSG' COMMENT_RESOLUTION.md"
chk "COMMENT_RESOLUTION: öffentliche Phase (HL7-DE)" "grep -q 'Öffentliche Kommentierung' COMMENT_RESOLUTION.md && grep -q 'HL7' COMMENT_RESOLUTION.md"
chk "COMMENT_RESOLUTION: Rollen-Schnellstart + Fristen" "grep -q 'Schnellstart' COMMENT_RESOLUTION.md && grep -q '6 Wochen' COMMENT_RESOLUTION.md"
chk "Ballot-Template: Phase-Feld (optional)" "grep -q 'id: phase' .github/ISSUE_TEMPLATE/ballot-comment.yml"

echo "== CONTRIBUTING: Branching/Release/Packaging =="
chk "CONTRIBUTING: Branching-Abschnitt" "grep -q 'Branching, Release-Tagging' CONTRIBUTING.md"
chk "CONTRIBUTING: dev/main/release-Branches" "grep -q 'release/v' CONTRIBUTING.md && grep -q '\`dev\`' CONTRIBUTING.md"
chk "CONTRIBUTING: CalVer-Tagging + RELEASE-Job" "grep -q 'CalVer' CONTRIBUTING.md && grep -q 'RELEASE' CONTRIBUTING.md"
chk "CONTRIBUTING: Packaging via Simplifier + Zulip" "grep -q 'Simplifier' CONTRIBUTING.md && grep -qi 'zulip' CONTRIBUTING.md"
chk "CONTRIBUTING: Namenskonvention -> qc-SSOT (keine Teilliste)" "grep -q 'Single Source of Truth' CONTRIBUTING.md"

echo "== README & Dateinamen-Konvention =="
chk "README: kein Repo-Namensvorschlag" "! grep -q 'Vorschlag für Repository-Name' README.md"
chk "README: neutrale Lizenz (kein MII-Copyright)" "grep -q 'Kein MII-Copyright' README.md && ! grep -qE 'Medizininformatik-Initiative\\.$' README.md"
chk "README: Modul-Beschreibungs-Geruest + IG-Crosswalk" "grep -q 'Kurzbeschreibung' README.md && grep -q 'maßgebliche IG-Abschnitte' README.md"
chk "README: Orientierung Spezifizierer + Kommentierer" "grep -q 'Für Spezifizierende' README.md && grep -q 'Für Kommentierende' README.md"
chk "README: Struktur listet beide Skills" "grep -q 'skills/mii-ig-migration/' README.md && grep -q 'skills/wiki-consistency-check/' README.md"
chk "Dateinamen: keine mehrteiligen Hyphen-Top-Level-MDs" "! ls -1 *.md | grep -E '[A-Za-z]+-[A-Za-z]+.*\\.md'"
chk "DESIGN: Dateinamen-Konvention dokumentiert" "grep -q 'Dateinamen-Konventionen' DESIGN.md"

echo "== Migrations-Skill: Eingaben =="
chk "MODULE_METADATA präzise (§2.1 mit Feldern)" "grep -q '2.1' skills/mii-ig-migration/references/migration-agent-spec.md && grep -q 'package_id' skills/mii-ig-migration/references/migration-agent-spec.md && grep -q 'module_abbr' skills/mii-ig-migration/references/migration-agent-spec.md"
chk "SKILL.md verweist auf §2.1" "grep -q '2.1' skills/mii-ig-migration/SKILL.md"

echo
echo "Ergebnis: $pass PASS / $fail FAIL"
test "$fail" -eq 0
