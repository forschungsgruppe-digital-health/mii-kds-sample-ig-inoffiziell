# MII KDS Sample IG — **inoffizielle** Vorlage & Migrationsziel

> **⚠️ Inoffiziell.** Dieses Repository ist eine **inoffizielle** Vorlage / ein
> Sample-IG. Es ist **kein** offiziell veröffentlichtes, freigegebenes oder
> ballotiertes Modul der Medizininformatik-Initiative (MII) und steht in keiner
> offiziellen Verbindung zur MII. Logo/Marken Dritter sind Platzhalter.

Ein minimaler, lauffähiger **Sample-Implementierungsleitfaden** des MII-Kerndatensatzes
(analog zu HL7 `FHIR/sample-ig`). Er dient als **Vorlage** für neue Module und als
**Migrationsziel** für bestehende, bisher auf Simplifier publizierte Module.

- **Sprache:** Deutsch ist führend/verbindlich (KDS-Governance), Englisch optional.
- **Struktur:** folgt dem MII-KDS-Meta-Manteldokument (jeweils aktuelle Fassung) und den
  HL7-IG-Best-Practices.
- **Toolchain:** FSH/SUSHI → HL7 FHIR IG Publisher → GitHub Pages.

---

## Das Modul — Kurzbeschreibung (Platzhalter, bitte ausfüllen)

Diese Felder fassen das Modul für Einsteiger:innen zusammen. Die **maßgeblichen,
ausführlichen** Inhalte stehen in den jeweiligen IG-Seiten (`input/pagecontent/`); hier
nur eine kurze Zusammenfassung mit Verweis.

> **Modul:** ‹MII KDS Modul «Name»›
> **Status:** ‹in Entwicklung | Kommentierung | freigegeben› · **Version:** ‹2026.0.0(-ballot)›
> **Hintergrund:** ‹Welcher Bedarf/welche Lücke wird adressiert?›
> **Zweck & Ziele:** ‹Was soll mit dem Modul erreicht werden, welcher Nutzen?›
> **Kontext & Abgrenzung:** ‹Einordnung, Bezug zu anderen KDS-Modulen, was NICHT abgedeckt ist.›
> **Geltungsbereich (Scope):** ‹Welche Daten/Prozesse/Versorgungssettings?›
> **Zielgruppen:** ‹DIZ/Implementierende, Forschende, Hersteller, Fachvertretung …›

### Crosswalk: Beschreibung ↔ maßgebliche IG-Abschnitte
Wo die ausführliche Fassung steht (für Spezifizierende zum Pflegen, für Kommentierende
zum Nachschlagen):

| Aspekt | Was hier zusammengefasst wird | Maßgebliche Quelle |
|--------|-------------------------------|--------------------|
| Hintergrund, Zweck, Ziele | Motivation, Nutzen | [`input/pagecontent/index.md`](input/pagecontent/index.md) |
| Kontext & Abgrenzung, Bezüge | Einordnung, Modulbezüge | [`input/pagecontent/context.md`](input/pagecontent/context.md), [`references.md`](input/pagecontent/references.md) |
| Geltungsbereich & Anwendungsfälle | Scope, Szenarien | [`input/pagecontent/use-cases.md`](input/pagecontent/use-cases.md) |
| Datensätze & Informationsmodell | Datenelemente, UML, Mapping | [`input/pagecontent/data-sets.md`](input/pagecontent/data-sets.md), [`uml.md`](input/pagecontent/uml.md) |
| Konformität | Must-Support, fehlende Daten, Such-API | [`input/pagecontent/conformance.md`](input/pagecontent/conformance.md) |
| FHIR-Artefakte | Profile, Extensions, ValueSets, CapabilityStatement | [`input/fsh/`](input/fsh/) |
| Terminologien | CodeSystems/ValueSets, Versionen | [`TERMINOLOGY.md`](TERMINOLOGY.md), IG-Terminologieseite |
| Sicherheit & Datenschutz | Schutzbedarf, Pseudonymisierung | [`input/pagecontent/security-privacy.md`](input/pagecontent/security-privacy.md) |
| Release Notes & Änderungen | Änderungen, Abhängigkeiten | [`input/pagecontent/changes.md`](input/pagecontent/changes.md) |
| Impressum/Autoren/Disclaimer | Rechte, Beteiligte | [`LICENSE`](LICENSE), [`NOTICE`](NOTICE) |

