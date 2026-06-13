# template-sanitize — Datei-Kategorien (Begründung)

Maschinell maßgeblich ist `tools/template-sanitize.sh` (Single Source of Truth);
diese Datei erläutert die Einordnung. Pfade sind relativ zum Repo-Wurzelverzeichnis.

## ALWAYS — immer entfernen
Dateien, die **ausschließlich** das Vorlage-Repo erklären oder die Migration
unterstützen und in einem publizierten Modul-IG keinen Zweck haben.

| Pfad | Grund |
|------|-------|
| `MIGRATION.md` | Anleitung zur Migration — im Zielmodul gegenstandslos. |
| `DESIGN.md`, `ROLES.md`, `SOURCES.md`, `AI_USAGE.md` | Meta-/Provenienz-Doku der Vorlage. |
| `skills/` | Migrations-/Wiki-/Sanitize-Skills der Vorlage. |
| `tools/verify-template.sh` | Strukturelle Selbstprüfung der Vorlage. |
| `.ai-log/` | Migrations-Artefakte (Inventar, Bericht). |
| `input/images/mii-logo-PLATZHALTER.svg` | Platzhalter-Asset (durch echtes Logo ersetzt). |

## ASK — nur nach Rückfrage entfernen
Vorlagengeprägt, aber im realen Modul oft erwünscht. Default: **behalten**;
Entfernen nur mit `--include-ask` bzw. nach expliziter Nutzerentscheidung.

| Pfad | Hinweis |
|------|---------|
| `CONTRIBUTING.md`, `COMMENT_RESOLUTION.md`, `PUBLISHING.md`, `NOTIFICATIONS.md`, `TERMINOLOGY.md`, `CODE_OF_CONDUCT.md`, `SECURITY.md`, `NOTICE`, `CHANGELOG.md` | Governance-/Community-Doku — Modul hat ggf. eigene oder will sie übernehmen. |
| `AGENTS.md`, `CLAUDE.md`, `.claude/`, `.agents/` | Agent-Discovery; nach Entfernen von `skills/` ggf. obsolet, aber Modul kann eigene Agent-Konfiguration wollen. |
| `.devcontainer/`, `.vscode/` | Lokale Entwicklungsumgebung. |
| `advisor.json`, `tools/check-updates.py` | Validator-Advisor / Update-Check. |

## NEVER — niemals anfassen (Schutzliste)
Modul-Inhalt und Build-Eingang. Ein Treffer bricht das Tool hart ab.

`input/fsh`, `input/pagecontent`, `input/translations`,
`input/ignoreWarnings.txt`, `input/includes`, `sushi-config.yaml`, `ig.ini`,
`package.json`, `publication-request.json`, `qc/`, `.gitignore`, `LICENSE`.

> Nicht aufgeführte CI-Workflows (`.github/`) werden vom Tool **nicht** automatisch
> entfernt: Pages-/Validate-/CI-Workflows gehören meist zum Modul. Bei Bedarf
> einzeln und bewusst von Hand entfernen.
