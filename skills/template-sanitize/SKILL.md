---
name: template-sanitize
description: >-
  Entfernt nach einer ABGESCHLOSSENEN Migration die Dateien aus dem migrierten
  Modul-Repo, die ausschließlich der Erklärung dieses Vorlage-Repos oder der
  Migration selbst dienen (Migrations-/Vorlagen-Doku, Skills, Selbstprüf-Tool,
  Platzhalter-Assets). Aktivieren, wenn die Vorlage komplett übernommen wurde und
  der Arbeitsstand im Branch `hl7-ig-build` validiert ist — nur auf ausdrückliche
  Bestätigung des Nutzers.
license: CC-BY-4.0
---

# template-sanitize

## Wann aktivieren
Nach einer **erfolgreich validierten** Migration (Build/QA grün, Review-Gates der
`mii-ig-migration`-Spec durchlaufen), wenn die Vorlage **als Ganzes** in ein
Modul-Repo übernommen wurde und nun die reinen Vorlage-/Migrations-Artefakte
entfernt werden sollen. Komplementär zu `mii-ig-migration` §5a.2: Statt diese
Dateien gar nicht erst zu übernehmen, räumt dieser Skill sie nachträglich
deterministisch auf.

## Verbindliche Leitplanken
- **Nur auf Bestätigung.** Niemals ungefragt löschen. Zuerst Dry-Run vorlegen,
  Plan vom Nutzer freigeben lassen, dann erst `--apply`.
- **Nur im isolierten Branch `hl7-ig-build`.** `dev`/`master`/`main` bleiben
  unberührt (das Tool verweigert `--apply` außerhalb von `hl7-ig-build`).
- **Reversibel.** Entfernen via `git rm`; vor dem Commit prüfbar, jederzeit per
  `git restore`/`git checkout` rücknehmbar.
- **NEVER-Schutzliste.** Modul-Inhalt und Build-Eingang (FSH, pagecontent,
  translations, sushi-config, ig.ini, qc, package.json …) werden nie angetastet;
  ein Treffer dort bricht hart ab.
- **Keine Halb-Listen pflegen.** Maßgeblich sind die Kategorien in
  `tools/template-sanitize.sh` (SSOT) bzw. `references/sanitize-targets.md`.

## Ablauf
1. **Vorbedingung prüfen:** Branch = `hl7-ig-build`, Migration validiert
   (`sushi` fehlerfrei, IG-Publisher-Build grün, `verify-template.sh --migrated`
   bestanden).
2. **Dry-Run:** `tools/template-sanitize.sh` ausführen → Plan (ALWAYS- und
   ASK-Liste) dem Nutzer zeigen.
3. **Bestätigung einholen:** Welche ASK-Einträge (Governance-/CI-/Devcontainer-
   Dateien) sollen bleiben, welche entfernt werden? ALWAYS-Liste bestätigen.
4. **Anwenden:** `tools/template-sanitize.sh --apply` (optional `--include-ask`).
5. **Nachbereiten:** Verbleibende Verweise auf entfernte Dateien bereinigen
   (z. B. `README`/`AGENTS.md`-Struktur, Workflow-/Skill-Hinweise). `sushi` und
   IG-Build erneut grün stellen, dann committen.

## Kategorien (Kurzfassung; SSOT: `tools/template-sanitize.sh`)
- **ALWAYS** (reine Vorlage-/Migrations-Erklärung): `MIGRATION.md`, `DESIGN.md`,
  `ROLES.md`, `SOURCES.md`, `AI_USAGE.md`, `skills/`, `tools/verify-template.sh`,
  `.ai-log/`, Platzhalter-Logo.
- **ASK** (vorlagengeprägt, evtl. im Modul erwünscht): Governance-Doku
  (`CONTRIBUTING`, `COMMENT_RESOLUTION`, `PUBLISHING`, `NOTIFICATIONS`,
  `TERMINOLOGY`, `CODE_OF_CONDUCT`, `SECURITY`, `NOTICE`, `CHANGELOG`),
  `AGENTS.md`/`CLAUDE.md` + Skill-Symlinks, `.devcontainer/`, `.vscode/`,
  `advisor.json`, `tools/check-updates.py`.
- **NEVER** (Modul-Inhalt/Build-Eingang): `input/fsh`, `input/pagecontent`,
  `input/translations`, `input/ignoreWarnings.txt`, `input/includes`,
  `sushi-config.yaml`, `ig.ini`, `package.json`, `publication-request.json`,
  `qc/`, `.gitignore`, `LICENSE`.

## Referenzen
- `tools/template-sanitize.sh` — ausführbares Tool (Dry-Run-Default, `--apply`).
- `references/sanitize-targets.md` — Kategorien mit Begründung.
- `../mii-ig-migration/references/migration-agent-spec.md` §5a.2 — Übernahmeliste.
