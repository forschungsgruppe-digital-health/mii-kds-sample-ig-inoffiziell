# IG-Analyse: MII KDS Module (Vergleich)

Diskussionsgrundlage für die **Taskforce KDS**. Erstellt mit dem read-only-Skill
[`ig-analyze`](../../skills/ig-analyze/SKILL.md) dieses Repos — eine objektive,
reproduzierbare Vermessung mehrerer KDS-Module zum **Vergleich** und zur
**Vorab-Schätzung des Migrationsaufwands** (Simplifier → generischer HL7-FHIR-IG-Publisher).

## Was wurde analysiert

Jeweils die **aktuellste veröffentlichte Version** (siehe Simplifier), als voller Git-Clone:

| Modul | Repo (medizininformatik-initiative/…) | Version (Tag) | Commit |
|---|---|---|---|
| Diagnose | `kerndatensatzmodul-diagnose` | `v2025.0.1` | `c2d2ff4` |
| Person | `kerndatensatzmodul-person` | `v2025.0.1` | `122e30f` |
| Meta | `kerndatensatz-meta` | `v2026.0.0` | `6935ebb` |
| Medikation | `kerndatensatzmodul-medikation` | `v2026.0.1` | `58b4996` |
| Labor | `kerndatensatzmodul-labor` | `2026.0.3` | `fa7c64e` |

Analyse-Datum: 2026-06-27 · Modus: **statisch** (keine IG-Publisher-Builds).

## Ergebnisdateien

Je Modul ein Einzelreport (`<id>-report.md` + `<id>-stats.json`) plus
[`compare-report.md`](compare-report.md) (Σ Gesamt, Aufschlüsselung je Repo, Cross-IG-Konsolidierung):
[Diagnose](mii-ig-diagnose-report.md) · [Person](mii-ig-person-report.md) ·
[Meta](mii-ig-meta-report.md) · [Medikation](mii-ig-medikation-report.md) · [Labor](labor-report.md).
Die `*-stats.json` sind die maschinenlesbaren Rohdaten (festes Schema).

## Headline-Vergleich (Auszug — Details in den Reports)

Zeilen **nach Migrationsaufwand aufsteigend** (wie die Spalten im [Vergleichsreport](compare-report.md)):

| Modul (Version) | IG-Ordner | Sprachen | Artefakte | Direktiven¹ | Aufwand manuell¹ | Aufwand KI¹ | Reife | Lock-in | Dopplungen (ordnerübergr.) |
|---|---|---|---|---|---|---|---|---|---|
| Meta (v2026.0.0) | 2 | 1 (—) | **175** | 48 | 12–20 h (M) | 11–17 h | 70 | 52 | 3 (3) |
| Labor (2026.0.3) | 2 | 1 (de) | 20 | 201 | 47–76 h (L) | 29–48 h | 74 | 65 | 73 (73) |
| Diagnose (v2025.0.1) | 5 | 2 (de, en) | 13 | 178 | 51–83 h (L) | 30–49 h | 74 | 41 | 292 (292) |
| Medikation (v2026.0.1) | 2 | 1 (de) | 40 | 316 | 67–110 h (L) | 38–62 h | **50** | **100** | 128 (126) |
| Person (v2025.0.1) | 3 | 2 (de, en) | 14 | 333 | 74–120 h (L) | 41–67 h | 76 | 85 | 135 (119) |

¹ **über alle IG-Ordner summiert** — siehe Caveat unten.

> **⚠ Zentraler Befund — jedes Repo enthält mehrere IG-Ordner:** Alle Module legen **mehrere
> Versions-/Sprachvarianten** als getrennte Ordner unter `implementation-guides/` ab (z.B. Diagnose:
> 1.x und 2024.x je DE/EN + 2025 einzeln = 5; Person: 2024.x DE/EN + 2025.x DE = 3; Meta/Medikation/Labor je 2).
> Dadurch ist Text **ordnerübergreifend dupliziert** (Diagnose 292, Medikation 126, Person 119, Labor 73, Meta 3 Blöcke).
> **Konsequenz:** Die mit ¹ markierten Aggregat-Kennzahlen summieren über **alle** Ordner und sind für die
> Migration **einer** (der aktuellen) Version deutlich **überzeichnet**. Das ist selbst ein Taskforce-Thema
> (Ablage alter Versionen/Sprachvarianten im Repo).

