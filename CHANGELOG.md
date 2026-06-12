# Changelog

Wird **abschließend beim Finalisieren** der Vorlage erstellt.
Format: [Keep a Changelog](https://keepachangelog.com/de/1.1.0/); Versionierung CalVer
(`JJJJ.MINOR.PATCH`).

> Inhaltliche Release Notes des IG-Moduls stehen separat unter
> `input/pagecontent/changes.md`.

## [Unreleased]
_(in Arbeit — Einträge werden zum Abschluss zusammengeführt)_

### Fixed (Befunde aus Migrations-Dry-Run am Modul Dokument, 2026-06-12)
- `sushi-config.yaml`: ungültigen IG-Parameter `show-inherited-extensions` entfernt
  (nicht in `ig-parameters|1.1.2`; verursachte 4 Publisher-Validierungsfehler).
- Skill-Discovery-Symlinks ergänzt: `.claude/skills` und `.agents/skills` → `skills/`,
  `CLAUDE.md` → `AGENTS.md` (in `AGENTS.md` dokumentiert, fehlten aber).
- `_genonce.sh`: Preflight-Prüfung auf Jekyll (Build schlug sonst erst nach
  Minuten am letzten Schritt fehl); Ruby/Jekyll als Voraussetzung in
  `MIGRATION.md` §1 ergänzt.
- `tools/verify-template.sh`: neuer Modus `--migrated` (nur IG-relevante
  Prüfungen für migrierte Modul-Repos); CapabilityStatement-Prüfung
  pfadunabhängig (`InstanceOf:`-Suche statt festem Dateinamen).
- `ig-publish-pages.yml`: Hinweis auf Branch-Filter `hl7-ig-build` bei Anwendung
  auf ein bestehendes Modul-Repo (Spec §5a.3).
- Migrations-Spec §5a.2: präzise Übernahme-/Ausschlussliste der Template-Dateien
  (u. a. Modul-`README`/-CI/`ignoreWarnings.txt` nicht überschreiben).
- `input/pagecontent/*`: defekte Relativlinks `../../ROLES.md` (brachen im
  gerenderten IG) durch Klartext-Verweis ersetzt.
