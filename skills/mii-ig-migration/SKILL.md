---
name: mii-ig-migration
description: >-
  Überführt einen bestehenden, Simplifier-basierten MII-KDS-Implementierungs-
  leitfaden in das HL7-FHIR-IG-Publisher-Format dieses Repos (mehrsprachig,
  deutsch führend) — mit verpflichtendem abschließenden menschlichen Review.
  Aktivieren, wenn eine gerenderte Simplifier-IG-URL und das zugehörige
  Quell-GitHub-Repo nach diesem Zielformat migriert werden sollen.
license: CC-BY-4.0
---

# MII-KDS-IG-Migration

## Wann aktivieren
Wenn ein bestehendes, bisher auf Simplifier publiziertes MII-KDS-Modul in das
IG-Publisher-/GitHub-Pages-Format dieses Repos überführt werden soll.

## Schnellstart
Kopierfertiger Start-Prompt + ausgefülltes Eingabe-Beispiel + Befehlsfolge:
`../../MIGRATION.md` Teil B (§4, B0–B2). Vollständige Schritte/Leitplanken/Gates:
`references/migration-agent-spec.md` (Anhang B = vendor-neutrales Prompt-Gerüst).

## Eingaben
Echte Eingaben (mehr braucht es nicht):
- `SOURCE_RENDERED_IG_URL` — gerenderter Simplifier-IG **[URL]**
- `SOURCE_REPO_URL` — zugehöriges Quell-GitHub-Repo **[URL]**
- `TARGET_TEMPLATE_REPO` — dieses Repo
- **Ziel-`version`** (CalVer) — einzige modul-identifizierende Entscheidung (Default = Quelle)

`MODULE_METADATA` (id, canonical, packageId, dependencies, publisher, Modulname) wird
**nicht eingegeben**, sondern aus `<SOURCE_REPO>/sushi-config.yaml` + `package.json`
gelesen und unverändert übernommen (Bestandsschutz). Details: `references/migration-agent-spec.md` §2.1.

## Ablauf (Kurzform)
1. Inventarisierung der Quelle → `source-inventory` 2. Skelett aus der Vorlage
3. Artefakte übernehmen (ggf. `gofsh`), IDs/URLs unverändert 4. Narrative gemäß
Crosswalk migrieren (Pflichtabschnitte ergänzen) 5. Mehrsprachigkeit (`.po`,
deutsch führend) 6. Build & QA (`sushi`, IG Publisher, `Errors: 0`) 7. Bericht
8. Pull Request. Vollständige Schritte: `references/migration-agent-spec.md`.

## Anwendung auf bestehendes Modul-Repo
Template additiv in einen separaten Branch `hl7-ig-build` einbringen, reale FSH-
Artefakte übernehmen, Vorlagen-Beispiele löschen, IG via GitHub Pages **nur aus
diesem Branch** bauen und verlinken — `dev`/`master`/`main` bleiben unverändert
(Details: `references/migration-agent-spec.md` §5a).

## Verbindliche Leitplanken
- Canonical URLs/IDs bestehender Conformance-Ressourcen **nicht** ändern.
- Deutsch ist Quell-/Default-Sprache; FHIR-Bezeichner englisch.
- FHIR R4 (4.0.1). Keine Fakten-Erfindung (`TODO:REVIEW`).
- **Keine eigenständige Veröffentlichung**; Änderungen ausschließlich via PR.
- **Vorlagen-Beispiele vor Migration löschen** (`input/fsh/examples.fsh` u. Instanzen); nicht mergen.
- **Default-Branch-Schutz:** Arbeit nur im isolierten Branch `hl7-ig-build`; PR-Ziel = `hl7-ig-build`, nie `dev`/`master`/`main`.

## Verpflichtende menschliche Review-Gates
A) URL-/ID-Bestandsschutz + Artefaktvollständigkeit · B) Narrative ·
C) Sprachführung/Übersetzung · D) Freigabe gemäß KDS-Governance.

## Referenzen
- [`references/migration-agent-spec.md`](references/migration-agent-spec.md) — vollständige, herstelleragnostische Spezifikation
- [`references/agent-manifest.yaml`](references/agent-manifest.yaml) — deklaratives Fähigkeiten-/Berechtigungs-Manifest
- [`MIGRATION.md`](../../MIGRATION.md), [`README.md`](../../README.md), [`CONTRIBUTING.md`](../../CONTRIBUTING.md)
