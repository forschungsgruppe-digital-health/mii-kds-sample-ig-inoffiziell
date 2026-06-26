# IG-Vergleich (5 IGs)

_Objektiver Kennzahlen-Vergleich der analysierten IGs inkl. Linguistik und Aufwandsschätzung. **Spalten nach Migrationsaufwand aufsteigend sortiert** (geringster Aufwand links). Die Spalte „Σ Gesamt“ zeigt den aggregierten Migrations-Gesamtumfang und -aufwand (Zeit); faire Einordnung über normalisierte Werte._

## Kennzahlen (je IG + Gesamt)

<div align="center">

| Metrik | MII KDS Meta v2026.0.0 | MII KDS Labor 2026.0.3 | MII KDS Diagnose v2025.0.1 | MII KDS Medikation v2026.0.1 | MII KDS Person v2025.0.1 | Σ Gesamt |
|---|---|---|---|---|---|---|
| Artefakte gesamt | 175 | 20 | 13 | 40 | 14 | 262 |
| Profile | 1 | 3 | 1 | 5 | 5 | 15 |
| ValueSets | 0 | 7 | 5 | 5 | 1 | 18 |
| CodeSystems | 1 | 0 | 1 | 1 | 1 | 4 |
| Beispiele | 5 | 6 | 4 | 25 | 5 | 45 |
| Narrative-Inhalts-Seiten | 11 | 37 | 52 | 36 | 47 | 183 |
| Wörter gesamt | 2218 | 10875 | 38118 | 14257 | 19118 | 84586 |
| Plattform-Direktiven | 48 | 201 | 178 | 316 | 333 | 1076 |
| Enthaltene IG-Ordner | 2 | 2 | 5 | 2 | 3 | 14 |
| Doppelte Inhaltsblöcke | 3 | 73 | 292 | 128 | 135 | 631 |
| davon ordnerübergreifend | 3 | 73 | 292 | 126 | 119 | 613 |
| Nicht referenzierte Bilder | 0 | 0 | 5 | 18 | 6 | 29 |
| Dependencies (floating) | 0 (0) | 2 (0) | 3 (2) | 5 (3) | 2 (2) | — |
| Ø Wörter / Seite | 201,6 | 293,9 | 733 | 396 | 406,8 | — |
| Median Wörter / Seite | 125 | 164 | 448 | 360 | 260 | — |
| Unterstützte Sprachen | 1 (—) | 1 (de) | 2 (de, en) | 1 (de) | 2 (de, en) | — |
| Reifegrad /100 | 70 | 74 | 74 | 50 | 76 | — |
| Hersteller-Lock-in /100 | 52 | 65 | 41 | 100 | 85 | — |
| Standard-Terminologie % | 98 | 100 | 100 | 100 | 98 | — |
| Bus-Faktor % (Top-Autor) | 31 | 31 | 34 | 51 | 57 | — |
| Aufwand manuell [h] (Band) | 12,1–19,6 (M) | 47–76,3 (L) | 50,9–82,7 (L) | 67,4–109,5 (L) | 73,7–119,7 (L) | 251,1–407,8 |
| Aufwand KI-gestützt [h] (Δ) | 10,7–17,4 (−11 %) | 29,4–47,8 (−37 %) | 30–48,7 (−41 %) | 38,3–62,2 (−43 %) | 40,9–66,5 (−44 %) | 149,3–242,6 |

</div>

## Gesamtumfang & -aufwand der Migration

- **Gesamt-Umfang:** 262 Artefakte · 183 Inhalts-Seiten (~84586 Wörter) · 1076 Plattform-Direktiven über 5 IG(s).
- **Gesamt-Aufwand manuell:** **251,1–407,8 h** (≈ 31,4–51 Personentage).
- **Gesamt-Aufwand KI-gestützt** (HITL, Review-Gates, anbieter-/modellunabhängig): **149,3–242,6 h** (≈ 18,7–30,3 Personentage).
_Aufwand als Spanne (Zeit, keine Geldgröße), kein Festpreis; Faktoren noch nicht final kalibriert._

## Enthaltene IGs je Repo (Aufschlüsselung, aktuell → ältest)

_Repos können mehrere IG-Ordner (Versions-/Sprachvarianten) enthalten; Aufwand je IG zeigt die Migration einer einzelnen Version statt des über alle Ordner summierten Aggregats._

### MII KDS Meta v2026.0.0 — 2 IG-Ordner

<div align="center">