## Orientierung

**Für Spezifizierende / Modulteam**
- Modulinhalte pflegen: Narrative in [`input/pagecontent/`](input/pagecontent/), FHIR-Artefakte in [`input/fsh/`](input/fsh/).
- Namens-/Versionskonventionen: maßgeblich [`qc/custom.rules.yaml`](qc/custom.rules.yaml) + [MII-Meta-Wiki](https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki).
- Lebenszyklus, **Branching/Release/Packaging** und Ballotierung: [`CONTRIBUTING.md`](CONTRIBUTING.md).
- Lokaler Build: siehe „Schnellstart"; Publikation/Registry/Pages: [`PUBLISHING.md`](PUBLISHING.md).

**Für Kommentierende**
- Gerenderten IG ansehen (Pages-Vorschau, siehe `PUBLISHING.md`).
- Kommentar als **GitHub-Issue** anlegen (Template „Kommentar / Ballot-Eintrag");
  **eine Fundstelle pro Issue**, mit Begründung.
- Ablauf & Schnellstart: [`COMMENT_RESOLUTION.md`](COMMENT_RESOLUTION.md). **Du musst das Verfahren nicht selbst
  wählen** — es ergibt sich aus der aktuell angekündigten Phase; das Modulteam ordnet zu.

## Schnellstart (lokal)

```bash
./_updatePublisher.sh   # IG Publisher laden/aktualisieren
./_genonce.sh           # SUSHI + Build  ->  output/index.html, output/qa.html
```

Voraussetzungen: Java 17+, Node 20+, `npm i -g fsh-sushi`, Ruby + [Jekyll](https://jekyllrb.com/docs/installation/)
(HTML-Build des IG Publishers; `_genonce.*` prüft dies im Preflight).

**Schnellstes Setup:** Repo in VS Code öffnen → „Reopen in Container" (Devcontainer
richtet Java, Node, SUSHI und die IG-Publisher-Abhängigkeiten automatisch ein).
Die `publisher.jar` selbst wird beim ersten `./_genonce.sh`-Lauf bzw. via
`./_updatePublisher.sh` geladen.

### CI/CD-Setup (für instanziierte Repos)

`main.yml` (MII-Reusable-Workflows) benötigt folgende **Repository-Secrets** und
**-Variablen** — ohne sie scheitern DOTNET-Validation, JAVA-Validation bzw.
Zulip-Notify:

| Typ | Name | Zweck |
|-----|------|-------|
| Secret | `SIMPLIFIER_USERNAME`, `SIMPLIFIER_PASSWORD` | DOTNET-/Firely-QC gegen Simplifier |
| Secret | `ZULIP_API_KEY` | Release-Benachrichtigung (Job `NOTIFY_ZULIP`) |
| Variable | `SUSHI_VERSION` | SUSHI-Pin der CI |
| Variable | `JAVA_VALIDATION_OPTIONS`, `JAVA_VALIDATOR_VERSION` | JAVA-Validation-Parameter |
| Variable | `ENABLE_UPDATE_CHECK` | `false` deaktiviert den monatlichen Update-Check |

## Struktur

Die Dateien sind in zwei Gruppen geteilt: **(A) Basis** — gehört in den fertigen,
migrierten Modul-IG; **(B) Vorlage & Migration** — dient nur der Erklärung dieser
Vorlage bzw. der Migration und wird im migrierten Modul i. d. R. **nicht** benötigt
(entfernbar via [`skills/template-sanitize/`](skills/template-sanitize/SKILL.md)).

### A) Basis — essenziell für den fertigen IG

```
# IG-Konfiguration & Build-Eingang
ig.ini                          Template-Auswahl + IG-Resource
sushi-config.yaml               IG-Parameter, Menü, Seiten, i18n (de führend), Dependencies
package.json                    FHIR-Package-Metadaten (Name/Version/Dependencies)
publication-request.json        Angaben für die HL7-Publikationskette

# Inhalte (Quellen)
input/fsh/                      Profile, Extensions, ValueSets, CodeSystems, Logical Model, CapabilityStatement, Beispiele
input/pagecontent/              Narrative (deutsch) gemäß Manteldokument
input/translations/en/          Optionale EN-Übersetzung (Translation-Supplements)
input/images/                   Diagramme (UML etc.)
input/includes/                 IG-Publisher-Includes (Fragmente)
input/ignoreWarnings.txt        Erwartete/akzeptierte QA-Warnungen

# Qualitätssicherung
qc/custom.rules.yaml            QC-Regeln (Firely-Format) — Namenskonvention-SSOT
advisor.json                    HL7-Validator-Advisor (Suppressions)

# CI/CD & Automatisierung (GitHub)
.github/workflows/              main.yml (MII-Reusable: DOTNET/JAVA-Validation, Release, Zulip) + IG-Build, Pages, Update-Check
.github/dependabot.yml          Dependabot (GitHub-Actions-Updates als PRs)
.github/ISSUE_TEMPLATE/         Issue-Formulare (Kommentar/Ballot nach HL7-DE-Schema, technisch) + Portal-Links
.github/CODEOWNERS              Review-Zuständigkeiten (Platzhalter)
tools/check-updates.py          Versions-/Abhängigkeits-Check (vom Update-Workflow genutzt)

# Lokale Entwicklung
.devcontainer/                  VS-Code-Devcontainer (Java + Node + SUSHI + IG Publisher)
.vscode/extensions.json         Empfohlene Editor-Erweiterungen (FSH, YAML, Markdown)
_genonce.sh / .bat              Lokaler Einmal-Build (SUSHI + IG Publisher)
_updatePublisher.sh / .bat      IG Publisher laden/aktualisieren

# Prozess-, Governance- & Community-Dokumentation (modulweit nützlich)
CONTRIBUTING.md                 Beiträge, Branching/Release/Packaging, Kommentierung/Ballotierung
COMMENT_RESOLUTION.md           Kommentierung & Auflösung (Phasen: MII-intern + HL7-DE), praxisnah
PUBLISHING.md                   Pages-Vorschau, Registry-Release, HL7-CI-Build-Kette
NOTIFICATIONS.md                Release-Benachrichtigung (Zulip, GitHub Releases/Atom-Feeds, Package-Feed)
TERMINOLOGY.md                  Terminologie-/Lizenzleitfaden (SNOMED CT, LOINC; SU-TermServ)
CHANGELOG.md                    Changelog (Keep a Changelog, CalVer)
README.md                       Dieses Dokument
SECURITY.md                     Security-Policy (Meldeweg)
CODE_OF_CONDUCT.md              Verhaltenskodex (Contributor Covenant v2.1)
LICENSE                         Lizenz (im Modul auf die Modul-Lizenz setzen)
NOTICE                          Herkunft, Marken-/Namensklarstellung, Drittkomponenten
.gitignore                      Ignorierte Build-/Log-Artefakte

# KI-Konfiguration (optional, im Modul nutzbar)
AGENTS.md                       Vendor-neutrale Agent-Anweisungen (CLAUDE.md ist Symlink)
CLAUDE.md  -> AGENTS.md          Symlink für Claude Code
```

### B) Vorlage & Migration — im fertigen Modul i. d. R. entbehrlich

```
# Erklärung dieser Vorlage / Migrationsanleitung (template-sanitize: „immer entfernen")
MIGRATION.md                    Migrationsanleitung (manuell & KI-gestützt) + Checkliste
DESIGN.md                       Logo/Layout/Template, Versionierung, Dateinamen-Konventionen
ROLES.md                        Vier Entwicklungs-Perspektiven (Fach/Modell/FHIR/DIZ): Lesepfade & Matrix
SOURCES.md                      Angewandte Quellen/Spezifikationen/Konventionen (URLs + Status)
AI_USAGE.md                     Transparenz zur KI-Unterstützung an dieser Vorlage
input/images/mii-logo-PLATZHALTER.svg   Platzhalter-Logo (durch echtes Logo ersetzen)
.ai-log/                        Migrations-Artefakte (Inventar, Bericht), falls vorhanden

# Agent-Skills & zugehörige Werkzeuge (Vorlage-/Migrationszweck)
skills/mii-ig-migration/        Migrations-Skill (Simplifier-IG -> HL7-IG)
skills/wiki-consistency-check/  Skill: Repo-Abgleich gegen das MII-Meta-Wiki
skills/template-sanitize/       Skill: Vorlage-/Migrations-Dateien nach Migration entfernen
skills/ig-translate/            Skill: IG ins Englische übersetzen (translate/harvest)
.claude/skills -> ../skills      Claude-Code-Skills (Symlink)
.agents/skills -> ../skills      Open-Standard/Codex-Skills (Symlink)
tools/verify-template.sh        Strukturelle Selbstprüfung der Vorlage (Modus --migrated)
tools/template-sanitize.sh      Werkzeug zum Entfernen der Vorlage-/Migrations-Dateien
tools/ig-translate.sh           Übersetzungs-Werkzeug (scan/validate)
```

> Grenzfälle (z. B. `AGENTS.md`/`CLAUDE.md`, `.devcontainer/`, `tools/check-updates.py`):
> im Modul oft erwünscht, daher in Gruppe A — `template-sanitize` führt sie als
> „abwägen" (Default: behalten). Maßgeblich für die Zuordnung:
> [`skills/template-sanitize/references/sanitize-targets.md`](skills/template-sanitize/references/sanitize-targets.md).

## Mehrsprachigkeit

Konfiguration in `sushi-config.yaml`: `i18n-default-lang: de`, `i18n-lang: [en]`,
`translation-sources: input/translations/en`. Übersetzbar (rendert) sind die Texte
von **StructureDefinition/CodeSystem/Questionnaire** über Translation-Supplements
`input/translations/en/<Typ>-<id>.po` (msgid = dt. Quelltext, msgstr = englisch).
**Nicht** unterstützt: ValueSet, ImplementationGuide-Titel und Menü (bleiben
deutsch). Narrative-Seiten (`*-en.md`) werden vom Publisher noch nicht gerendert.
Übersetzung halbautomatisch via Skill [`skills/ig-translate/`](skills/ig-translate/).

## Dateinamen-Konventionen

- **Top-Level-Dokumente** (Großschreibung): mehrteilige Namen mit **Underscore**
  (`AI_USAGE.md`, `CODE_OF_CONDUCT.md`, `COMMENT_RESOLUTION.md`) — analog zu den von
  GitHub erkannten Community-Dateien.
- **IG-Seiteninhalte** (`input/pagecontent/`) und **Assets** (`input/images/`):
  **lowercase-kebab** (`use-cases.md`, `data-sets.md`, `mii-logo-…​.svg`).
- **FSH-Artefakte:** `name` = Upper_Snake_Case, `id` = kebab — maßgeblich
  [`qc/custom.rules.yaml`](qc/custom.rules.yaml). Details: [`DESIGN.md`](DESIGN.md).

## Lizenz

Inhalte stehen unter **CC BY 4.0** — © 2026 Beitragende dieser inoffiziellen Vorlage
(siehe [`LICENSE`](LICENSE)). **Kein MII-Copyright:** Dies ist eine inoffizielle Vorlage ohne
offizielle Verbindung zur MII. Marken-/Namensrechte (MII, HL7®/FHIR®, SNOMED CT®) sind
von der Lizenz **nicht** erfasst (siehe [`NOTICE`](NOTICE)).
