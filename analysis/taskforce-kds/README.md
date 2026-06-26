# IG-Analyse: MII KDS Diagnose & Person (v2025.0.1)

Diskussionsgrundlage für die **Taskforce KDS**. Erstellt mit dem read-only-Skill
[`ig-analyze`](../../skills/ig-analyze/SKILL.md) dieses Repos — eine objektive,
reproduzierbare Vermessung zweier KDS-Module zum **Vergleich** und zur
**Vorab-Schätzung des Migrationsaufwands** (Simplifier → generischer HL7-FHIR-IG-Publisher).

## Was wurde analysiert

| | Modul Diagnose | Modul Person |
|---|---|---|
| Quelle | github.com/medizininformatik-initiative/kerndatensatzmodul-diagnose | …/kerndatensatzmodul-person |
| Version (Tag) | `v2025.0.1` | `v2025.0.1` |
| Commit | `c2d2ff4` | `122e30f` |

Analyse-Datum: 2026-06-26 · Modus: **statisch** (keine IG-Publisher-Builds).

## Ergebnisdateien

- [`mii-ig-diagnose-report.md`](mii-ig-diagnose-report.md) — Einzelreport Diagnose (+ `…-stats.json`)
- [`mii-ig-person-report.md`](mii-ig-person-report.md) — Einzelreport Person (+ `…-stats.json`)
- [`compare-report.md`](compare-report.md) — Vergleichsreport (Σ Gesamt, Cross-IG-Konsolidierung)

Die `*-stats.json` sind die maschinenlesbaren Rohdaten (festes Schema) für eigene Auswertungen.

## Headline-Vergleich (Auszug — Details in den Reports)

| Kennzahl | Diagnose | Person |
|---|---|---|
| **Enthaltene IG-Ordner** | **5** | **3** |
| Publizierte Artefakte | 13 | 14 |
| Plattform-/FQL-Direktiven (über alle Ordner) | 179 | 334 |
| Doppelte Inhaltsblöcke (davon ordnerübergreifend) | 292 (292) | 135 (119) |
| Aufwand **manuell** (Band) | 51–83 h (L) | 74–120 h (XL) |
| Aufwand **KI-gestützt** (Band) | 30–49 h (L) | 41–67 h (L) |
| Reifegrad | 74/100 | 76/100 |
| Hersteller-Lock-in | 41/100 | 85/100 |

> **⚠ Zentraler Befund — mehrere IG-Ordner je Repo:** Beide Repos enthalten **mehrere
> Versions-/Sprachvarianten** als getrennte Ordner unter `implementation-guides/` (Diagnose:
> 1.x/2024.x/2025 je DE/EN; Person: 2024.x DE/EN + 2025.x DE). Dadurch ist nahezu der gesamte
> Text **ordnerübergreifend dupliziert** (Diagnose 292, Person 119 Blöcke). **Konsequenz:** Die
> Aggregat-Kennzahlen (Direktiven, Wörter, **Aufwand**) summieren über **alle** Ordner und sind
> für die Migration **einer** (der aktuellen) Version deutlich **überzeichnet** — grob im
> Verhältnis der Ordnerzahl nach unten zu korrigieren. Das ist selbst ein Diskussionspunkt für
> die Taskforce (Ablage alter Versionen/Sprachvarianten im Repo).

**Aufschlüsselung je IG-Ordner (aktuell → ältest):** Die Einzelreports enthalten jetzt eine
horizontale Tabelle je IG-Ordner (Seiten, Wörter, Direktiven, Aufwand). Der Aufwand für die
Migration **nur der aktuellen Version** liegt damit weit unter dem Aggregat:

| aktuelle Version | Direktiven | Aufwand manuell (je IG) |
|---|---|---|
| Diagnose `2025` | 51 | ~13–21 h |
| Person `2025.x-DE` | 117 | ~25–41 h |

> **Aufwand wird in Zeit gemessen** (Stunden/Personentage/Kalenderzeit) — bewusst **keine
> Geldgrößen**. Personentage = 8-h-Arbeitstage menschlicher Arbeit; bei der KI-Variante die
> **Bedien-/Review-Zeit** (Prompts, Review-Gates, Korrekturen), **nicht** Rechen-/Wartezeit.

## Wichtige Vorbehalte (bitte beim Lesen beachten)

- **Statische Analyse**: nur Quelldateien + Git-Historie, **kein IG-Publisher-Build**. Build-
  abhängige Größen (Validierungsfehler, Broken Links, Breaking-Change ggü. Vorversion) sind
  **nicht** erhoben (`null`).
- **Schätzungen sind Spannen, kein Festpreis/keine Deadline.** Die Aufwandsfaktoren sind
  Erfahrungswerte und **noch nicht final kalibriert**; Nutzen v. a. **relativ** (Diagnose vs.
  Person), nicht als Absolutzusage.
- **Heuristiken** sind im Report als solche markiert (z. B. Lock-in = Direktiven/Seite,
  Standard-Terminologie-Anteil aus Textvorkommen, Dependency-Veraltung aus CalVer-Jahr).
- Jeder Report enthält im Anhang eine **Methodik-/Metrik-Erklärung** (was jede Kennzahl misst
  und wie sie ermittelt wird) sowie ein **Glossar**.

## Reproduzieren

```bash
git clone --branch v2025.0.1 https://github.com/medizininformatik-initiative/kerndatensatzmodul-diagnose.git /tmp/diagnose
git clone --branch v2025.0.1 https://github.com/medizininformatik-initiative/kerndatensatzmodul-person.git   /tmp/person
python3 tools/ig-stats.py run /tmp/diagnose /tmp/person -o out \
  --label "MII KDS Diagnose v2025.0.1,MII KDS Person v2025.0.1"
```

`tools/ig-stats.py` kann auch direkt Git-URLs verarbeiten; Faktoren/Annahmen sind im Tool
(`EFFORT_FACTORS`, `EFFORT_FACTORS_AI`, `PLANNING_PARAMS`) und in
`skills/ig-analyze/references/report-content.json` **kalibrierbar/erweiterbar**.