| Kennzahl | 2025 | MedizininformatikInitiative-ImplementationGuide-Template |
|---|---|---|
| Sprache | ? | ? |
| Inhalts-Seiten | 6 | 5 |
| Wörter | 789 | 1559 |
| Ø Wörter / Seite | 132 | 312 |
| Direktiven | 43 | 5 |
| Aufwand manuell ~h (je IG) | 9,3–15,1 | 2,8–4,5 |

</div>

### MII KDS Labor 2026.0.3 — 2 IG-Ordner

<div align="center">

| Kennzahl | 2026.x-DE | 2025.x-DE |
|---|---|---|
| Sprache | de | de |
| Inhalts-Seiten | 19 | 18 |
| Wörter | 5908 | 5036 |
| Ø Wörter / Seite | 311 | 280 |
| Direktiven | 102 | 99 |
| Aufwand manuell ~h (je IG) | 23,9–38,9 | 23–37,4 |

</div>

### MII KDS Diagnose v2025.0.1 — 5 IG-Ordner

<div align="center">

| Kennzahl | 2025 | 2024.x-DE | 2024.x-EN | 1.x-DE | 1.x-EN |
|---|---|---|---|---|---|
| Sprache | ? | de | en | de | en |
| Inhalts-Seiten | 12 | 12 | 10 | 8 | 10 |
| Wörter | 7807 | 7629 | 8129 | 6580 | 8046 |
| Ø Wörter / Seite | 651 | 636 | 813 | 822 | 805 |
| Direktiven | 50 | 50 | 38 | 18 | 22 |
| Aufwand manuell ~h (je IG) | 12,8–20,8 | 12,8–20,8 | 10,1–16,4 | 6,1–9,9 | 7,5–12,2 |

</div>

### MII KDS Medikation v2026.0.1 — 2 IG-Ordner

<div align="center">

| Kennzahl | mii-ig-medikation-v2025 | mii-ig-medikation-de-v2024 |
|---|---|---|
| Sprache | ? | de |
| Inhalts-Seiten | 18 | 18 |
| Wörter | 7515 | 6792 |
| Ø Wörter / Seite | 418 | 377 |
| Direktiven | 155 | 161 |
| Aufwand manuell ~h (je IG) | 32–52 | 33–53,6 |

</div>

### MII KDS Person v2025.0.1 — 3 IG-Ordner

<div align="center">

| Kennzahl | 2025.x-DE | 2024.x-DE | 2024.x-EN |
|---|---|---|---|
| Sprache | de | de | en |
| Inhalts-Seiten | 16 | 16 | 15 |
| Wörter | 6646 | 6142 | 6401 |
| Ø Wörter / Seite | 415 | 384 | 427 |
| Direktiven | 116 | 113 | 104 |
| Aufwand manuell ~h (je IG) | 25–40,6 | 24,5–39,8 | 22,6–36,8 |

</div>

## Portfolio: Wiederverwendung & Konsolidierung

_Artefakte mit identischem Namen in mehreren IGs deuten auf Konsolidierungspotenzial (gemeinsames Basis-Modul) hin; senkt den Gesamt-Wartungsaufwand._

_Keine namensgleichen Artefakte über die IGs gefunden — geringe direkte Überlappung._

- **Skaleneffekt KI:** Würde die KI-Einrichtung **programmweit einmal** statt je IG aufgesetzt, entfielen 5−1 der festen Setup-Pauschalen; der Grenzaufwand je weiterem IG sinkt auf den variablen Anteil.

## Normalisierte Kennzahlen (fairer Vergleich)

<div align="center">

| Metrik | MII KDS Meta v2026.0.0 | MII KDS Labor 2026.0.3 | MII KDS Diagnose v2025.0.1 | MII KDS Medikation v2026.0.1 | MII KDS Person v2025.0.1 |
|---|---|---|---|---|---|
| Direktiven je Seite | 4.36 | 5.43 | 3.42 | 8.78 | 7.09 |
| Beispiele je Profil | 5.0 | 2.0 | 4.0 | 5.0 | 1.0 |
| KI-Ersparnis % | 11 | 37 | 41 | 43 | 44 |

</div>

## Scope vs. Migrationsaufwand

<div align="center">