**Aufwand der AKTUELLEN Version je IG** (aus der Je-IG-Aufschlüsselung der Reports, aktuell→ältest):

| Modul | Direktiven (aktuelle Version) | Aufwand manuell (je IG) |
|---|---|---|
| Meta | 43 | ~9–15 h |
| Diagnose | 50 | ~13–21 h |
| Labor | 102 | ~24–39 h |
| Person | 116 | ~25–41 h |
| Medikation | 155 | ~32–52 h |

> **Aufwand wird in Zeit gemessen** (Stunden/Personentage/Kalenderzeit) — bewusst **keine
> Geldgrößen**. Personentage = 8-h-Arbeitstage menschlicher Arbeit; bei der KI-Variante die
> **Bedien-/Review-Zeit** (Prompts, Review-Gates, Korrekturen), **nicht** Rechen-/Wartezeit.

## Wichtige Vorbehalte (bitte beim Lesen beachten)

- **Statische Analyse**: nur Quelldateien + Git-Historie, **kein IG-Publisher-Build**. Build-
  abhängige Größen (Validierungsfehler, Broken Links, Breaking-Change ggü. Vorversion) sind **nicht** erhoben (`null`).
- **Schätzungen sind Spannen, kein Festpreis/keine Deadline.** Faktoren sind Erfahrungswerte,
  **noch nicht final kalibriert**; Nutzen v. a. **relativ** (Modul vs. Modul).
- **Versionsstände gemischt**: Diagnose/Person auf 2025.0.1, Meta/Medikation/Labor bereits auf 2026.x —
  jeweils die aktuelle veröffentlichte Version. Labor (`FSHOnly`) führt keinen IG-`id` im sushi-config (im Report `—`).
- **Heuristiken** sind im Report als solche markiert (Lock-in = Direktiven/Seite, Standard-Terminologie-Anteil
  aus Textvorkommen, Dependency-Veraltung aus CalVer-Jahr). Jeder Report hat im Anhang **Methodik-Erklärung + Glossar**.

## Reproduzieren

**Vollständigen Clone verwenden (kein `--depth 1`)** — sonst sind git-historische Kennzahlen
(Pflege-Kadenz, Bus-Faktor) verfälscht.

```bash
git clone --branch v2025.0.1 https://github.com/medizininformatik-initiative/kerndatensatzmodul-diagnose.git   /tmp/diagnose
git clone --branch v2025.0.1 https://github.com/medizininformatik-initiative/kerndatensatzmodul-person.git     /tmp/person
git clone --branch v2026.0.0 https://github.com/medizininformatik-initiative/kerndatensatz-meta.git            /tmp/meta
git clone --branch v2026.0.1 https://github.com/medizininformatik-initiative/kerndatensatzmodul-medikation.git /tmp/medikation
git clone --branch 2026.0.3  https://github.com/medizininformatik-initiative/kerndatensatzmodul-labor.git      /tmp/labor
python3 tools/ig-stats.py run /tmp/diagnose /tmp/person /tmp/meta /tmp/medikation /tmp/labor -o out \
  --label "MII KDS Diagnose v2025.0.1,MII KDS Person v2025.0.1,MII KDS Meta v2026.0.0,MII KDS Medikation v2026.0.1,MII KDS Labor 2026.0.3"
```

`tools/ig-stats.py` kann auch direkt Git-URLs verarbeiten; Faktoren/Annahmen sind im Tool
(`EFFORT_FACTORS`, `EFFORT_FACTORS_AI`, `PLANNING_PARAMS`) und in
`skills/ig-analyze/references/report-content.json` **kalibrierbar/erweiterbar**.
