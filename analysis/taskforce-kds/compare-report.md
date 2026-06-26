# IG-Vergleich (2 IGs)

_Objektiver Kennzahlen-Vergleich der analysierten IGs inkl. Linguistik und Aufwandsschätzung. Die Spalte „Σ Gesamt“ zeigt den aggregierten Migrations-Gesamtumfang und die -kosten; faire Einordnung über normalisierte Werte._

## Kennzahlen (je IG + Gesamt)

<div align="center">

| Metrik | MII KDS Diagnose v2025.0.1 | MII KDS Person v2025.0.1 | Σ Gesamt |
|---|---|---|---|
| Artefakte gesamt | 13 | 14 | 27 |
| Profile | 1 | 5 | 6 |
| ValueSets | 5 | 1 | 6 |
| CodeSystems | 1 | 1 | 2 |
| Beispiele | 4 | 5 | 9 |
| Narrative-Inhalts-Seiten | 52 | 47 | 99 |
| Wörter gesamt | 38118 | 19118 | 57236 |
| Plattform-Direktiven | 179 | 334 | 513 |
| Doppelte Inhaltsblöcke | 292 | 135 | 427 |
| Nicht referenzierte Bilder | 5 | 6 | 11 |
| Dependencies (floating) | 3 (2) | 2 (2) | — |
| Ø Wörter / Seite | 733 | 406,8 | — |
| Median Wörter / Seite | 448 | 260 | — |
| Reifegrad /100 | 74 | 76 | — |
| Hersteller-Lock-in /100 | 41 | 85 | — |
| Standard-Terminologie % | 100 | 98 | — |
| Bus-Faktor % (Top-Autor) | 34 | 57 | — |
| Aufwand manuell [h] (Band) | 51–82,9 (L) | 73,8–120 (XL) | 124,8–202,9 |
| Aufwand KI-gestützt [h] (Δ) | 30,1–48,9 (−41 %) | 41–66,6 (−44 %) | 71,1–115,5 |

</div>

## Gesamtumfang & -aufwand der Migration

- **Gesamt-Umfang:** 27 Artefakte · 99 Inhalts-Seiten (~57236 Wörter) · 513 Plattform-Direktiven über 2 IG(s).
- **Gesamt-Aufwand manuell:** **124,8–202,9 h** (≈ 15,6–25,4 Personentage).
- **Gesamt-Aufwand KI-gestützt** (HITL, Review-Gates, anbieter-/modellunabhängig): **71,1–115,5 h** (≈ 8,9–14,4 Personentage).
_Aufwand als Spanne (Zeit, keine Geldgröße), kein Festpreis; Faktoren noch nicht final kalibriert._

## Portfolio: Wiederverwendung & Konsolidierung

_Artefakte mit identischem Namen in mehreren IGs deuten auf Konsolidierungspotenzial (gemeinsames Basis-Modul) hin; senkt den Gesamt-Wartungsaufwand._

_Keine namensgleichen Artefakte über die IGs gefunden — geringe direkte Überlappung._

- **Skaleneffekt KI:** Würde die KI-Einrichtung **programmweit einmal** statt je IG aufgesetzt, entfielen 2−1 der festen Setup-Pauschalen; der Grenzaufwand je weiterem IG sinkt auf den variablen Anteil.

## Normalisierte Kennzahlen (fairer Vergleich)

<div align="center">

| Metrik | MII KDS Diagnose v2025.0.1 | MII KDS Person v2025.0.1 |
|---|---|---|
| Direktiven je Seite | 3.44 | 7.11 |
| Beispiele je Profil | 4.0 | 1.0 |
| KI-Ersparnis % | 41 | 44 |

</div>

## Scope vs. Migrationsaufwand

<div align="center">

```mermaid
%%{init: {'theme':'base','themeVariables':{"quadrant1Fill": "#4E79A7", "quadrant2Fill": "#F28E2B", "quadrant3Fill": "#59A14F", "quadrant4Fill": "#E15759", "quadrant1TextFill": "#FFFFFF", "quadrant2TextFill": "#FFFFFF", "quadrant3TextFill": "#FFFFFF", "quadrant4TextFill": "#FFFFFF", "quadrantPointFill": "#1A1A1A", "quadrantPointTextFill": "#1A1A1A", "quadrantXAxisTextFill": "#1A1A1A", "quadrantYAxisTextFill": "#1A1A1A", "quadrantTitleFill": "#1A1A1A"}}}%%
quadrantChart
    title Scope vs. Migrationsaufwand
    x-axis Klein --> Gross
    y-axis Geringer_Aufwand --> Hoher_Aufwand
    quadrant-1 gross & aufwaendig
    quadrant-2 klein & aufwaendig
    quadrant-3 klein & einfach
    quadrant-4 gross & einfach
    "MII KDS Diagnose v2025.0.1": [0.929, 0.691]
    "MII KDS Person v2025.0.1": [1.0, 1.0]
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
| Inhaltliche Dopplungen | Identische Textabsätze (>= 12 Wörter) bzw. identische Seiten - Hinweis auf Redundanz/Aufräumpotenzial. | Hash-Vergleich normalisierter Absätze/Dateien. |
| Repo-Hygiene (ungenutzte Dateien) | Bilder/Beispiele, die in keiner Erklärseite referenziert sind (Dead-Code-Analogie). | Heuristik: Datei-/Artefaktname kommt im Seitentext nicht vor (kein Beweis für Ungenutztheit). |
| Aufwand manuell (Band + Spanne) | Geschätzter Arbeitsaufwand der Migration in Stunden, eingeordnet in ein Band S/M/L/XL. | Summe (Treibermenge x Erfahrungsfaktor) über GoFSH, Direktiven, Inhalts-Seiten, floating Pins; Spanne = Basis x 0,8...1,3. Faktoren kalibrierbar (EFFORT_FACTORS), noch nicht final kalibriert. |
| Aufwand KI-gestützt (HITL) | Aufwand bei teilautomatisierter Migration mit menschlichen Review-Gates - hersteller-/modellunabhängig. | Reduzierte Pro-Treiber-Faktoren + feste Pauschalen für Einarbeitung/Setup und Review-Gates + Validierungs-/Iterationsaufschlag; unbekannte Direktiven zum Manuell-Satz (EFFORT_FACTORS_AI). Ersparnis vorzeichensicher (kann bei Mini-IGs negativ sein). |
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