```mermaid
%%{init: {'theme':'base','themeVariables':{"quadrant1Fill": "#4E79A7", "quadrant2Fill": "#F28E2B", "quadrant3Fill": "#59A14F", "quadrant4Fill": "#E15759", "quadrant1TextFill": "#FFFFFF", "quadrant2TextFill": "#FFFFFF", "quadrant3TextFill": "#FFFFFF", "quadrant4TextFill": "#FFFFFF", "quadrantPointFill": "#1A1A1A", "quadrantPointTextFill": "#1A1A1A", "quadrantXAxisTextFill": "#1A1A1A", "quadrantYAxisTextFill": "#1A1A1A", "quadrantTitleFill": "#1A1A1A"}}}%%
quadrantChart
    title Scope vs. Migrationsaufwand
    x-axis Klein --> Gross
    y-axis Geringer_Aufwand --> Hoher_Aufwand
    quadrant-1 gross/aufwaendig
    quadrant-2 klein/aufwaendig
    quadrant-3 klein/einfach
    quadrant-4 gross/einfach
    "MII KDS Meta v2026.0.0": [0.93, 0.07]
    "MII KDS Labor 2026.0.3": [0.107, 0.557]
    "MII KDS Diagnose v2025.0.1": [0.07, 0.612]
    "MII KDS Medikation v2026.0.1": [0.213, 0.842]
    "MII KDS Person v2025.0.1": [0.075, 0.93]
```

</div>

# Anhang: Methodik & Metrik-Erklärung

_Beschreibung jeder im Report verwendeten Kennzahl - was sie misst und wie sie ermittelt wird - zur Nachvollziehbarkeit. Maßstab für Aufwand ist ZEIT (Stunden/Personentage/Kalenderzeit), keine Geldgrößen._

<div align="center">

