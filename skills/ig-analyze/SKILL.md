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

## Eingabe & Modi (`tools/ig-stats.py`)
**Eingabe = eine oder mehrere FHIR-IGs als Pfad ODER URL.** `run` ist der Haupt-
einstieg und löst jede Eingabe selbst auf (lokaler Pfad, Git-URL → flacher Clone,
Package-`.tgz` → Download mit reduzierter Analyse):
- `run <input…> [-o OUTDIR] [--label a,b]` — je IG ein eigener Report **+ bei ≥2 IGs
  automatisch ein Vergleichsreport** (`compare-report.md`).
- `analyze <ig-dir> [-o stats.json]` — Einzel-Vermessung → `ig-stats.json` (Power-User).
- `report <stats.json> [-o report.md]` / `compare <stats.json…> [-o compare.md]`.

**Static vs. Full/Reduced:** Standard ist **statisch** (sushi-config/package.json,
FSH-Zählungen, Narrative, Direktiven, Dependencies, Linguistik, Dopplungen, Hygiene) —
schnell, ohne Build. Eine reine Package-Quelle (`.tgz`) liefert eine **reduzierte**
Analyse (nur generierte Ressourcen). Build-Metriken (`qa.json`: Errors/Warnings/Broken
Links, Validierung) sind im Katalog als *Build* markiert und statisch leer/`null`.

## Was gemessen wird
Vollständiger, **per Hand erweiterbarer** Parameter-Katalog (Gruppen **A–N**, je Metrik
mit Quelle und Nutzen V=Vergleich/A=Aufwand/S=Strategie/P=Planung/R=Risiko):
`references/metrics-catalog.md`. Umfasst neben Umfang/Komplexität/Aufwand auch:
**linguistische** Kennzahlen, **Dopplungen** und **ungenutzte Dateien** (J);
**Reife & Freigabe** (K), **Strategie/Lock-in/Zukunftssicherheit** (L), **Planung &
Terminierung** (M) und **Risiko & Compliance** (N). **Maßstab für Aufwand ist Zeit**
(Stunden/Personentage/Kalenderzeit), **bewusst keine Geld-/Kostenrechnung**. Planungs-
Annahmen kalibrierbar (`PLANNING_PARAMS`); Heuristiken sind als solche markiert, nicht
statisch erhebbare Größen bleiben `null` (z. B. Breaking-Change nur per Build).
Ausgabeschema: `references/ig-stats-schema.json`. Laientexte, Direktiven-Muster, Glossar
und **Metrik-Erklärungen** (self-contained, neutral): `references/report-content.json`.

## Reporting
- **Maschinenlesbar:** `ig-stats.json` je IG (festes Schema) — für Aggregation,
  Diff über Zeit (CI-Trending) und Vergleich.
- **Menschlich:** Markdown-Report je IG + Vergleichsreport, **GitHub-zentriert**
  (`<div align="center">`), mit **farbigen Mermaid**-Charts (Pie/Quadrant, kein JS),
  numerisch **absteigend** sortiert. Aufbau: **Executive Summary für Entscheider**
  (CTO/CIO, laienverständlich) → Kennzahlen-Überblick → Inhaltsumfang & Hygiene →
  Aufwand (manuell + KI, **Zeit**) → **Reife & Freigabe** → **Strategie (Lock-in/
  Zukunftssicherheit)** → **Planung & Terminierung** → **Risiko & Compliance** →
  Empfehlungen → Direktiven-Mapping → **Anhang** (Detailaufschlüsselung +
  **Methodik/Metrik-Erklärung** + **Glossar**). Vergleich aggregiert zusätzlich
  **Σ Gesamt** (Umfang + Aufwand) und zeigt **Cross-IG-Konsolidierung**; nutzt
  **normalisierte** Kennzahlen. Jeder Report enthält im Anhang die **Metrik-Erklärung**.
- **Neutral & self-contained:** Der Report referenziert **keine** anderen Repo-Skills/
  Dateien; alle Empfehlungen sind allgemeines IG-Publisher-Wissen.

## Aufwands-/Ressourcen-Modell (Ziel A)
Transparentes Scoring `Σ (Treiber.Menge × Faktor[h])` → Aufwandsband **S/M/L/XL** +
Personenstunden-**Spanne**, in **zwei** Varianten:
- **manuell** (`EFFORT_FACTORS`),
- **KI-gestützt teilautomatisiert** (`EFFORT_FACTORS_AI`) — **Human-in-the-Loop,
  Review-Gates, hersteller-/modellagnostisch**: die KI transformiert wiederkehrende
  Muster, Menschen prüfen an Kontrollpunkten (feste Gate-Pauschale; unbekannte
  Direktiven zum Manuell-Satz), plus ausgewiesene **Ersparnis %**.

Treiber u. a.: GoFSH nötig, # Direktiven (bekannt/unbekannt), # Narrative-Seiten,
floating Pins. Faktoren stehen im Tool und sind **kalibrierbar**.

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
- `references/report-content.json` — Laientexte, Glossar, Direktiven-Muster
  (hand-editierbar, neutral, self-contained).
- `../../tools/ig-stats.py` — Analyse-/Report-/Vergleichs-Tool (`run`/`analyze`/`report`/`compare`).
