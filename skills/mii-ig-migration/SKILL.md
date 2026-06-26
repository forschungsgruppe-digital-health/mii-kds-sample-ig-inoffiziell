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

## Baut auf `ig-analyze` auf (Vorab-Analyse)
Dieser Skill **setzt die `ig-analyze`-Analyse voraus und konsumiert deren Ergebnis** als
Datengrundlage — `ig-analyze` ist Schritt 0:

```
python3 tools/ig-stats.py run <SOURCE_REPO_URL> -o .ai-log/ig-analyze
```

Die erzeugte `ig-stats.json` steuert die Migration:
- **Scope/Go & Erwartung** ← `effort` (manuell + KI), `maturity`, `risk`.
- **Welche Version migrieren** ← `contained_igs.folders[0]` (aktueller IG-Ordner; nicht alle
  Versions-/Sprachvarianten — siehe Leitplanke „aktuelle Version", `cross_ig_block_count`).
- **Direktiven-Arbeitsliste** ← `directives.occurrences`/`by_label` (Checkliste für Schritt 4).
- **Sprachumfang** ← `linguistics.languages` (Schritt 5). **Pflichtseiten** ←
  `narrative.mandatory_missing_in_target` (Schritt 4).

## Ablauf (Kurzform)
0. **Vorab-Analyse mit `ig-analyze`** (Scope, zu migrierender IG-Ordner, Direktiven-/
Sprach-/Pflichtseiten-Inventar) 1. Inventarisierung der Quelle (übernimmt Schritt 0)
→ `source-inventory` 2. Skelett aus der Vorlage 3. Artefakte übernehmen (ggf. `gofsh`),
IDs/URLs unverändert 4. Narrative gemäß Crosswalk migrieren (Pflichtabschnitte ergänzen)
5. Mehrsprachigkeit (`.po`, deutsch führend) 6. Build & QA (`sushi`, IG Publisher,
`Errors: 0`) 7. Bericht 8. Pull Request. Vollständige Schritte: `references/migration-agent-spec.md`.

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
- [`../ig-analyze/SKILL.md`](../ig-analyze/SKILL.md) — **Vorab-Analyse (Schritt 0)**, liefert die `ig-stats.json` als Datengrundlage
- [`references/migration-agent-spec.md`](references/migration-agent-spec.md) — vollständige, herstelleragnostische Spezifikation
- [`references/agent-manifest.yaml`](references/agent-manifest.yaml) — deklaratives Fähigkeiten-/Berechtigungs-Manifest
- [`MIGRATION.md`](../../MIGRATION.md), [`README.md`](../../README.md), [`CONTRIBUTING.md`](../../CONTRIBUTING.md)
