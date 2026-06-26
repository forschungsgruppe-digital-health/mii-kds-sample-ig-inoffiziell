# IG-Statistik — MII KDS Person v2025.0.1

_Modus: `static` · Stand: 2026-06-26T22:47:07Z · Commit: `122e30f`_

## Executive Summary: Migration des FHIR-Leitfadens "MII IG Person"

> **Worum geht es?** Ein FHIR Implementation Guide (kurz „IG“) ist die technische Spezifikation eines Datenstandards im Gesundheitswesen – das Regelwerk plus die zugehörige Online-Dokumentation. Dieser IG soll von einer herstellergebundenen Plattform auf das herstellerneutrale Standard-Werkzeug der FHIR-Community (den „IG Publisher“) umgezogen werden. Inhaltlich ändert sich nichts – nur die technische Bauweise der Veröffentlichung. _Fachbegriffe sind im [Glossar](#anhang-glossar) am Dokumentende erklärt._

### Das Wichtigste in einem Satz

Der Umzug ist **umfangreich** (geschätzt **74–120 Personenstunden**, also rund **9,2–15,0 Personentage**), **mit wenigen vorab zu klärenden Punkten** – die fachliche Substanz liegt bereits in maschinenlesbarer, sauberer Form vor. Mit KI-Unterstützung lässt sich der Aufwand voraussichtlich deutlich senken (modellierte ~41–66 h, ≈ 44 % weniger; Annahmen und Vorbehalte siehe „Aufwand“).

### Inhaltlicher Umfang (was migriert wird)

- **Identität:** `mii-ig-person`, Version 2025.0.1, Herausgeber Medizininformatik Initiative, Lizenz CC-BY-4.0, Status „active“.
- **14 fachliche Bausteine:** 5 Profile (Kernregelwerk), 1 Werte-Liste, 1 Codesystem, 1 logisches Datenmodell, 1 Fähigkeitsbeschreibung, 5 Beispiele.
- **Dokumentation:** 47 inhaltliche Textseiten (~19118 Wörter, Ø 407 Wörter/Seite) und 18 Bilder.

### Aufwand und was das Band bedeutet

- **Aufwandsband: L (groß)** – auf einer Skala S (klein, <1 Tag) / M (mittel, einige Tage) / L (groß, 1–2 Wochen) / XL (sehr groß) liegt dieses Vorhaben **im oberen Bereich**.
- **Manuell: rund 74–120 Stunden.** Das ist eine **Größenordnungsschätzung zur Aufwandsplanung** (Faustregel: Menge der Arbeitsschritte × Erfahrungswert) – **kein verbindliches Angebot**.
- **KI-gestützt teilautomatisiert: rund 41–66 Stunden** (≈ 44 % weniger). Das heißt: eine KI erledigt die wiederkehrenden Umbauten, Menschen prüfen und geben an Kontrollpunkten frei (Human-in-the-Loop / Review-Gates). Die Schätzung gilt **unabhängig davon, welches KI-Produkt eingesetzt wird** – sie ist eine _modellierte_ Annahme mit noch nicht kalibrierten Faktoren, **keine garantierte Einsparung**.
- **Größte Aufwandstreiber:** 333 plattformspezifische Platzhalter in den Textseiten (sog. „Direktiven“ – das neue Standard-Werkzeug kennt sie nicht, sie werden einzeln umgebaut; ~67 h) und 47 Inhaltsseiten (~24 h).
- **Reife & Strategie:** Reifegrad **76/100 (reif)** · Hersteller-Lock-in hoch. (Details in den Abschnitten Reife & Freigabe und Strategie.)

### Wie sauber ist die Quelle?

- **Regeln liegen bereits in der bearbeitbaren Textform (FSH) vor – kein aufwändiger Rückbau nötig (Effizienzvorteil).**
- **2 externe Abhängigkeiten, davon 0 fest verankert, 2 beweglich.** Bewegliche Versionen vor der Migration auf feste Stände festlegen.
- **Versionsnummer aus dem Kalenderjahr (CalVer)** – wird unverändert übernommen, kein Anpassungsbedarf.
- **Mehrsprachigkeit bereits technisch vorbereitet** – Übersetzungen können automatisch mitgenommen werden.
- **8 Qualitätsregeln** bereits definiert und 1:1 übernehmbar.

### Risiken und Blocker

- **Zu klären vor Start: bewegliche Abhängigkeiten (vor Migration fixieren).**
- **Schätzungs-Vorbehalt:** beruht auf einer rein **statischen** Analyse der Quelldateien (ohne Test-Build); ein vollständiger Validierungslauf kann zusätzliche Detailkorrekturen aufdecken. Die Erfahrungswerte sind noch nicht final kalibriert – daher die bewusst breite Spanne.
- **Risikomindernd:** Der Umzug erfolgt isoliert auf einem separaten Arbeitszweig, ohne Eingriff in den produktiven Stand; ein menschliches Abschluss-Review ist vorgesehen.

### Bottom Line / Empfehlung

**Durchführbar – mit Ressourcen- und Zeitplanung.** Der Aufwand ist groß und kalkulierbar (manuell ~9,2–15,0 Personentage, KI-gestützt voraussichtlich spürbar weniger), die Quelle ist mit überschaubaren Vorarbeiten. Konkret einzuplanen: ein abschließender Validierungslauf mit fachlichem Review.

## Kennzahlen-Überblick

### Artefakte (Σ 14 publiziert)

_Hier wird gezählt, wie viele FHIR-Bausteine (Profile, Extensions, ValueSets usw.) der IG je Typ definiert._

<div align="center">

```mermaid
%%{init: {'theme':'base','themeVariables':{"pie1": "#4E79A7", "pie2": "#F28E2B", "pie3": "#59A14F", "pie4": "#E15759", "pie5": "#76B7B2", "pie6": "#EDC948", "pieOpacity": "1", "pieSectionTextColor": "#1A1A1A", "pieTitleTextSize": "18px"}}}%%
pie showData title Artefakte
    "profiles" : 5
    "examples" : 5
    "valuesets" : 1
    "codesystems" : 1
    "logicals" : 1
    "capabilitystatements" : 1
```

</div>

<div align="center">

| Typ | Anzahl |
|---|---|
| profiles | 5 |
| examples | 5 |
| valuesets | 1 |
| codesystems | 1 |
| logicals | 1 |
| capabilitystatements | 1 |

</div>

_Interne FSH-Konstrukte (nicht in Σ): 9 rulesets, 9 invariants._

### Plattform-Direktiven — Σ 333 (unbekannt: 0)

_Dieser Abschnitt listet die plattformspezifischen Platzhalter in den Erklärseiten, die ein generischer IG Publisher nicht versteht und die daher umgesetzt werden müssen._

<div align="center">

```mermaid
%%{init: {'theme':'base','themeVariables':{"pie1": "#4E79A7", "pie2": "#F28E2B", "pie3": "#59A14F", "pie4": "#E15759", "pie5": "#76B7B2", "pie6": "#EDC948", "pie7": "#B07AA1", "pie8": "#FF9DA7", "pie9": "#9C755F", "pie10": "#BAB0AC", "pieOpacity": "1", "pieSectionTextColor": "#1A1A1A", "pieTitleTextSize": "18px"}}}%%
pie showData title Direktiven
    "tabs" : 120
    "fql-at" : 57
    "render" : 41
    "json" : 32
    "link" : 29
    "tree" : 17
    "pagelink" : 17
    "xml" : 15
    "index-root" : 3
    "page-title" : 2
```

</div>

<div align="center">

| Direktive | Anzahl |
|---|---|
| tabs | 120 |
| fql-at | 57 |
| render | 41 |
| json | 32 |
| link | 29 |
| tree | 17 |
| pagelink | 17 |
| xml | 15 |
| index-root | 3 |
| page-title | 2 |

</div>

## Inhaltsumfang & Repo-Hygiene

_Linguistische Kennzahlen zum Textumfang (Wörter je Seite, Durchschnitt) sowie Hinweise auf inhaltliche Dopplungen und nicht referenzierte Dateien (Dead-Code-Analogie) - hilft, Umfang und Aufräumpotenzial einzuschätzen._

<div align="center">

| Kennzahl | Wert |
|---|---|
| Enthaltene IG-Ordner | 3 |
| Inhalts-Seiten | 47 |
| Wörter gesamt | 19118 |
| Ø Wörter / Seite | 406,8 |
| Median Wörter / Seite | 260 |
| Unterstützte Sprachen | 2 (de, en) |
| kürzeste / längste Seite | 70 / 1389 Wörter |
| doppelte Inhaltsblöcke | 135 (davon 119 ordnerübergreifend) |
| identische Seiten (Gruppen) | 8 |
| Bilder nicht referenziert | 6 von 18 |
| Beispiele nicht in Narrativen | 0 von 5 |

</div>

**Enthaltene IG-Ordner (3) — Aufschlüsselung je IG (Spalten: aktuell → ältest):**

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

> ⚠ Das Repo enthält **3 IG-Ordner** (Versions-/Sprachvarianten). Aggregat-Kennzahlen (Direktiven, Wörter, **Aufwand**) summieren über **alle** Ordner — für die Migration **einer** Version entsprechend nach unten zu korrigieren; die 119 ordnerübergreifenden Dopplungen zeigen das Ausmaß.

_Heuristik: 'nicht referenziert' = Dateiname/Artefaktname kommt in keiner Erklärseite vor. Kein Beweis für Ungenutztheit (Referenz kann über Konfiguration/Build erfolgen)._

## Aufwand: manuell vs. KI-gestützt

_Dieser Abschnitt schätzt den Arbeitsaufwand der Überführung als Spanne - manuell und KI-gestützt teilautomatisiert - abgeleitet aus zählbaren Treibern und Stundenfaktoren._

<div align="center">

| Treiber | Menge | manuell [h] | KI-gestützt [h] |
|---|---|---|---|
| Direktiven (bekannt) | 333 | 66,6 | 26,6 |
| Inhalts-Seiten | 47 | 23,5 | 9,4 |
| Floating Pins (Versionen fixieren) | 2 | 2 | 1,6 |
| GoFSH-Vorlauf (Regel-Rückgewinnung) | nein | 0 | 0 |
| Direktiven (unbekannt → manuell) | 0 | 0 | 0 |
| Einarbeitung/Setup (einmalig) | — | 0 | 3 |
| Review-Gates (Pauschale) | — | 0 | 3 |
| Validierungs-/Iterationsaufschlag (20 %) | — | 0 | 7,5 |

</div>

**Manuell:** Band L · **73,7–119,7 h**  |  **KI-gestützt (HITL, Review-Gates, anbieter-/modellunabhängig):** Band L · **40,9–66,5 h** · **≈ 44 % weniger**

_Annahmen:_ • Nur statisch berechenbare Treiber; id/url-Mismatch, QC-Verletzungen und quell-intrinsische Validierungsfehler erfordern einen Build und sind hier nicht enthalten. • Faktoren sind Erfahrungswerte, noch nicht final kalibriert; Spanne = Basis × 0,8…1,3. • pages = Inhalts-Seiten (Stubs/Navigation < 20 Wörter ausgeschlossen). • Personentage = Aufwand in 8-h-Arbeitstagen (1 PT = 8 Personenstunden); beide Schätzungen messen MENSCHLICHE Arbeitszeit — manuell die Migration von Hand, KI-gestützt die Bedien-/Review-Zeit der KI (Prompts, Review-Gates, Korrekturen), NICHT die Rechen-/Laufzeit oder Wartezeit der KI. • KI-Schätzung: anbieter-/modellunabhängig (Human-in-the-Loop, Review-Gates). Enthält feste Pauschalen für Einarbeitung/Setup (3 h) und Review-Gates (3 h) sowie einen Validierungs-/Iterationsaufschlag (20 %); unbekannte Direktiven werden wie manuell gerechnet. Bewusst konservativ – keine garantierte Einsparung.

## Reife & Freigabe

_Verdichteter Reifegrad als Freigabe-Indikator: Status, Vollständigkeit der Dokumentation, Beispiel-Abdeckung der Profile und Governance-Reife._

<div align="center">

| Komponente | Wert |
|---|---|
| **Reifegrad-Score** | **76/100 (reif)** |
| Status | active |
| Doku-Vollständigkeit (Inhalt vs. Stubs) | 87 % |
| Beispiel-Abdeckung Profile | 80 % (4/5) |
| Governance (CI · ig.ini · publication · devcontainer) | 50/100 |

</div>

**Profile ohne Beispiel (1):** `MII_PR_Person_Proband`

## Strategie: Wiederverwendung, Lock-in & Zukunftssicherheit

_Strategische Kennzahlen: Bindung an die Quellplattform (Lock-in), Anteil standardisierter Terminologie, Wiederverwendung externer Bausteine und Zukunftssicherheit (FHIR-Version, Pflege-Aktivität)._

<div align="center">

| Kennzahl | Wert |
|---|---|
| Hersteller-Lock-in | 85/100 (hoch) · 7,1 Direktiven/Seite |
| Standard-Terminologie-Anteil | 98 % (SNOMED CT, LOINC, ICD-10) |
| Wiederverwendung externer Profile (Parents) | 100 % (5 von 5 Profil-Parents extern; abstrakte LM-Basistypen ausgeschlossen) |
| FHIR-Version | R4 — aktuell verbreitet |
| Dependency-Veraltung | 0 veraltet (Heuristik) |
| Pflege-Kadenz | 152.9 Commits/Jahr · letzter Commit vor 262 Tagen |

</div>

_Lock-in und Standard-Terminologie-Anteil sind grobe Heuristiken aus Textvorkommen. Heuristik aus CalVer-Jahr; exakt nur via Package-Registry (extern)._

## Planung & Terminierung

_Planungsgrößen jenseits reiner Personenstunden: Kalenderzeit, Szenarien (Min/Erwartet/Max), Schätz-Konfidenz, Startbereitschaft und grober Rollen-Mix._

<div align="center">

| Planungsgröße | Wert |
|---|---|
| Kalenderzeit | 16–25 Arbeitstage |
| Szenario Min / Erwartet / Max | 73,7 / 96,7 / 119,7 h |
| Schätz-Konfidenz | mittel |
| Startbereitschaft | 90/100 |
| Cross-Modul-Abhängigkeit | erhöht (floating Pins) |
| KI-Fixaufwandsanteil | 9 % |

</div>

**Rollen-Mix (grob):** FSH-Rückgewinnung/Pins 2 % · Template/Tooling (Direktiven) 72 % · Redaktion/Doku (Seiten) 26 %. Direktiven & Seiten gut parallelisierbar; Setup/QA seriell.

_Hinweis: FHIR-/FSH-Fachwissen ist für Review, Validierung und QC-Übernahme generell erforderlich; ein 0-%-Wert bei FSH bedeutet nur, dass **kein FSH-Rückbau (GoFSH)** anfällt. Annahmen Kalenderzeit: 8 h/Tag · Team 1 · Auslastung 60 %._

## Risiko & Compliance

_Entscheidungsrelevante Risiken für die Freigabe: Terminologie-Lizenzen, unterdrückte Warnungen, Datenschutz-Substanz, Wissenskonzentration (Bus-Faktor) und Kompatibilitätsbruch zur Vorversion._

<div align="center">

| Risiko | Bewertung |
|---|---|
| Terminologie-Lizenz | Lizenzbedarf möglich — SNOMED CT: lizenzpflichtig (Affiliate/Land), LOINC: frei (Registrierung), ICD-10: frei |
| Unterdrückte QA-Warnungen | 0 (davon 0 breit) → keine |
| Datenschutz-Seite (Substanz) | fehlt/nur Stub (0 Wörter) |
| PII-artige Beispieldaten | ja – prüfen |
| Bus-Faktor (Wissenskonzentration) | 57 % Top-Autor → gering |
| Breaking-Change-Risiko ggü. Vorversion | — (nur per Build/Vorversions-Diff) |

</div>

## Empfehlungen für die Überführung in ein generisches HL7-FHIR-IG

_Hier stehen je Themenbereich konkrete, aus den Kennzahlen abgeleitete Schritte, um den IG in das generische HL7-FHIR-IG-Format zu überführen._

<div align="center">

| Bereich | Befund | Empfehlung |
|---|---|---|
| Artefakte (FSH) | 14 publiziert, FSH vorhanden | Liegen die Artefakte bereits als FSH vor, können sie unverändert nach input/fsh/ übernommen werden; ein Rückwandeln aus fertigen FHIR-Dateien entfällt. Wichtig: ids und Canonical-URLs bleiben gleich, damit bestehende Verweise weiter funktionieren (Bestandsschutz). |
| Narrative | 47 Inhalts-Seiten, Format source | Die frei geschriebenen Erklärseiten gehören als Markdown-Dateien nach input/pagecontent/. Reine Platzhalter-/Navigationsseiten werden nicht übernommen, da Navigation und Inhaltsverzeichnis automatisch entstehen. |
| Direktiven | 333 (0 unbekannt) | Plattformspezifische Platzhalter/Tags werden durch die passenden Mechanismen des IG Publishers ersetzt (meist Vorlagen-Includes oder normale Markdown-Konstrukte). Direktiven ohne bekanntes Gegenstück werden einzeln von Hand geprüft und sinnvoll übersetzt. |
| Dependencies | 2 (2 floating) | Alle deklarierten Paket-Abhängigkeiten werden mit fester Version in die sushi-config.yaml übernommen. Feste Versionen (Pinning) sind reproduzierbaren Builds vorzuziehen; bewegliche Einträge werden auf eine konkrete Version festgelegt. |
| Mehrsprachigkeit | FSH-Übersetzung ja, Supplements 0 | In Ressourcen eingebettete Übersetzungen werden vom Build automatisch in die jeweilige Sprachausgabe übernommen. Für übersetzte Erklärseiten legt man pro Sprache eigene Seiten an; eine Sprache bleibt führend, jede maschinelle Übersetzung ist menschlich zu prüfen. |
| Pflichtseiten | 1/11 im Zielformat | Das Standard-Seitenraster sollte vollständig vorhanden sein (z.B. Startseite, Anwendungsfälle, Datensätze, Konformität, Kontext, Referenzen, Änderungen, Downloads, Datenschutz, Übersetzungshinweis). Fehlende Zielseiten werden ergänzt und in die Seiten-/Menükonfiguration aufgenommen. |
| QC-Regeln | 8 definiert | Die im Quellprojekt definierten Qualitätsregeln (qc/custom.rules.yaml) werden übernommen und in der CI-Pipeline regelmäßig ausgeführt, damit Validierung und Namenskonventionen automatisch geprüft werden. |
| Metadaten/Config | id mii-ig-person, v2025.0.1 | Die Kerndaten des IG (id, Version, Status, Publisher, Lizenz) werden in sushi-config.yaml und ig.ini ins Zielformat überführt, inklusive Seiten-, Menü- und Sprachkonfiguration; die gewünschte Zielversion wird gesetzt. |
| Arbeitsweise | — | Die Migration findet isoliert auf einem eigenen Arbeitszweig statt, getrennt vom Hauptstand. Änderungen werden über einen Pull Request eingebracht und vor dem Zusammenführen menschlich geprüft, statt direkt auf den Hauptzweig zu schreiben. |

</div>

## Direktiven-Mapping (Detail)

_Dieser Abschnitt ordnet jedem Direktiven-Typ sein Gegenstück im IG-Publisher-Format zu, sortiert nach Häufigkeit._

<div align="center">

| Direktive | Anzahl | Was es tut | Empfehlung (→ IG Publisher) |
|---|---|---|---|
| tabs | 120 | Gruppiert mehrere Inhalte (z.B. Darstellung, XML, JSON) in umschaltbare Reiter. | Die einzelnen Reiterinhalte durch die jeweils passenden generierten Anzeige-Fragmente (Struktur, XML, JSON) ersetzen; eine eigene Reiter-Mechanik ist meist nicht nötig. |
| fql-at | 57 | Markiert einen Abfrage-Codeblock in besonderer Schreibweise (mit @-Präfix). | Wie einen normalen Abfrageblock behandeln und durch ein generiertes Tabellen-Fragment oder eine statische Tabelle ersetzen. |
| render | 41 | Bindet generierten Inhalt ein - ein Bild/Grafik oder eine vollständige FHIR-Ressource (z.B. CapabilityStatement). | Bild: nach input/images/ kopieren und als Markdown-/HTML-Bild einbinden. Ressource/Artefakt: meist entfernen (der IG Publisher erzeugt je Artefakt automatisch eine Seite) ODER das passende vorgefertigte Anzeige-Fragment einbinden. |
| json | 32 | Zeigt eine Ressource oder ein Beispiel in JSON-Darstellung an. | Durch das vom IG Publisher erzeugte JSON-Anzeige-Fragment ersetzen. |
| link | 29 | Erzeugt einen Verweis auf ein einzelnes Artefakt (z.B. dessen Übersichtsseite). | Durch einen normalen Markdown-Link auf die generierte Artefaktseite ersetzen (Form Typ-id.html). |
| tree | 17 | Zeigt die Struktur eines Profils/einer Extension als aufklappbaren Strukturbaum an. | Durch das vom IG Publisher erzeugte Struktur-Fragment ersetzen (Snapshot- oder Differential-Ansicht bzw. Element-Wörterbuch). |
| pagelink | 17 | Erzeugt einen Verweis auf eine andere Seite oder ein Artefakt anhand eines Namens-Hinweises. | Durch einen normalen Markdown-Link auf die generierte Artefaktseite ersetzen (Form Typ-id.html); der Artefaktname wird in die kleingeschriebene id umgesetzt. |
| xml | 15 | Zeigt eine Ressource oder ein Beispiel in XML-Darstellung an. | Durch das vom IG Publisher erzeugte XML-Anzeige-Fragment ersetzen. |
| index-root | 3 | Erzeugt an dieser Stelle ein automatisches Inhaltsverzeichnis bzw. die Wurzel der Navigationsstruktur. | Entfällt - Navigation und Inhaltsverzeichnis erzeugt der IG Publisher selbst aus der konfigurierten Seitenstruktur. |
| page-title | 2 | Setzt an dieser Stelle den Titel der Seite, der aus den Seiteneinstellungen gezogen wird. | Entfällt ersatzlos - Seitentitel und Überschrift steuert man zentral über die Seiten- und Menükonfiguration. |

</div>

# Anhang: Detailaufschlüsselung

_Im Anhang steht jeder Einzelwert mit seiner Quelle, damit man die Kennzahlen nachvollziehen kann, ohne im Projekt suchen zu müssen._

## Identität & Herkunft

_Kerndaten des IG (Kennungen, Version, Status, Herausgeber) und woher sie stammen._

<div align="center">

| Feld | Wert | Quelle |
|---|---|---|
| id | mii-ig-person | sushi-config.yaml / package.json |
| canonical | https://www.medizininformatik-initiative.de/fhir/core/modul-person | sushi-config.yaml / package.json |
| packageId | de.medizininformatikinitiative.kerndatensatz.person | sushi-config.yaml / package.json |
| name | MII_IG_Person | sushi-config.yaml / package.json |
| title | MII IG Person | sushi-config.yaml / package.json |
| version | 2025.0.1 | sushi-config.yaml / package.json |
| status | active | sushi-config.yaml / package.json |
| fhirVersion | 4.0.1 | sushi-config.yaml / package.json |
| license | CC-BY-4.0 | sushi-config.yaml / package.json |
| publisher | Medizininformatik Initiative | sushi-config.yaml / package.json |
| calver | True | version-Regex |

</div>

## Dependencies

_Die FHIR-Pakete, auf denen der IG aufbaut, samt Version und ob diese fest oder offen angegeben ist._

<div align="center">

| Package | Version | Pin |
|---|---|---|
| de.basisprofil.r4 | 1.5.x | floating ⚠ |
| de.medizininformatikinitiative.kerndatensatz.meta | 2025.0.x | floating ⚠ |

</div>

## Artefakte (Quelle: input/fsh (FSH-Deklarationen))

_Jedes definierte Artefakt mit Typ, Name und Fundort in den Quelldateien._

<div align="center">

| Typ | Name | InstanceOf | Quelle |
|---|---|---|---|
| Instance | mii-cps-person-capabilitystatement | CapabilityStatement | input/fsh/capabilitystatements/MII_CPS_Person_CapabilityStatement.fsh:1 |
| CodeSystem | MII_CS_Person_Vitalstatus |  | input/fsh/codesystems/MII_CS_Person_Vitalstatus.fsh:1 |
| Instance | mii-exa-person-condition-todesursache | MII_PR_Person_Todesursache | input/fsh/instances/MII_EXA_Person_Condition_Todesursache.fsh:1 |
| Instance | mii-exa-person-observation-vitalstatus | MII_PR_Person_Vitalstatus | input/fsh/instances/MII_EXA_Person_Observation_Vitalstatus.fsh:1 |
| Instance | mii-exa-person-patient-pseudonymisiert | MII_PR_Person_PatientPseudonymisiert | input/fsh/instances/MII_EXA_Person_Patient_Pseudonymisiert.fsh:1 |
| Instance | mii-exa-person-patient-full | MII_PR_Person_Patient | input/fsh/instances/MII_EXA_Person_Patient_full.fsh:1 |
| Instance | mii-exa-person-patient-minimal | MII_PR_Person_Patient | input/fsh/instances/MII_EXA_Person_Patient_minimal.fsh:1 |
| Invariant | GeburtsdatumRundenAufQuartal |  | input/fsh/invariants/GeburtsdatumRundenAufQuartal.fsh:1 |
| Invariant | PostleitzahlEinschraenkung |  | input/fsh/invariants/PostleitzahlEinschraenkung.fsh:1 |
| Invariant | TodesdatumKeineZeitangabe |  | input/fsh/invariants/TodesdatumKeineZeitangabe.fsh:1 |
| Invariant | ide-masked-1 |  | input/fsh/invariants/ide-masked-1.fsh:1 |
| Invariant | mii-pat-1 |  | input/fsh/invariants/mii-pat-1.fsh:1 |
| Invariant | mii-pat-2 |  | input/fsh/invariants/mii-pat-2.fsh:1 |
| Invariant | pat-cnt-2or3-char |  | input/fsh/invariants/pat-cnt-2or3-char.fsh:1 |
| Invariant | pat-pseuded-1 |  | input/fsh/invariants/pat-pseuded-1.fsh:1 |
| Invariant | pat-pseuded-2 |  | input/fsh/invariants/pat-pseuded-2.fsh:1 |
| Logical | MII_LM_Person |  | input/fsh/logicals/MII_LM_Person_LogicalModel.fsh:1 |
| Profile | MII_PR_Person_Patient |  | input/fsh/profiles/MII_PR_Person_Patient.fsh:1 |
| Profile | MII_PR_Person_PatientPseudonymisiert |  | input/fsh/profiles/MII_PR_Person_PatientPseudonymisiert.fsh:1 |
| Profile | MII_PR_Person_Proband |  | input/fsh/profiles/MII_PR_Person_Proband.fsh:1 |
| Profile | MII_PR_Person_Todesursache |  | input/fsh/profiles/MII_PR_Person_Todesursache.fsh:1 |
| Profile | MII_PR_Person_Vitalstatus |  | input/fsh/profiles/MII_PR_Person_Vitalstatus.fsh:1 |
| RuleSet | LicenseCodeableCCBY40 |  | input/fsh/rulesets/license-terms.fsh:3 |
| RuleSet | LicenseCodeableCCBY40Instance |  | input/fsh/rulesets/license-terms.fsh:7 |
| RuleSet | MetaProfile |  | input/fsh/rulesets/meta-profile.fsh:1 |
| RuleSet | Publisher |  | input/fsh/rulesets/publisher.fsh:1 |
| RuleSet | SP_Publisher |  | input/fsh/rulesets/publisher.fsh:6 |
| RuleSet | TestDataLabel |  | input/fsh/rulesets/test-data-label.fsh:3 |
| RuleSet | Translation |  | input/fsh/rulesets/translation.fsh:1 |
| RuleSet | Version |  | input/fsh/rulesets/version.fsh:2 |
| RuleSet | PR_CS_VS_Version |  | input/fsh/rulesets/version.fsh:5 |
| ValueSet | MII_VS_Person_Vitalstatus |  | input/fsh/valuesets/MII_VS_Person_Vitalstatus.fsh:1 |

</div>

## Narrative-Seiten (47 Inhalt / 54 gesamt)

_Die Erklärseiten des IG mit Umfang und der Angabe, ob es sich um Inhalts- oder reine Platzhalterseiten handelt._

<div align="center">

| Datei | Wörter | Format | Stub? |
|---|---|---|---|
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PatientPatient.page.md | 1389 | source |  |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md | 1325 | source |  |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md | 1266 | source |  |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Description.guide.md | 944 | source |  |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/BeschreibungModul.page.md | 836 | source |  |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/BeschreibungModul.page.md | 836 | source |  |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PseudonymisedPatient.page.md | 762 | source |  |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md | 711 | source |  |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md | 650 | source |  |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/TestPersonResearchSubject.page.md | 643 | source |  |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/ProbandInResearchSubject.page.md | 635 | source |  |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md | 626 | source |  |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/ProbandInResearchSubject.page.md | 612 | source |  |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md | 581 | source |  |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/VitalStatusObservation.page.md | 576 | source |  |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Index.page.md | 483 | source |  |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/Release-Notes.page.md | 465 | source |  |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md | 425 | source |  |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/Index.page.md | 422 | source |  |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/Index.page.md | 409 | source |  |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/CauseOfDeathCondition.page.md | 373 | source |  |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md | 369 | source |  |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Context.guide.md | 279 | source |  |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/UseCases/Scenariodescription.page.md | 260 | source |  |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/KontextimGesamtprojektBezgezuanderenModulen.page.md | 245 | source |  |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/KontextimGesamtprojektBezgezuanderenModulen.page.md | 245 | source |  |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/Release-Notes.page.md | 233 | source |  |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/Index.page.md | 222 | source |  |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/Index.page.md | 222 | source |  |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/AnwendungsflleInformationsmodell/BeschreibungvonSzenarienfrdieAnwendungderModule.page.md | 214 | source |  |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/AnwendungsflleInformationsmodell/BeschreibungvonSzenarienfrdieAnwendungderModule.page.md | 214 | source |  |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/References.guide.md | 137 | source |  |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/Index.page.md | 136 | source |  |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/Referenzen.page.md | 119 | source |  |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/Referenzen.page.md | 119 | source |  |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/Terminologies.page.md | 112 | source |  |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/UseCases/Dataset.page.md | 112 | source |  |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/Terminologie.page.md | 105 | source |  |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/CapabilityStatement.page.md | 98 | source |  |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/Terminologie.page.md | 98 | source |  |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/CapabilityStatement.page.md | 94 | source |  |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/AnwendungsflleInformationsmodell/Datenstzeinkl.Beschreibungen.page.md | 93 | source |  |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/CapabilityStatement.page.md | 93 | source |  |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/AnwendungsflleInformationsmodell/Datenstzeinkl.Beschreibungen.page.md | 93 | source |  |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/AnwendungsflleInformationsmodell/UML.page.md | 91 | source |  |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/UseCases/UML.page.md | 76 | source |  |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/AnwendungsflleInformationsmodell/UML.page.md | 70 | source |  |
| input/pagecontent/index.md | 17 | target | ja |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/AnwendungsflleInformationsmodell/Index.page.md | 13 | source | ja |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/AnwendungsflleInformationsmodell/Index.page.md | 13 | source | ja |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/Index.page.md | 12 | source | ja |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/UseCases/Index.page.md | 12 | source | ja |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/Index.page.md | 12 | source | ja |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/Index.page.md | 9 | source | ja |

</div>

> Format = **source**: Pflichtseiten existieren im Quell-Guide und werden bei der Migration ins Zielformat überführt; „fehlende Zielseiten" wird hier daher nicht als Lücke gewertet.

## Direktiven-Fundstellen

_Jede gefundene Direktive mit genauer Fundstelle und Originaltext zur weiteren Bearbeitung._

<div align="center">

| Fundstelle | Direktive | Text (gekürzt) |
|---|---|---|
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/AnwendungsflleInformationsmodell/Datenstzeinkl.Beschreibungen.page.md:9 | tree | {{tree:https://www.medizininformatik-initiative.de/fhir/core/modul-person/Struct |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/AnwendungsflleInformationsmodell/Datenstzeinkl.Beschreibungen.page.md:13 | fql-at | @``` from StructureDefinition where url =  'https://www.medizininformatik-initia |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/AnwendungsflleInformationsmodell/UML.page.md:8 | render | {{render:implementation-guides/ImplementationGuide-Common/images/KDS_Person_UML_ |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/BeschreibungModul.page.md:6 | render | {{render:implementation-guides/ImplementationGuide-Common/images/11_Abbildung_Pe |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/BeschreibungModul.page.md:14 | render | [{{render:implementation-guides/ImplementationGuide-Common/images/art-decor-pers |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/BeschreibungModul.page.md:21 | render | [{{render:implementation-guides/ImplementationGuide-Common/images/art-decor-pers |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/BeschreibungModul.page.md:27 | render | [{{render:implementation-guides/ImplementationGuide-Common/images/art-decor-pers |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/BeschreibungModul.page.md:36 | render | [{{render:implementation-guides/ImplementationGuide-Common/images/art-decor-pers |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/BeschreibungModul.page.md:71 | render | [{{render:implementation-guides/ImplementationGuide-Common/images/art-decor-pers |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/BeschreibungModul.page.md:82 | render | [{{render:implementation-guides/ImplementationGuide-Common/images/ProPerson.jpg} |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/Index.page.md:19 | index-root | {{index:root}} |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/Release-Notes.page.md:1 | page-title | ## {{page-title}} |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/Release-Notes.page.md:8 | pagelink | - Im Profil {{pagelink: PersonPatientIn, text: Patient:in (Patient), hint: MII_P |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/Release-Notes.page.md:9 | pagelink | - Das Profil {{pagelink: PersonPatientPseudonymisiert, text: Patient:in Pseudony |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/Release-Notes.page.md:13 | pagelink | - Neu im Vergleich zu Version 1.0 ist das Profil {{pagelink: PersonTodesursache, |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/Release-Notes.page.md:14 | pagelink | - Im {{pagelink: LogicalModel, text: Logischen Modell, hint: Datensätze inkl. Be |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/CapabilityStatement.page.md:18 | render | {{render:https://www.medizininformatik-initiative.de/fhir/core/modul-person/Capa |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/Index.page.md:28 | render | \| {{render:implementation-guides/ImplementationGuide-Common/images/Warning.jpg}} |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md:12 | link | ## {{link}} |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md:18 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md:29 | tabs | <tabs> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md:30 | tree | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md:30 | tabs | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md:31 | tabs | <tab title="Beschreibung"> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md:32 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md:42 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md:53 | tabs | </tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md:54 | xml | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md:54 | tabs | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md:55 | json | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md:55 | tabs | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md:56 | link | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md:56 | tabs | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md:57 | tabs | </tabs> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md:113 | fql-at | **Constraints**: @``` from StructureDefinition where url = 'https://www.medizini |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md:334 | json | {{json:fsh-generated/resources/Patient-mii-exa-person-patient-minimal.json}} |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md:338 | json | {{json:fsh-generated/resources/Patient-mii-exa-person-patient-full.json}} |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/ProbandInResearchSubject.page.md:12 | link | ## {{link}} |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/ProbandInResearchSubject.page.md:28 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/ProbandInResearchSubject.page.md:39 | tabs | <tabs> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/ProbandInResearchSubject.page.md:40 | tree | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/ProbandInResearchSubject.page.md:40 | tabs | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/ProbandInResearchSubject.page.md:41 | tabs | <tab title="Beschreibung"> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/ProbandInResearchSubject.page.md:42 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/ProbandInResearchSubject.page.md:52 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/ProbandInResearchSubject.page.md:63 | tabs | </tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/ProbandInResearchSubject.page.md:64 | xml | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/ProbandInResearchSubject.page.md:64 | tabs | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/ProbandInResearchSubject.page.md:65 | json | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/ProbandInResearchSubject.page.md:65 | tabs | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/ProbandInResearchSubject.page.md:66 | link | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/ProbandInResearchSubject.page.md:66 | tabs | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/ProbandInResearchSubject.page.md:67 | tabs | </tabs> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/ProbandInResearchSubject.page.md:77 | pagelink | \| ResearchSubject.meta.profile       \| VERPFLICHTEND für die Abfrage im DIZ-Reps |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/ProbandInResearchSubject.page.md:175 | json | {{json:fsh-generated/resources/Patient-mii-exa-person-patient-pseudonymisiert.js |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md:12 | link | ## {{link}} |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md:20 | render | \| {{render:implementation-guides/ImplementationGuide-Common/images/Warning.jpg}} |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md:22 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md:33 | tabs | <tabs> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md:34 | tree | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md:34 | tabs | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md:35 | tabs | <tab title="Beschreibung"> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md:36 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md:46 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md:57 | tabs | </tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md:58 | xml | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md:58 | tabs | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md:59 | json | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md:59 | tabs | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md:60 | link | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md:60 | tabs | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md:61 | tabs | </tabs> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md:98 | fql-at | **Constraints**: @``` from StructureDefinition where url = 'https://www.medizini |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md:211 | json | {{json:fsh-generated/resources/Patient-mii-exa-person-patient-pseudonymisiert.js |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md:12 | link | ## {{link}} |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md:18 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md:29 | tabs | <tabs> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md:30 | tree | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md:30 | tabs | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md:31 | tabs | <tab title="Beschreibung"> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md:32 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md:42 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md:53 | tabs | </tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md:54 | xml | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md:54 | tabs | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md:55 | json | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md:55 | tabs | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md:56 | link | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md:56 | tabs | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md:57 | tabs | </tabs> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md:68 | pagelink | \| Condition.meta.profile       \| VERPFLICHTEND für die Abfrage im DIZ-Repsoitory |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md:143 | json | {{json:fsh-generated/resources/Condition-mii-exa-person-condition-todesursache.j |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md:12 | link | ## {{link}} |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md:20 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md:31 | tabs | <tabs> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md:32 | tree | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md:32 | tabs | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md:33 | tabs | <tab title="Beschreibung"> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md:34 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md:44 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md:55 | tabs | </tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md:56 | xml | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md:56 | tabs | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md:57 | json | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md:57 | tabs | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md:58 | link | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md:58 | tabs | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md:59 | tabs | </tabs> |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md:69 | pagelink | \| Observation.meta.profile       \| VERPFLICHTEND für die Abfrage im DIZ-Repsoito |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md:88 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md:194 | json | {{json:fsh-generated/resources/Observation-mii-exa-person-observation-vitalstatu |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/Terminologie.page.md:8 | render | \| {{render:implementation-guides/ImplementationGuide-Common/images/Warning.jpg}} |
| implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/Terminologie.page.md:23 | render | {{render:https://www.medizininformatik-initiative.de/fhir/core/modul-person/Valu |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Description.guide.md:3 | render | {{render:implementation-guides/ImplementationGuide-Common/images/12_Abbildung_Pe |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Description.guide.md:11 | render | [{{render:implementation-guides/ImplementationGuide-Common/images/art-decor-pers |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Description.guide.md:18 | render | [{{render:implementation-guides/ImplementationGuide-Common/images/art-decor-pers |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Description.guide.md:24 | render | [{{render:implementation-guides/ImplementationGuide-Common/images/art-decor-pers |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Description.guide.md:33 | render | [{{render:implementation-guides/ImplementationGuide-Common/images/art-decor-pers |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Description.guide.md:63 | render | [{{render:implementation-guides/ImplementationGuide-Common/images/art-decor-pers |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Index.page.md:5 | render | \| {{render:implementation-guides/ImplementationGuide-Common/images/Warning.jpg}} |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Index.page.md:20 | index-root | {{index:root}} |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/CapabilityStatement.page.md:11 | render | {{render:https://www.medizininformatik-initiative.de/fhir/core/modul-person/Capa |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/CauseOfDeathCondition.page.md:14 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/CauseOfDeathCondition.page.md:25 | tabs | <tabs> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/CauseOfDeathCondition.page.md:26 | tree | <tab title="Visualization">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/CauseOfDeathCondition.page.md:26 | tabs | <tab title="Visualization">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/CauseOfDeathCondition.page.md:27 | tabs | <tab title="Description"> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/CauseOfDeathCondition.page.md:28 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/CauseOfDeathCondition.page.md:38 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/CauseOfDeathCondition.page.md:49 | tabs | </tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/CauseOfDeathCondition.page.md:50 | xml | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/CauseOfDeathCondition.page.md:50 | tabs | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/CauseOfDeathCondition.page.md:51 | json | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/CauseOfDeathCondition.page.md:51 | tabs | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/CauseOfDeathCondition.page.md:52 | link | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/CauseOfDeathCondition.page.md:52 | tabs | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/CauseOfDeathCondition.page.md:53 | tabs | </tabs> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/CauseOfDeathCondition.page.md:136 | json | {{json:fsh-generated/resources/Condition-mii-exa-person-condition-todesursache.j |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/Index.page.md:10 | render | \| {{render:implementation-guides/ImplementationGuide-Common/images/Warning.jpg}} |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PatientPatient.page.md:12 | link | ## {{link}} |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PatientPatient.page.md:18 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PatientPatient.page.md:29 | tabs | <tabs> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PatientPatient.page.md:30 | tree | <tab title="Visualization">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PatientPatient.page.md:30 | tabs | <tab title="Visualization">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PatientPatient.page.md:31 | tabs | <tab title="Description"> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PatientPatient.page.md:32 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PatientPatient.page.md:42 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PatientPatient.page.md:53 | tabs | </tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PatientPatient.page.md:54 | xml | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PatientPatient.page.md:54 | tabs | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PatientPatient.page.md:55 | json | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PatientPatient.page.md:55 | tabs | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PatientPatient.page.md:56 | link | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PatientPatient.page.md:56 | tabs | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PatientPatient.page.md:57 | tabs | </tabs> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PatientPatient.page.md:114 | fql-at | **Constraints**: @``` from StructureDefinition where url = 'https://www.medizini |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PatientPatient.page.md:334 | json | {{json:fsh-generated/resources/Patient-mii-exa-person-patient-minimal.json}} |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PatientPatient.page.md:338 | json | {{json:fsh-generated/resources/Patient-mii-exa-person-patient-full.json}} |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PseudonymisedPatient.page.md:12 | link | ## {{link}} |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PseudonymisedPatient.page.md:20 | render | \| {{render:implementation-guides/ImplementationGuide-Common/images/Warning.jpg}} |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PseudonymisedPatient.page.md:22 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PseudonymisedPatient.page.md:33 | tabs | <tabs> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PseudonymisedPatient.page.md:34 | tree | <tab title="Visualization">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PseudonymisedPatient.page.md:34 | tabs | <tab title="Visualization">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PseudonymisedPatient.page.md:35 | tabs | <tab title="Description"> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PseudonymisedPatient.page.md:36 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PseudonymisedPatient.page.md:46 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PseudonymisedPatient.page.md:57 | tabs | </tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PseudonymisedPatient.page.md:58 | xml | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PseudonymisedPatient.page.md:58 | tabs | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PseudonymisedPatient.page.md:59 | json | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PseudonymisedPatient.page.md:59 | tabs | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PseudonymisedPatient.page.md:60 | link | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PseudonymisedPatient.page.md:60 | tabs | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PseudonymisedPatient.page.md:61 | tabs | </tabs> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PseudonymisedPatient.page.md:98 | fql-at | **Constraints**: @``` from StructureDefinition where url = 'https://www.medizini |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PseudonymisedPatient.page.md:219 | json | {{json:fsh-generated/resources/Patient-mii-exa-person-patient-pseudonymisiert.js |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/TestPersonResearchSubject.page.md:12 | link | ## {{link}} |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/TestPersonResearchSubject.page.md:28 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/TestPersonResearchSubject.page.md:39 | tabs | <tabs> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/TestPersonResearchSubject.page.md:40 | tree | <tab title="Visualization">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/TestPersonResearchSubject.page.md:40 | tabs | <tab title="Visualization">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/TestPersonResearchSubject.page.md:41 | tabs | <tab title="Description"> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/TestPersonResearchSubject.page.md:42 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/TestPersonResearchSubject.page.md:52 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/TestPersonResearchSubject.page.md:63 | tabs | </tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/TestPersonResearchSubject.page.md:64 | xml | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/TestPersonResearchSubject.page.md:64 | tabs | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/TestPersonResearchSubject.page.md:65 | json | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/TestPersonResearchSubject.page.md:65 | tabs | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/TestPersonResearchSubject.page.md:66 | link | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/TestPersonResearchSubject.page.md:66 | tabs | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/TestPersonResearchSubject.page.md:67 | tabs | </tabs> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/TestPersonResearchSubject.page.md:175 | json | {{json:fsh-generated/resources/ResearchSubject-mii-exa-person-researchsubject-st |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/VitalStatusObservation.page.md:12 | link | ## {{link}} |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/VitalStatusObservation.page.md:20 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/VitalStatusObservation.page.md:31 | tabs | <tabs> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/VitalStatusObservation.page.md:32 | tree | <tab title="Visualization">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/VitalStatusObservation.page.md:32 | tabs | <tab title="Visualization">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/VitalStatusObservation.page.md:33 | tabs | <tab title="Description"> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/VitalStatusObservation.page.md:34 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/VitalStatusObservation.page.md:44 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/VitalStatusObservation.page.md:55 | tabs | </tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/VitalStatusObservation.page.md:56 | xml | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/VitalStatusObservation.page.md:56 | tabs | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/VitalStatusObservation.page.md:57 | json | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/VitalStatusObservation.page.md:57 | tabs | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/VitalStatusObservation.page.md:58 | link | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/VitalStatusObservation.page.md:58 | tabs | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/VitalStatusObservation.page.md:59 | tabs | </tabs> |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/VitalStatusObservation.page.md:89 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/VitalStatusObservation.page.md:187 | json | {{json:fsh-generated/resources/Observation-mii-exa-person-observation-vitalstatu |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/Terminologies.page.md:5 | render | \| {{render:implementation-guides/ImplementationGuide-Common/images/Warning.jpg}} |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/Terminologies.page.md:20 | render | {{render:https://www.medizininformatik-initiative.de/fhir/core/modul-person/Code |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/UseCases/Dataset.page.md:5 | render | {{render:https://www.medizininformatik-initiative.de/fhir/core/modul-person/Stru |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/UseCases/Dataset.page.md:9 | fql-at | @``` from StructureDefinition where url =  'https://www.medizininformatik-initia |
| implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/UseCases/UML.page.md:5 | render | {{render:implementation-guides/ImplementationGuide-Common/images/UML-Person.png} |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/AnwendungsflleInformationsmodell/Datenstzeinkl.Beschreibungen.page.md:9 | tree | {{tree:https://www.medizininformatik-initiative.de/fhir/core/modul-person/Struct |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/AnwendungsflleInformationsmodell/Datenstzeinkl.Beschreibungen.page.md:13 | fql-at | @``` from StructureDefinition where url =  'https://www.medizininformatik-initia |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/AnwendungsflleInformationsmodell/UML.page.md:8 | render | {{render:implementation-guides/ImplementationGuide-Common/images/UML-Person-2025 |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/BeschreibungModul.page.md:6 | render | {{render:implementation-guides/ImplementationGuide-Common/images/11_Abbildung_Pe |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/BeschreibungModul.page.md:14 | render | [{{render:implementation-guides/ImplementationGuide-Common/images/art-decor-pers |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/BeschreibungModul.page.md:21 | render | [{{render:implementation-guides/ImplementationGuide-Common/images/art-decor-pers |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/BeschreibungModul.page.md:27 | render | [{{render:implementation-guides/ImplementationGuide-Common/images/art-decor-pers |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/BeschreibungModul.page.md:36 | render | [{{render:implementation-guides/ImplementationGuide-Common/images/art-decor-pers |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/BeschreibungModul.page.md:71 | render | [{{render:implementation-guides/ImplementationGuide-Common/images/art-decor-pers |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/BeschreibungModul.page.md:82 | render | [{{render:implementation-guides/ImplementationGuide-Common/images/ProPerson.jpg} |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/Index.page.md:19 | index-root | {{index:root}} |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/Release-Notes.page.md:1 | page-title | ## {{page-title}} |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/Release-Notes.page.md:7 | pagelink | - `Added`: Profil {{pagelink: PersonPatientPseudonymisiert, text: Patient:in Pse |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/Release-Notes.page.md:16 | pagelink | - Dadurch Änderung im Profil {{pagelink: PersonPatientIn, text: Patient:in (Pati |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/Release-Notes.page.md:17 | pagelink | - Das Profil {{pagelink: PersonProbandIn, text: Proband:in (ResearchSubject), hi |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/Release-Notes.page.md:29 | pagelink | - Im Profil {{pagelink: PersonPatientIn, text: Patient:in (Patient), hint: MII_P |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/Release-Notes.page.md:30 | pagelink | - Das Profil {{pagelink: PersonPatientPseudonymisiert, text: Patient:in Pseudony |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/Release-Notes.page.md:34 | pagelink | - Neu im Vergleich zu Version 1.0 ist das Profil {{pagelink: PersonTodesursache, |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/Release-Notes.page.md:35 | pagelink | - Im {{pagelink: LogicalModel, text: Logischen Modell, hint: Datensätze inkl. Be |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/CapabilityStatement.page.md:18 | render | {{render:https://www.medizininformatik-initiative.de/fhir/core/modul-person/Capa |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/Index.page.md:28 | render | \| {{render:implementation-guides/ImplementationGuide-Common/images/Warning.jpg}} |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md:12 | link | ## {{link}} |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md:20 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md:31 | tabs | <tabs> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md:32 | tree | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md:32 | tabs | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md:33 | tabs | <tab title="Beschreibung"> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md:34 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md:44 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md:55 | tabs | </tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md:56 | xml | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md:56 | tabs | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md:57 | json | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md:57 | tabs | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md:58 | link | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md:58 | tabs | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md:59 | tabs | </tabs> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md:114 | fql-at | **Constraints**: @``` from StructureDefinition where url = 'https://www.medizini |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md:335 | json | {{json:fsh-generated/resources/Patient-mii-exa-person-patient-minimal.json}} |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md:339 | json | {{json:fsh-generated/resources/Patient-mii-exa-person-patient-full.json}} |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/ProbandInResearchSubject.page.md:12 | link | ## {{link}} |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/ProbandInResearchSubject.page.md:16 | render | \| {{render:implementation-guides/ImplementationGuide-Common/images/Warning.jpg}} |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/ProbandInResearchSubject.page.md:32 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/ProbandInResearchSubject.page.md:43 | tabs | <tabs> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/ProbandInResearchSubject.page.md:44 | tree | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/ProbandInResearchSubject.page.md:44 | tabs | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/ProbandInResearchSubject.page.md:45 | tabs | <tab title="Beschreibung"> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/ProbandInResearchSubject.page.md:46 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/ProbandInResearchSubject.page.md:56 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/ProbandInResearchSubject.page.md:67 | tabs | </tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/ProbandInResearchSubject.page.md:68 | xml | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/ProbandInResearchSubject.page.md:68 | tabs | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/ProbandInResearchSubject.page.md:69 | json | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/ProbandInResearchSubject.page.md:69 | tabs | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/ProbandInResearchSubject.page.md:70 | link | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/ProbandInResearchSubject.page.md:70 | tabs | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/ProbandInResearchSubject.page.md:71 | tabs | </tabs> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/ProbandInResearchSubject.page.md:81 | pagelink | \| ResearchSubject.meta.profile       \| VERPFLICHTEND für die Abfrage im DIZ-Reps |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md:12 | link | ## {{link}} |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md:20 | render | \| {{render:implementation-guides/ImplementationGuide-Common/images/Warning.jpg}} |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md:34 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md:45 | tabs | <tabs> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md:46 | tree | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md:46 | tabs | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md:47 | tabs | <tab title="Beschreibung"> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md:48 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md:58 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md:69 | tabs | </tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md:70 | xml | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md:70 | tabs | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md:71 | json | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md:71 | tabs | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md:72 | link | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md:72 | tabs | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md:73 | tabs | </tabs> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md:106 | fql-at | **Constraints**: @``` from StructureDefinition where url = 'https://www.medizini |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md:195 | json | {{json:fsh-generated/resources/Patient-mii-exa-person-patient-pseudonymisiert.js |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md:12 | link | ## {{link}} |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md:20 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md:31 | tabs | <tabs> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md:32 | tree | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md:32 | tabs | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md:33 | tabs | <tab title="Beschreibung"> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md:34 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md:44 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md:55 | tabs | </tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md:56 | xml | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md:56 | tabs | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md:57 | json | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md:57 | tabs | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md:58 | link | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md:58 | tabs | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md:59 | tabs | </tabs> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md:70 | pagelink | \| Condition.meta.profile       \| VERPFLICHTEND für die Abfrage im DIZ-Repsoitory |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md:145 | json | {{json:fsh-generated/resources/Condition-mii-exa-person-condition-todesursache.j |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md:12 | link | ## {{link}} |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md:20 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md:31 | tabs | <tabs> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md:32 | tree | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md:32 | tabs | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md:33 | tabs | <tab title="Beschreibung"> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md:34 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md:44 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md:55 | tabs | </tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md:56 | xml | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md:56 | tabs | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md:57 | json | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md:57 | tabs | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md:58 | link | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md:58 | tabs | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md:59 | tabs | </tabs> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md:69 | pagelink | \| Observation.meta.profile       \| VERPFLICHTEND für die Abfrage im DIZ-Repsoito |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md:88 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md:194 | json | {{json:fsh-generated/resources/Observation-mii-exa-person-observation-vitalstatu |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/Terminologie.page.md:8 | render | \| {{render:implementation-guides/ImplementationGuide-Common/images/Warning.jpg}} |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/Terminologie.page.md:23 | render | {{render:https://www.medizininformatik-initiative.de/fhir/core/modul-person/Valu |

</div>

## QC-Regeln (definiert; Quelle: qc/custom.rules.yaml)

_Die im Projekt hinterlegten Qualitätsregeln; ihre Einhaltung wird erst beim Qualitätslauf des Builds geprüft._

<div align="center">

| Name | Aktion | Prüfzweck (status) |
|---|---|---|
| parse-fhir-resources | parse | Checking if all FHIR Resource files can be parsed |
| conformance-version-filled |  | Checking if all conformance resources have correct version filled |
| instance-version-filled |  | Checking if all instances have correct version filled |
| — | Check for valid ids |  |
| naming-convention-id |  | Checking if all resource ids follow the naming convention |
| naming-convention-name |  | Checking if all resource names follow the naming convention |
| naming-convention-title |  | Checking if all resource titles follow the naming convention |
| naming-convention-url |  | Checking if all resource urls follow the naming convention |

</div>

> QC-Verletzungen werden erst beim Qualitätslauf des Builds erhoben (statisch nicht erfasst).

## Mehrsprachigkeit

_Sprachkonfiguration und welche Übersetzungsmittel bereits vorhanden sind._

- Default-Sprache: `None` (Quelle: None) · konfigurierte Sprachen: —
- Übersetzungs-Supplements: 0
- FSH-Translation-Extensions: ja

## Dopplungen & ungenutzte Dateien

_Konkrete Fundstellen doppelter Inhaltsblöcke sowie Listen nicht referenzierter Bilder und nicht eingebundener Beispiele._

<div align="center">

| Doppelter Inhaltsblock (gekürzt) | IG-Ordner | Vorkommen |
|---|---|---|
| anwendungshinweise: weitere informationen zur suche nach " id" finden sich in der [fhir ba | ⚠ ImplementationGuide-2024.x-DE / ImplementationGuide-2025.x-DE | implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md · implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/ProbandInResearchSubject.page.md · implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md · implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md · implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md · implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md · implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/ProbandInResearchSubject.page.md · implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md · implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md · implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md |
| anwendungshinweise: weitere informationen zur suche nach " profile" finden sich in der [fh | ⚠ ImplementationGuide-2024.x-DE / ImplementationGuide-2025.x-DE | implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md · implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/ProbandInResearchSubject.page.md · implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md · implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md · implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md · implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md · implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/ProbandInResearchSubject.page.md · implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md · implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md · implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md |
| anwendungshinweise: weitere informationen zur suche nach "patient.identifier" finden sich  | ⚠ ImplementationGuide-2024.x-DE / ImplementationGuide-2025.x-DE | implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md · implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md · implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md · implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md · implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md · implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md |
| the following searchparameters are relevant for the module person, also in combination: | ImplementationGuide-2024.x-EN | implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/CauseOfDeathCondition.page.md · implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PatientPatient.page.md · implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PseudonymisedPatient.page.md · implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/TestPersonResearchSubject.page.md · implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/VitalStatusObservation.page.md |
| note: additional information regarding the search using " id" can be found in [fhir core s | ImplementationGuide-2024.x-EN | implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/CauseOfDeathCondition.page.md · implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PatientPatient.page.md · implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PseudonymisedPatient.page.md · implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/TestPersonResearchSubject.page.md · implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/VitalStatusObservation.page.md |
| note: additional information regarding the search using " profile" can be found in [fhir c | ImplementationGuide-2024.x-EN | implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/CauseOfDeathCondition.page.md · implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PatientPatient.page.md · implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/PseudonymisedPatient.page.md · implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/TestPersonResearchSubject.page.md · implementation-guides/ImplementationGuide-2024.x-EN/MIIIGModulPersonEN/Technicalimplementation/FHIRprofiles/VitalStatusObservation.page.md |
| weitere vorgaben werden durch die profile für die datentypen humanname und address durch d | ⚠ ImplementationGuide-2024.x-DE / ImplementationGuide-2025.x-DE | implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md · implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md · implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md · implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md |
| anwendungshinweise: weitere informationen zur suche nach "patient.gender" finden sich in d | ⚠ ImplementationGuide-2024.x-DE / ImplementationGuide-2025.x-DE | implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md · implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md · implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md · implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md |
| anwendungshinweise: weitere informationen zur suche nach "patient.gender.extension:other a | ⚠ ImplementationGuide-2024.x-DE / ImplementationGuide-2025.x-DE | implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md · implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md · implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md · implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md |
| anwendungshinweise: weitere informationen zur suche nach "patient.birthdate" finden sich i | ⚠ ImplementationGuide-2024.x-DE / ImplementationGuide-2025.x-DE | implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md · implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md · implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md · implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md |
| anwendungshinweise: weitere informationen zur suche nach "patient.address.postalcode" find | ⚠ ImplementationGuide-2024.x-DE / ImplementationGuide-2025.x-DE | implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md · implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md · implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md · implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md |
| anwendungshinweise: weitere informationen zur suche nach "patient.address.country" finden  | ⚠ ImplementationGuide-2024.x-DE / ImplementationGuide-2025.x-DE | implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md · implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md · implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md · implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md |
| anwendungshinweise: weitere informationen zur suche nach "patient.address.city.extension:g | ⚠ ImplementationGuide-2024.x-DE / ImplementationGuide-2025.x-DE | implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md · implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md · implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PatientInPatient.page.md · implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/PseudonymisiertePatientinPatient.page.md |
| anwendungshinweise: weitere informationen zur suche nach "condition.subject" finden sich i | ⚠ ImplementationGuide-2024.x-DE / ImplementationGuide-2025.x-DE | implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md · implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md · implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md · implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/TodesursacheCondition.page.md |
| anwendungshinweise: weitere informationen zur suche nach "observation.subject" finden sich | ⚠ ImplementationGuide-2024.x-DE / ImplementationGuide-2025.x-DE | implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md · implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md · implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md · implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/VitalstatusObservation.page.md |

</div>

> ⚠ 119 Inhaltsblock/-blöcke kommen **ordnerübergreifend** (in mehreren IG-Ordnern) vor — Kandidat für Konsolidierung bzw. ausgelagerte Übersetzung.

**Identische Seiten:** `implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/AnwendungsflleInformationsmodell/BeschreibungvonSzenarienfrdieAnwendungderModule.page.md` = `implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/AnwendungsflleInformationsmodell/BeschreibungvonSzenarienfrdieAnwendungderModule.page.md`; `implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/AnwendungsflleInformationsmodell/Datenstzeinkl.Beschreibungen.page.md` = `implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/AnwendungsflleInformationsmodell/Datenstzeinkl.Beschreibungen.page.md`; `implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/AnwendungsflleInformationsmodell/Index.page.md` = `implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/AnwendungsflleInformationsmodell/Index.page.md`; `implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/BeschreibungModul.page.md` = `implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/BeschreibungModul.page.md`; `implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/KontextimGesamtprojektBezgezuanderenModulen.page.md` = `implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/KontextimGesamtprojektBezgezuanderenModulen.page.md`; `implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/Referenzen.page.md` = `implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/Referenzen.page.md`; `implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/Index.page.md` = `implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/FHIR-Profile/Index.page.md`; `implementation-guides/ImplementationGuide-2024.x-DE/MIIIGModulPerson/TechnischeImplementierung/Index.page.md` = `implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulPerson/TechnischeImplementierung/Index.page.md`

**Nicht referenzierte Bilder (6):** `implementation-guides/ImplementationGuide-Common/images/DemoPerson.jpg`, `implementation-guides/ImplementationGuide-Common/images/ModulPerson.JPG`, `implementation-guides/ImplementationGuide-Common/images/NamePerson.jpg`, `implementation-guides/ImplementationGuide-Common/images/PatPerson.jpg`, `implementation-guides/ImplementationGuide-Common/images/PersonGanz.jpg`, `implementation-guides/ImplementationGuide-Common/images/art-decor-person-2x-probandin.png`

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

# Anhang: Glossar

_Kurzerklärung der im Report verwendeten Fachbegriffe für Leser mit grundlegendem FHIR-Verständnis._

<div align="center">

| Begriff | Erklärung |
|---|---|
| Artefakt | Ein einzelnes definiertes Element im IG, z.B. ein Profil, eine Extension, ein ValueSet oder ein Beispiel - die Bausteine, die der IG bereitstellt. |
| ASK | Arzneimittel-Schlüssel - Identifikator für Wirkstoffe. |
| ATC | Anatomisch-Therapeutisch-Chemische Klassifikation für Arzneimittel. |
| Aufwandstreiber / Faktor | Eine zählbare Größe (z.B. Anzahl Direktiven), die mit einem Stundenfaktor multipliziert den geschätzten Aufwand ergibt. |
| Beispiel (Example/Instance) | Eine konkrete, ausgefüllte FHIR-Ressource, die zeigt, wie ein Profil in der Praxis aussieht. |
| CalVer (Kalender-Versionierung) | Ein Versionsschema, das die Version aus dem Datum ableitet (z.B. Jahr.Nummer), statt fortlaufender Zählung. |
| Canonical-URL | Die weltweit eindeutige, dauerhafte Web-Adresse, mit der ein Artefakt offiziell identifiziert und referenziert wird. |
| CapabilityStatement | Eine Beschreibung, welche FHIR-Funktionen ein Server oder System unterstützt (welche Ressourcen, Operationen, Suchparameter). |
| CC0 | Creative Commons Zero (CC0-1.0) - gemeinfrei, freie Nutzung ohne Einschränkung. |
| CI | Continuous Integration - automatisierte Bau-/Prüf-Pipeline, die bei jeder Änderung Tests/Validierung ausführt. |
| CodeSystem | Eine Sammlung von Codes mit ihrer Bedeutung - die Quelle, aus der ein ValueSet seine Codes bezieht. |
| CS / VS | Kurz für CodeSystem (CS) und ValueSet (VS) - auch in FSH-Bezeichnern wie CS_..., VS_... |
| Default-Sprache | Die Hauptsprache des IG, in der die Inhalte primär verfasst und ausgeliefert werden (z.B. de-DE). |
| Dependency (Abhängigkeit) | Ein anderes FHIR-Paket, auf dessen Inhalte der IG aufbaut und das beim Bauen mitgeladen wird. |
| Direktive | Ein spezieller Platzhalter oder Tag in einer Seite, der zur Anzeige-Zeit durch generierten Inhalt ersetzt wird (z.B. ein eingebettetes Diagramm oder eine Tabelle). |
| Element-Wörterbuch (Dictionary) | Eine Tabelle, die alle Elemente eines Profils mit Beschreibung, Kardinalität und Datentyp auflistet. |
| Extension | Eine standardisierte Erweiterung, mit der man einer FHIR-Ressource zusätzliche Informationen hinzufügt, die der Basisstandard nicht vorsieht. |
| FHIR | Fast Healthcare Interoperability Resources - internationaler HL7-Standard für den Austausch von Gesundheitsdaten; Grundlage aller hier analysierten IGs. |
| FHIR-Version | Die Version des FHIR-Standards, auf der der IG aufbaut (z.B. 4.0.1 = FHIR R4). |
| FQL (FHIR Query Language) | Eine Abfragesprache aus der Quellplattform, mit der Tabellen aus FHIR-Inhalten erzeugt werden - im generischen IG Publisher nicht verfügbar. |
| FSH (FHIR Shorthand) | Eine kompakte Textsprache, in der Profile, Extensions und andere FHIR-Artefakte geschrieben werden; ein Werkzeug übersetzt sie in die eigentlichen FHIR-Dateien. |
| FSH-Translation-Extension | Eine im FSH gesetzte Erweiterung, die übersetzte Textfassungen direkt in die Ressource einbettet; der Build kann daraus mehrsprachige Anzeigen erzeugen. |
| GoFSH | Das umgekehrte Werkzeug zu SUSHI: Es erzeugt aus vorhandenen FHIR-Dateien (JSON) FSH-Quellcode - nötig, wenn ein IG noch kein FSH besitzt. |
| Heuristische Schätzung | Eine näherungsweise, auf Erfahrungswerten beruhende Schätzung - kein exakter Wert, sondern eine Spanne. |
| HITL | Human-in-the-Loop - eine KI bereitet Routinearbeit vor, ein Mensch prüft und gibt an Kontrollpunkten (Review-Gates) frei. |
| HL7 | Health Level Seven - internationale Standardisierungsorganisation im Gesundheitswesen; Herausgeber von FHIR und des IG Publishers. |
| HTML / XML / JSON | Technische Formate: HTML = Webseiten; XML und JSON = strukturierte Darstellungen von Daten/Ressourcen (z.B. für FHIR-Beispiele). |
| Human-in-the-Loop (HITL) | Arbeitsweise, bei der eine KI Routinearbeit vorbereitet und ein Mensch an definierten Prüfpunkten (Review-Gates) kontrolliert und freigibt. |
| ICD-10 | Internationale Klassifikation der Krankheiten (Diagnoseschlüssel). |
| id / packageId / name / title | Verschiedene Kennungen eines IG: id ist die technische Kurzbezeichnung, packageId der Paketname zur Auslieferung, name der maschinenlesbare Name, title der Anzeigetitel. |
| IG Publisher | Das offizielle Werkzeug von HL7, das aus den Quelldateien eines IG die fertige Webseite (HTML) und das Veröffentlichungspaket erzeugt. |
| IG-Ordner | Ein Unterordner unter implementation-guides/, der einen (Simplifier-)Leitfaden enthält; ein Repo kann mehrere enthalten (z.B. je Sprache de/en) - relevant für ordnerübergreifende Text-Dopplungen. |
| ig.ini | Eine kleine Startkonfigurationsdatei, die dem IG Publisher grundlegende Bau-Einstellungen vorgibt. |
| Implementierungsleitfaden (IG) | Ein Dokumentenpaket, das beschreibt, wie ein FHIR-Standard für einen konkreten Anwendungsfall genau zu verwenden ist - mit Regeln, Beispielen und erklärendem Text. |
| Include (Vorlagen-Fragment) | Vorlagen-Mechanismus des IG Publishers: Mit einem Include-Befehl bindet man vorgefertigte HTML-Fragmente (z.B. die Strukturtabelle einer Ressource) in eine Seite ein. |
| Invariant | Eine zusätzliche Prüfregel (Bedingung), die eine Ressource erfüllen muss, um gültig zu sein. |
| KDS | Kerndatensatz der MII - modular aufgebauter gemeinsamer Datenbestand (Module wie Diagnose, Person, Dokument). |
| Lizenz | Die Nutzungsbedingungen des IG (z.B. CC-BY-4.0, CC0-1.0) - legen fest, unter welchen Bedingungen Inhalte genutzt und weitergegeben werden dürfen. |
| Logical Model | Ein abstraktes Datenmodell, das Inhalte fachlich beschreibt, ohne direkt an einen FHIR-Ressourcentyp gebunden zu sein. |
| LOINC | Internationale Terminologie für Laborwerte/Messungen und Dokumenttypen; frei (Registrierung). |
| Mapping | Eine Zuordnung, die zeigt, wie Elemente eines Modells anderen Standards oder Modellen entsprechen. |
| Mehrsprachigkeit (i18n) | Fähigkeit eines IG, Inhalte in mehreren Sprachen bereitzustellen; eine Sprache ist führend/verbindlich. |
| Mermaid-Diagramm | Ein aus Textbeschreibung erzeugtes Diagramm (hier ein Tortendiagramm), das direkt in Markdown eingebettet wird. |
| Migrationsaufwand / Band | Eine grobe Schätzung des Arbeitsaufwands für die Überführung in Personenstunden, eingeordnet in eine Größenklasse (Band S/M/L/XL). |
| MII | Medizininformatik-Initiative - deutsche Förderinitiative; Herausgeberin des Kerndatensatzes (KDS). |
| Narrative-Seite | Eine frei geschriebene Erklärseite des IG (Fliesstext, meist Markdown), im Gegensatz zu den automatisch generierten Artefaktseiten. |
| Personentag (PT) / Personenstunde | Maßeinheit für ARBEITSAUFWAND (Personenzeit): 1 PT = 8 Personenstunden produktiver menschlicher Arbeit - NICHT Kalenderzeit (die zusätzlich Teamgröße/Auslastung berücksichtigt). Bei der manuellen Schätzung die Migrationsarbeit von Hand; bei der KI-gestützten Schätzung die menschliche Bedien-/Prüfzeit (Prompts, Review-Gates, Korrekturen), NICHT die Rechen-/Laufzeit der KI und NICHT die Wartezeit auf den Task-Abschluss. |
| Pflichtseiten | Ein festes Raster an Standardseiten (z.B. Startseite, Anwendungsfälle, Konformität, Änderungen), das ein vollständiger IG enthalten sollte. |
| PII | Personally Identifiable Information - personenidentifizierende Daten (z.B. Name, Geburtsdatum); in Beispielen zu vermeiden (Datenschutz). |
| Pinning (gepinnt/floating) | 'Gepinnt' heißt, eine Abhängigkeit ist auf eine feste Version festgelegt; 'floating' heißt, sie folgt automatisch der neuesten Version - was Builds weniger reproduzierbar macht. |
| PR | Pull Request - Vorschlag, Änderungen aus einem Branch in einen anderen (z.B. dev -> main) zu übernehmen, mit Review vor dem Zusammenführen. |
| Profile | Eine Einschränkung/Anpassung eines FHIR-Basistyps für einen bestimmten Zweck - legt fest, welche Felder Pflicht sind, welche Werte erlaubt sind usw. |
| Publisher | Die herausgebende Organisation, die für den IG verantwortlich zeichnet. |
| QA-Meldungen (Errors/Warnings/Hints) | Hinweise aus dem Build-Qualitätsbericht: Fehler verhindern eine saubere Veröffentlichung, Warnungen und Hinweise sind weniger kritisch. |
| QC-Regel (Qualitätsregel) | Eine formalisierte Prüfregel, die beim Qualitätslauf prüft, ob Ressourcen gültig sind und Konventionen (z.B. Namensschema) einhalten. |
| Quell-/Zielformat (source/target) | 'source' kennzeichnet Seiten im ursprünglichen Plattformformat, 'target' Seiten bereits im Format des Ziel-IG. |
| R4 / R4B / R5 | Versionsstände des FHIR-Standards (R4 = 4.0.1, weit verbreitet; R4B = 4.3.0; R5 = 5.0.0, neueste stabile). |
| RuleSet | Ein wiederverwendbarer Block von FSH-Regeln, der in mehreren Artefakten eingebunden werden kann, um Wiederholungen zu vermeiden. |
| Snapshot / Differential | Zwei Sichten eines Profils: Differential zeigt nur die Änderungen gegenüber der Basis, Snapshot die vollständige Struktur mit allen Elementen. |
| SNOMED CT | Umfassende internationale klinische Terminologie; meist lizenzpflichtig (Affiliate/Land). |
| statischer / full-Modus | Statisch heißt, es wird nur der Quellcode ausgewertet ohne den IG zu bauen; im full-Modus wird zusätzlich gebaut, um z.B. Validierungsfehler zu erfassen. |
| Status (draft/active) | Reifegrad eines IG oder Artefakts; 'draft' bedeutet Entwurf, noch nicht endgültig freigegeben. |
| Stub-Seite | Eine sehr kurze Seite (z.B. nur Navigation oder Platzhalter, unter 20 Wörtern), die keinen echten Inhalt trägt. |
| SUSHI | Das Werkzeug, das FSH-Dateien in fertige FHIR-Ressourcen (JSON) umwandelt. |
| sushi-config.yaml | Die zentrale Konfigurationsdatei eines FSH-basierten IG: enthält Kennungen, Version, Abhängigkeiten, Seiten- und Menüstruktur. |
| UCUM | Unified Code for Units of Measure - standardisierte Codes für Maßeinheiten. |
| Unterdrückte Warnungen | Bewusst ausgeblendete QA-Meldungen, die als bekannt/akzeptiert gelten und den Bericht nicht stören sollen. |
| Validierung | Prüfung, ob eine FHIR-Ressource dem Standard und ihrem Profil entspricht. |
| ValueSet | Eine definierte Auswahl erlaubter Codes (Werteliste), die für ein bestimmtes Feld zulässig sind. |
| Übersetzungs-Supplement | Eine separate Datei, die übersetzte Texte zu einer Terminologie- oder Strukturressource liefert, ohne das Original zu verändern. |

</div>
