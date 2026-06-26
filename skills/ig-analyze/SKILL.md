---
name: ig-analyze
description: >-
  Vermisst einen oder mehrere FHIR-Implementierungsleitfäden (read-only) und
  erzeugt eine maschinen- + menschenlesbare Statistik — für den objektiven
  Vergleich mehrerer IGs und für die Vorab-Schätzung von Migrationsaufwand,
  Ressourcen (Personenstunden) und Risiken. Baut/migriert nichts. Aktivieren,
  wenn ein IG-Repo analysiert oder mehrere IGs verglichen werden sollen.
license: CC-BY-4.0
---

# ig-analyze

## Wann aktivieren
- **Vergleich** mehrerer FHIR-IGs anhand objektiver Kennzahlen.
- **Scoping vor einer Migration** (`mii-ig-migration`): Aufwand, Ressourcen und
  Risiken eines Quell-IG abschätzen, bevor migriert wird.

Read-only. Ergänzt `mii-ig-migration` (läuft idealerweise davor), ist aber
unabhängig nutzbar.

## Modi (`tools/ig-stats.py`)
- `analyze <ig-dir> [-o stats.json]` — **statische** Vermessung → `ig-stats.json`.
- `report <stats.json> [-o report.md]` — Einzel-IG-Report (Markdown + Mermaid).
- `compare <stats.json…> [-o compare.md]` — Vergleich über N IGs (Markdown + Mermaid).

**Static vs. Full:** Der `analyze`-Modus ist **statisch** (sushi-config/package.json,
FSH-Zählungen, Narrative, Direktiven, Dependencies) — schnell, ohne Build. Metriken,
die einen **IG-Publisher-Build** brauchen (`qa.json`: Errors/Warnings/Broken Links,
Validierung), sind im Katalog als *Build* markiert und im statischen Modus leer/`null`.

## Was gemessen wird
Vollständiger, **per Hand erweiterbarer** Parameter-Katalog (Gruppen A–I, je Metrik
mit Quelle und Nutzen V=Vergleich/A=Aufwand): `references/metrics-catalog.md`.
Ausgabeschema: `references/ig-stats-schema.json`.

## Reporting
- **Maschinenlesbar:** `ig-stats.json` je IG (festes Schema) — für Aggregation,
  Diff über Zeit (CI-Trending) und Vergleich.
- **Menschlich:** Markdown-Report je IG + Vergleichsreport über mehrere IGs, mit
  **Mermaid**-Charts (GitHub-nativ, kein JS): Artefakt-Verteilung (Pie/Bar),
  Binding-Stärken (Stacked Bar), Qualität (Bar), Risiko/Aufwand. Vergleich nutzt
  **normalisierte** Kennzahlen + Ranking/Delta zu einem Referenz-IG.

## Aufwands-/Ressourcen-Modell (Ziel A)
Transparentes Scoring `Σ (Treiber.Menge × Faktor[h])` → Phasen (Vorarbeit/Migration/
Nacharbeit) → Aufwandsband **S/M/L/XL** + Personenstunden-**Spanne**. Treiber u. a.:
GoFSH nötig, # FQL-/Simplifier-Direktiven, # Narrative-Seiten, # id/url-Mismatch,
floating Pins, # QC-Verletzungen, # quell-intrinsische Validierungsfehler. Die
Faktoren stehen im Tool (Sektion `EFFORT_FACTORS`) und sind **kalibrierbar**.

## Verbindliche Leitplanken
- **Read-only.** Keine Änderung am analysierten IG; kein Build erzwingen (außer
  ausdrücklich `--full` in einer späteren Ausbaustufe).
- **Schätzungen als Spanne mit Annahmen** ausweisen, nie als Punktwert. Faktoren
  sind unkalibriert (`TODO:REVIEW`) — Nutzen v. a. **relativ** (IG-A vs. IG-B).
- **Quell-intrinsisch vs. migrationsbedingt** trennen: Fehler, die schon im
  Originalbuild existieren, sind **kein** Migrationsaufwand.
- **Fairer Vergleich** nur über **normalisierte** Kennzahlen (Größe variiert).
- Keine Fakten-Erfindung; fehlende Eingaben → Feld `null`, nicht raten.

## Referenzen
- `references/metrics-catalog.md` — Parameter-Katalog (erweiterbare SSOT).
- `references/ig-stats-schema.json` — JSON-Schema der `ig-stats.json`.
- `../../tools/ig-stats.py` — Analyse-/Report-/Vergleichs-Tool.
- `../mii-ig-migration/references/fql-crosswalk.md` — Direktiven (für Aufwandstreiber).
