# AGENTS.md — MII KDS Sample IG

Vendor-neutrale Anweisungen für Coding-Agents (Codex, Claude Code u. a.).
Codex liest diese Datei; für Claude Code ist `CLAUDE.md` ein Symlink hierauf.

## Projekt
**Inoffizielle** Sample-/Vorlage-IG des MII-Kerndatensatzes (kein offizielles MII-Modul; HL7 FHIR R4, FSH/SUSHI → IG Publisher
→ GitHub Pages). Deutsch ist führend/verbindlich (KDS-Governance), Englisch optional.

## Build & Validierung
```bash
sushi .            # FSH -> FHIR (muss fehlerfrei sein)
./_updatePublisher.sh && ./_genonce.sh   # vollständiger IG-Build -> output/qa.html
```

## Konventionen / Leitplanken
- Deutsch führend; FHIR-Artefakt-Bezeichner (name/id/Beschreibungen) englisch.
- Technische Namenskonventionen: maßgeblich sind [`qc/custom.rules.yaml`](qc/custom.rules.yaml) (maschinell geprüfter Single Source of Truth) und das [MII-Meta-Wiki](https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki) („Namenskonventionen für FHIR-Ressourcen"). Keine Teillisten hier pflegen.
- Canonical URLs/IDs bestehender Conformance-Ressourcen **nicht** ändern.
- CalVer-Versionierung (`YYYY.MINOR.PATCH`).
- **Keine eigenständige Veröffentlichung**; Änderungen via Pull Request.
- KI-gestützte Beiträge erfordern menschliches Review (siehe [`CONTRIBUTING.md`](CONTRIBUTING.md)).

## Skills (Agent-Skills-Open-Standard)
- [`skills/mii-ig-migration/`](skills/mii-ig-migration/SKILL.md) — Migration Simplifier-IG → HL7 FHIR IG.
- [`skills/wiki-consistency-check/`](skills/wiki-consistency-check/SKILL.md) — Repo gegen MII-Meta-Wiki auf Konsistenz prüfen.
- [`skills/template-sanitize/`](skills/template-sanitize/SKILL.md) — nach validierter Migration die reinen Vorlage-/
  Migrations-Dateien entfernen (auf Bestätigung, Dry-Run-Default).
- [`skills/ig-translate/`](skills/ig-translate/SKILL.md) — IG ins Englische übersetzen (Modus translate/harvest);
  Übersetzungen an die vom Publisher vorgesehenen Stellen ablegen.
- Vendor-Zugriff über Symlinks: Claude Code `.claude/skills/`, Codex/Standard
  `.agents/skills/` — beide zeigen auf `skills/`.

## Siehe auch
[`MIGRATION.md`](MIGRATION.md) · [`CONTRIBUTING.md`](CONTRIBUTING.md) · [`SOURCES.md`](SOURCES.md) (Quellen/Provenienz) · [`README.md`](README.md)