| Kennzahl | Was es misst | Herkunft / Berechnung |
|---|---|---|
| Artefakte (publiziert) | Anzahl der vom IG bereitgestellten FHIR-Konformitätsressourcen je Typ (Profile, Extensions, ValueSets, CodeSystems, Logical Models, CapabilityStatements, Beispiele). | Zählung der Deklarationen in input/fsh (bzw. generierten Ressourcen); interne FSH-Konstrukte (RuleSets/Invarianten/Mappings) separat, nicht im Total. |
| Plattform-/Simplifier-Direktiven | Vorkommen plattformspezifischer Platzhalter in den Erklärseiten, die ein generischer IG Publisher nicht versteht (Migrations-Aufwandstreiber). | Mustererkennung je Direktiven-Typ in den Narrative-Seiten; nicht abgedeckte -> UNBEKANNT. |
| Linguistik (Wörter/Seite) | Textumfang der Inhalts-Seiten als Durchschnitt, Median und Extremwerte - Indikator für Dokumentations- und Übersetzungsumfang. | Wortzählung je Inhalts-Seite (ohne Stubs). |
| Unterstützte Sprachen | Anzahl (und Liste) der im Repo unterstützten Sprachen, z.B. de + en. | Vereinigung aus Default-Sprache, konfigurierten i18n-Sprachen und den Sprach-Suffixen der IG-Ordner (-de/-en); auf den Basis-Sprachcode normalisiert (de-DE -> de). |
| Enthaltene IG-Ordner | Anzahl der im Repo enthaltenen IG-/Leitfaden-Ordner (unter implementation-guides/). Enthält das Repo MEHRERE IGs (z.B. Versions-/Sprachvarianten), wird die Statistik JE IG aufgeschlüsselt (horizontal, je IG eine Spalte: Sprache, Seiten, Wörter, Direktiven, geschätzter Aufwand) - sortiert von der aktuellen zur ältesten Version. | Unterordner von implementation-guides/ mit Narrative-Seiten (Asset-Ordner ausgeschlossen); Sprache aus Ordnernamen-Suffix -de/-en; Sortierung über Versionsnummern im Ordnernamen; Direktiven/Aufwand je Ordner aus den Fundstellen. Fallback input/pagecontent. |
| Inhaltliche Dopplungen | Identische Textabsätze (>= 12 Wörter) bzw. identische Seiten - Hinweis auf Redundanz/Aufräumpotenzial; ordnerübergreifende Dopplungen (gleicher Block in mehreren IG-Ordnern) werden gesondert gezählt. | Hash-Vergleich normalisierter Absätze/Dateien; Zuordnung der Fundstellen zu IG-Ordnern. |
| Repo-Hygiene (ungenutzte Dateien) | Bilder/Beispiele, die in keiner Erklärseite referenziert sind (Dead-Code-Analogie). | Heuristik: Datei-/Artefaktname kommt im Seitentext nicht vor (kein Beweis für Ungenutztheit). |
| Aufwand manuell (Band + Spanne) | Geschätzter Arbeitsaufwand der Migration in Stunden, eingeordnet in ein Band S/M/L/XL. | Summe (Treibermenge x Erfahrungsfaktor) über GoFSH, Direktiven, Inhalts-Seiten, floating Pins; Spanne = Basis x 0,8...1,3. Faktoren kalibrierbar (EFFORT_FACTORS), noch nicht final kalibriert. 1 Personentag = 8 Personenstunden produktiver menschlicher Arbeit - hier die manuelle Migrationsarbeit von Hand. |
| Aufwand KI-gestützt (HITL) | Aufwand bei teilautomatisierter Migration mit menschlichen Review-Gates - hersteller-/modellunabhängig. | Reduzierte Pro-Treiber-Faktoren + feste Pauschalen für Einarbeitung/Setup und Review-Gates + Validierungs-/Iterationsaufschlag; unbekannte Direktiven zum Manuell-Satz (EFFORT_FACTORS_AI). Ersparnis vorzeichensicher (kann bei Mini-IGs negativ sein). WICHTIG: Die Stunden/Personentage zählen die MENSCHLICHE Bedien- und Prüfzeit (Aufträge/Prompts formulieren, an Review-Gates prüfen und freigeben, Korrekturen, Validierungs-Iterationen) - NICHT die Rechen-/Laufzeit der KI und NICHT die Wartezeit auf den Task-Abschluss. |
| Planung & Terminierung | Kalenderzeit, Szenario (Min/Erwartet/Max), Schätz-Konfidenz, Startbereitschaft, grober Rollen-Mix, Fixaufwandsanteil. | Kalenderzeit = Stunden / (h-pro-Tag x Team x Auslastung) aus PLANNING_PARAMS; Konfidenz/Readiness aus Anzahl Unbekannter/Blocker; Rollen-Mix aus Treiber-Stunden. |
| Reifegrad (Score) | Freigabe-Indikator 0-100 mit Band (in Entwicklung/fortgeschritten/technisch reif). | Mittelwert aus Status, Doku-Vollständigkeit (Inhalt vs. Stubs), Beispiel-Abdeckung der Profile und Governance-Reife. |
| Hersteller-Lock-in | Bindung an die Quellplattform durch proprietäre Direktiven (0-100, Band). | Grobe Heuristik aus Direktiven je Seite. |
| Standard-Terminologie-Anteil | Anteil standardisierter Terminologie (SNOMED/LOINC/ICD/UCUM) gegenüber Eigen-Terminologie. | Grobe Heuristik aus Textvorkommen der Standardsysteme vs. Anzahl lokaler CodeSystems. |
| Wiederverwendung externer Profile | Anteil der Profil-Parents, die auf externen Basisbausteinen statt eigenem Material beruhen. | FSH Parent:-Referenzen; abstrakte LM-Basistypen (Element/Base/...) ausgeschlossen. |
| FHIR-Versions-Aktualität | Wie aktuell die FHIR-Basis ist (R4/R4B/R5) - Zukunftssicherheit. | fhirVersion aus sushi-config, gegen bekannte Versionslinie eingeordnet. |
| Pflege-Kadenz | Lebendigkeit der Pflege (Commits/Jahr, Tage seit letztem Commit). | Git-Historie des analysierten Repos. |
| Bus-Faktor (Wissenskonzentration) | Schlüsselpersonen-Risiko: Anteil des Top-Autors an allen Commits. | Git-Historie, Autoren nach E-Mail gruppiert (Alias-robust). |
| Terminologie-Lizenz | Lizenz-/IP-Risiko gebundener Terminologien (z.B. SNOMED CT lizenzpflichtig). | Erkennung der Standardsysteme im FSH + hinterlegte Lizenzeinstufung. |
| Unterdrückte Warnungen | Risiko, dass ausgeblendete QA-Meldungen echte Fehler verbergen (breit/Wildcard vs. eng). | Klassifikation der Einträge in input/ignoreWarnings.txt. |
| Datenschutz-Substanz | Ob die Datenschutz-Seite substanziell ist und ob Beispiele PII-artige Daten enthalten. | Wortzahl der security-privacy-Seite + Heuristik (birthDate/name) in Beispielen. |
| Breaking-Change-Risiko | Kompatibilitätsbruch gegenüber der publizierten Vorversion. | Nur per Build/Vorversions-Diff ermittelbar - im statischen Modus nicht erhoben (null). |
| Statisch vs. Build | Erhebungsmodus jeder Kennzahl. | static = nur Quelldateien/Git; build = erfordert IG-Publisher-Lauf (qa.json); extern = Registry/Netz. Nicht statisch erhebbare Größen bleiben null und sind so markiert. |

</div>
