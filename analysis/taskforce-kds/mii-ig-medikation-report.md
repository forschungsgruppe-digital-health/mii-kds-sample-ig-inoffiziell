# IG-Statistik — MII KDS Medikation v2026.0.1

_Modus: `static` · Stand: 2026-06-26T21:58:49Z · Commit: `58b4996`_

## Executive Summary: Migration des FHIR-Leitfadens "MII IG Medikation"

> **Worum geht es?** Ein FHIR Implementation Guide (kurz „IG“) ist die technische Spezifikation eines Datenstandards im Gesundheitswesen – das Regelwerk plus die zugehörige Online-Dokumentation. Dieser IG soll von einer herstellergebundenen Plattform auf das herstellerneutrale Standard-Werkzeug der FHIR-Community (den „IG Publisher“) umgezogen werden. Inhaltlich ändert sich nichts – nur die technische Bauweise der Veröffentlichung. _Fachbegriffe sind im Glossar am Dokumentende erklärt._

### Das Wichtigste in einem Satz

Der Umzug ist **umfangreich** (geschätzt **67–110 Personenstunden**, also rund **8,4–13,7 Personentage**), **mit wenigen vorab zu klärenden Punkten** – die fachliche Substanz liegt bereits in maschinenlesbarer, sauberer Form vor. Mit KI-Unterstützung lässt sich der Aufwand voraussichtlich deutlich senken (modellierte ~38–62 h, ≈ 43 % weniger; Annahmen und Vorbehalte siehe „Aufwand“).

### Inhaltlicher Umfang (was migriert wird)

- **Identität:** `mii-ig-medikation`, Version 2026.0.1, Herausgeber Medizininformatik Initiative, Lizenz CC-BY-4.0, Status „active“.
- **40 fachliche Bausteine:** 5 Profile (Kernregelwerk), 2 Erweiterungen, 5 Werte-Listen, 1 Codesystem, 1 logisches Datenmodell, 1 Fähigkeitsbeschreibung, 25 Beispiele.
- **Dokumentation:** 36 inhaltliche Textseiten (~14257 Wörter, Ø 396 Wörter/Seite) und 22 Bilder.

### Aufwand und was das Band bedeutet

- **Aufwandsband: L (groß)** – auf einer Skala S (klein, <1 Tag) / M (mittel, einige Tage) / L (groß, 1–2 Wochen) / XL (sehr groß) liegt dieses Vorhaben **im oberen Bereich**.
- **Manuell: rund 67–110 Stunden.** Das ist eine **Größenordnungsschätzung zur Budgetplanung** (Faustregel: Menge der Arbeitsschritte × Erfahrungswert) – **kein verbindliches Angebot**.
- **KI-gestützt teilautomatisiert: rund 38–62 Stunden** (≈ 43 % weniger). Das heißt: eine KI erledigt die wiederkehrenden Umbauten, Menschen prüfen und geben an Kontrollpunkten frei (Human-in-the-Loop / Review-Gates). Die Schätzung gilt **unabhängig davon, welches KI-Produkt eingesetzt wird** – sie ist eine _modellierte_ Annahme mit noch nicht kalibrierten Faktoren, **keine garantierte Einsparung**.
- **Größte Aufwandstreiber:** 316 plattformspezifische Platzhalter in den Textseiten (sog. „Direktiven“ – das neue Standard-Werkzeug kennt sie nicht, sie werden einzeln umgebaut; ~63 h) und 36 Inhaltsseiten (~18 h).
- **Reife & Strategie:** Reifegrad **50/100 (in Entwicklung)** · Hersteller-Lock-in hoch. (Details in den Abschnitten Reife & Freigabe und Strategie.)

### Wie sauber ist die Quelle?

- **Regeln liegen bereits in der bearbeitbaren Textform (FSH) vor – kein aufwändiger Rückbau nötig (Effizienzvorteil).**
- **5 externe Abhängigkeiten, davon 2 fest verankert, 3 beweglich.** Bewegliche Versionen vor der Migration auf feste Stände festlegen.
- **Versionsnummer aus dem Kalenderjahr (CalVer)** – wird unverändert übernommen, kein Anpassungsbedarf.
- **Mehrsprachigkeit bereits technisch vorbereitet** – Übersetzungen können automatisch mitgenommen werden.
- **8 Qualitätsregeln** bereits definiert und 1:1 übernehmbar.

### Risiken und Blocker

- **Zu klären vor Start: bewegliche Abhängigkeiten (vor Migration fixieren).**
- **Schätzungs-Vorbehalt:** beruht auf einer rein **statischen** Analyse der Quelldateien (ohne Test-Build); ein vollständiger Validierungslauf kann zusätzliche Detailkorrekturen aufdecken. Die Erfahrungswerte sind noch nicht final kalibriert – daher die bewusst breite Spanne.
- **Risikomindernd:** Der Umzug erfolgt isoliert auf einem separaten Arbeitszweig, ohne Eingriff in den produktiven Stand; ein menschliches Abschluss-Review ist vorgesehen.

### Bottom Line / Empfehlung

**Durchführbar – mit Ressourcen- und Zeitplanung.** Der Aufwand ist groß und kalkulierbar (manuell ~8,4–13,7 Personentage, KI-gestützt voraussichtlich spürbar weniger), die Quelle ist mit überschaubaren Vorarbeiten. Konkret einzuplanen: ein abschließender Validierungslauf mit fachlichem Review.

## Kennzahlen-Überblick

### Artefakte (Σ 40 publiziert)

_Hier wird gezählt, wie viele FHIR-Bausteine (Profile, Extensions, ValueSets usw.) der IG je Typ definiert._

<div align="center">

```mermaid
%%{init: {'theme':'base','themeVariables':{"pie1": "#4E79A7", "pie2": "#F28E2B", "pie3": "#59A14F", "pie4": "#E15759", "pie5": "#76B7B2", "pie6": "#EDC948", "pie7": "#B07AA1", "pieOpacity": "1", "pieSectionTextColor": "#1A1A1A", "pieTitleTextSize": "18px"}}}%%
pie showData title Artefakte
    "examples" : 25
    "profiles" : 5
    "valuesets" : 5
    "extensions" : 2
    "codesystems" : 1
    "logicals" : 1
    "capabilitystatements" : 1
```

</div>

<div align="center">

| Typ | Anzahl |
|---|---|
| examples | 25 |
| profiles | 5 |
| valuesets | 5 |
| extensions | 2 |
| codesystems | 1 |
| logicals | 1 |
| capabilitystatements | 1 |

</div>

_Interne FSH-Konstrukte (nicht in Σ): 28 rulesets, 3 invariants, 2 mappings._

### Plattform-Direktiven — Σ 316 (unbekannt: 0)

_Dieser Abschnitt listet die plattformspezifischen Platzhalter in den Erklärseiten, die ein generischer IG Publisher nicht versteht und die daher umgesetzt werden müssen._

<div align="center">

```mermaid
%%{init: {'theme':'base','themeVariables':{"pie1": "#4E79A7", "pie2": "#F28E2B", "pie3": "#59A14F", "pie4": "#E15759", "pie5": "#76B7B2", "pie6": "#EDC948", "pie7": "#B07AA1", "pie8": "#FF9DA7", "pie9": "#9C755F", "pie10": "#BAB0AC", "pieOpacity": "1", "pieSectionTextColor": "#1A1A1A", "pieTitleTextSize": "18px"}}}%%
pie showData title Direktiven
    "tabs" : 112
    "fql-at" : 58
    "json" : 58
    "render" : 22
    "link" : 18
    "tree" : 16
    "xml" : 14
    "page-title" : 8
    "pagelink" : 8
    "index-root" : 2
```

</div>

<div align="center">

| Direktive | Anzahl |
|---|---|
| tabs | 112 |
| fql-at | 58 |
| json | 58 |
| render | 22 |
| link | 18 |
| tree | 16 |
| xml | 14 |
| page-title | 8 |
| pagelink | 8 |
| index-root | 2 |

</div>

## Inhaltsumfang & Repo-Hygiene

_Linguistische Kennzahlen zum Textumfang (Wörter je Seite, Durchschnitt) sowie Hinweise auf inhaltliche Dopplungen und nicht referenzierte Dateien (Dead-Code-Analogie) - hilft, Umfang und Aufräumpotenzial einzuschätzen._

<div align="center">

| Kennzahl | Wert |
|---|---|
| Enthaltene IG-Ordner | 2 |
| Inhalts-Seiten | 36 |
| Wörter gesamt | 14257 |
| Ø Wörter / Seite | 396 |
| Median Wörter / Seite | 360 |
| kürzeste / längste Seite | 85 / 1127 Wörter |
| doppelte Inhaltsblöcke | 128 (davon 126 ordnerübergreifend) |
| identische Seiten (Gruppen) | 7 |
| Bilder nicht referenziert | 18 von 22 |
| Beispiele nicht in Narrativen | 2 von 25 |

</div>

**Enthaltene IG-Ordner (2) — Aufschlüsselung je IG (Spalten: aktuell → ältest):**

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

> ⚠ Das Repo enthält **2 IG-Ordner** (Versions-/Sprachvarianten). Aggregat-Kennzahlen (Direktiven, Wörter, **Aufwand**) summieren über **alle** Ordner — für die Migration **einer** Version entsprechend nach unten zu korrigieren; die 126 ordnerübergreifenden Dopplungen zeigen das Ausmaß.

_Heuristik: 'nicht referenziert' = Dateiname/Artefaktname kommt in keiner Erklärseite vor. Kein Beweis für Ungenutztheit (Referenz kann über Konfiguration/Build erfolgen)._

## Aufwand: manuell vs. KI-gestützt

_Dieser Abschnitt schätzt den Arbeitsaufwand der Überführung als Spanne - manuell und KI-gestützt teilautomatisiert - abgeleitet aus zählbaren Treibern und Stundenfaktoren._

<div align="center">

| Treiber | Menge | manuell [h] | KI-gestützt [h] |
|---|---|---|---|
| Direktiven (bekannt) | 316 | 63,2 | 25,3 |
| Inhalts-Seiten | 36 | 18 | 7,2 |
| Floating Pins (Versionen fixieren) | 3 | 3 | 2,4 |
| GoFSH-Vorlauf (Regel-Rückgewinnung) | nein | 0 | 0 |
| Direktiven (unbekannt → manuell) | 0 | 0 | 0 |
| Einarbeitung/Setup (einmalig) | — | 0 | 3 |
| Review-Gates (Pauschale) | — | 0 | 3 |
| Validierungs-/Iterationsaufschlag (20 %) | — | 0 | 7 |

</div>

**Manuell:** Band L · **67,4–109,5 h**  |  **KI-gestützt (HITL, Review-Gates, anbieter-/modellunabhängig):** Band L · **38,3–62,2 h** · **≈ 43 % weniger**

_Annahmen:_ • Nur statisch berechenbare Treiber; id/url-Mismatch, QC-Verletzungen und quell-intrinsische Validierungsfehler erfordern einen Build und sind hier nicht enthalten. • Faktoren sind Erfahrungswerte, noch nicht final kalibriert; Spanne = Basis × 0,8…1,3. • pages = Inhalts-Seiten (Stubs/Navigation < 20 Wörter ausgeschlossen). • Personentage = Aufwand in 8-h-Arbeitstagen (1 PT = 8 Personenstunden); beide Schätzungen messen MENSCHLICHE Arbeitszeit — manuell die Migration von Hand, KI-gestützt die Bedien-/Review-Zeit der KI (Prompts, Review-Gates, Korrekturen), NICHT die Rechen-/Laufzeit oder Wartezeit der KI. • KI-Schätzung: anbieter-/modellunabhängig (Human-in-the-Loop, Review-Gates). Enthält feste Pauschalen für Einarbeitung/Setup (3 h) und Review-Gates (3 h) sowie einen Validierungs-/Iterationsaufschlag (20 %); unbekannte Direktiven werden wie manuell gerechnet. Bewusst konservativ – keine garantierte Einsparung.

## Reife & Freigabe

_Verdichteter Reifegrad als Freigabe-Indikator: Status, Vollständigkeit der Dokumentation, Beispiel-Abdeckung der Profile und Governance-Reife._

<div align="center">

| Komponente | Wert |
|---|---|
| **Reifegrad-Score** | **50/100 (in Entwicklung)** |
| Status | active |
| Doku-Vollständigkeit (Inhalt vs. Stubs) | 90 % |
| Beispiel-Abdeckung Profile | 0 % (0/5) |
| Governance (CI · ig.ini · publication · devcontainer) | 25/100 |

</div>

**Profile ohne Beispiel (5):** `MII_PR_Medikation_Medikationsliste`, `MII_PR_Medikation_Medication`, `MII_PR_Medikation_MedicationAdministration`, `MII_PR_Medikation_MedicationRequest`, `MII_PR_Medikation_MedicationStatement`

## Strategie: Wiederverwendung, Lock-in & Zukunftssicherheit

_Strategische Kennzahlen: Bindung an die Quellplattform (Lock-in), Anteil standardisierter Terminologie, Wiederverwendung externer Bausteine und Zukunftssicherheit (FHIR-Version, Pflege-Aktivität)._

<div align="center">

| Kennzahl | Wert |
|---|---|
| Hersteller-Lock-in | 100/100 (hoch) · 8,8 Direktiven/Seite |
| Standard-Terminologie-Anteil | 100 % (SNOMED CT, LOINC, ICD-10, UCUM, ATC, ASK) |
| Wiederverwendung externer Profile (Parents) | 100 % (5 von 5 Profil-Parents extern; abstrakte LM-Basistypen ausgeschlossen) |
| FHIR-Version | R4 — aktuell verbreitet |
| Dependency-Veraltung | 0 veraltet (Heuristik) |
| Pflege-Kadenz | 72.3 Commits/Jahr · letzter Commit vor 133 Tagen |

</div>

_Lock-in und Standard-Terminologie-Anteil sind grobe Heuristiken aus Textvorkommen. Heuristik aus CalVer-Jahr; exakt nur via Package-Registry (extern)._

## Planung & Terminierung

_Planungsgrößen jenseits reiner Personenstunden: Kalenderzeit, Szenarien (Min/Erwartet/Max), Schätz-Konfidenz, Startbereitschaft und grober Rollen-Mix._

<div align="center">

| Planungsgröße | Wert |
|---|---|
| Kalenderzeit | 15–23 Arbeitstage |
| Szenario Min / Erwartet / Max | 67,4 / 88,5 / 109,5 h |
| Schätz-Konfidenz | mittel |
| Startbereitschaft | 85/100 |
| Cross-Modul-Abhängigkeit | erhöht (floating Pins) |
| KI-Fixaufwandsanteil | 10 % |

</div>

**Rollen-Mix (grob):** FSH-Rückgewinnung/Pins 4 % · Template/Tooling (Direktiven) 75 % · Redaktion/Doku (Seiten) 21 %. Direktiven & Seiten gut parallelisierbar; Setup/QA seriell.

_Hinweis: FHIR-/FSH-Fachwissen ist für Review, Validierung und QC-Übernahme generell erforderlich; ein 0-%-Wert bei FSH bedeutet nur, dass **kein FSH-Rückbau (GoFSH)** anfällt. Annahmen Kalenderzeit: 8 h/Tag · Team 1 · Auslastung 60 %._

## Risiko & Compliance

_Entscheidungsrelevante Risiken für die Freigabe: Terminologie-Lizenzen, unterdrückte Warnungen, Datenschutz-Substanz, Wissenskonzentration (Bus-Faktor) und Kompatibilitätsbruch zur Vorversion._

<div align="center">

| Risiko | Bewertung |
|---|---|
| Terminologie-Lizenz | Lizenzbedarf möglich — SNOMED CT: lizenzpflichtig (Affiliate/Land), LOINC: frei (Registrierung), ICD-10: frei, UCUM: frei, ATC: eingeschränkt, ASK: frei |
| Unterdrückte QA-Warnungen | 0 (davon 0 breit) → keine |
| Datenschutz-Seite (Substanz) | fehlt/nur Stub (0 Wörter) |
| PII-artige Beispieldaten | keine erkannt |
| Bus-Faktor (Wissenskonzentration) | 51 % Top-Autor → gering |
| Breaking-Change-Risiko ggü. Vorversion | — (nur per Build/Vorversions-Diff) |

</div>

## Empfehlungen für die Überführung in ein generisches HL7-FHIR-IG

_Hier stehen je Themenbereich konkrete, aus den Kennzahlen abgeleitete Schritte, um den IG in das generische HL7-FHIR-IG-Format zu überführen._

<div align="center">

| Bereich | Befund | Empfehlung |
|---|---|---|
| Artefakte (FSH) | 40 publiziert, FSH vorhanden | Liegen die Artefakte bereits als FSH vor, können sie unverändert nach input/fsh/ übernommen werden; ein Rückwandeln aus fertigen FHIR-Dateien entfällt. Wichtig: ids und Canonical-URLs bleiben gleich, damit bestehende Verweise weiter funktionieren (Bestandsschutz). |
| Narrative | 36 Inhalts-Seiten, Format source | Die frei geschriebenen Erklärseiten gehören als Markdown-Dateien nach input/pagecontent/. Reine Platzhalter-/Navigationsseiten werden nicht übernommen, da Navigation und Inhaltsverzeichnis automatisch entstehen. |
| Direktiven | 316 (0 unbekannt) | Plattformspezifische Platzhalter/Tags werden durch die passenden Mechanismen des IG Publishers ersetzt (meist Vorlagen-Includes oder normale Markdown-Konstrukte). Direktiven ohne bekanntes Gegenstück werden einzeln von Hand geprüft und sinnvoll übersetzt. |
| Dependencies | 5 (3 floating) | Alle deklarierten Paket-Abhängigkeiten werden mit fester Version in die sushi-config.yaml übernommen. Feste Versionen (Pinning) sind reproduzierbaren Builds vorzuziehen; bewegliche Einträge werden auf eine konkrete Version festgelegt. |
| Mehrsprachigkeit | FSH-Übersetzung ja, Supplements 0 | In Ressourcen eingebettete Übersetzungen werden vom Build automatisch in die jeweilige Sprachausgabe übernommen. Für übersetzte Erklärseiten legt man pro Sprache eigene Seiten an; eine Sprache bleibt führend, jede maschinelle Übersetzung ist menschlich zu prüfen. |
| Pflichtseiten | 0/11 im Zielformat | Das Standard-Seitenraster sollte vollständig vorhanden sein (z.B. Startseite, Anwendungsfälle, Datensätze, Konformität, Kontext, Referenzen, Änderungen, Downloads, Datenschutz, Übersetzungshinweis). Fehlende Zielseiten werden ergänzt und in die Seiten-/Menükonfiguration aufgenommen. |
| QC-Regeln | 8 definiert | Die im Quellprojekt definierten Qualitätsregeln (qc/custom.rules.yaml) werden übernommen und in der CI-Pipeline regelmäßig ausgeführt, damit Validierung und Namenskonventionen automatisch geprüft werden. |
| Metadaten/Config | id mii-ig-medikation, v2026.0.1 | Die Kerndaten des IG (id, Version, Status, Publisher, Lizenz) werden in sushi-config.yaml und ig.ini ins Zielformat überführt, inklusive Seiten-, Menü- und Sprachkonfiguration; die gewünschte Zielversion wird gesetzt. |
| Arbeitsweise | — | Die Migration findet isoliert auf einem eigenen Arbeitszweig statt, getrennt vom Hauptstand. Änderungen werden über einen Pull Request eingebracht und vor dem Zusammenführen menschlich geprüft, statt direkt auf den Hauptzweig zu schreiben. |

</div>

## Direktiven-Mapping (Detail)

_Dieser Abschnitt ordnet jedem Direktiven-Typ sein Gegenstück im IG-Publisher-Format zu, sortiert nach Häufigkeit._

<div align="center">

| Direktive | Anzahl | Was es tut | Empfehlung (→ IG Publisher) |
|---|---|---|---|
| tabs | 112 | Gruppiert mehrere Inhalte (z.B. Darstellung, XML, JSON) in umschaltbare Reiter. | Die einzelnen Reiterinhalte durch die jeweils passenden generierten Anzeige-Fragmente (Struktur, XML, JSON) ersetzen; eine eigene Reiter-Mechanik ist meist nicht nötig. |
| fql-at | 58 | Markiert einen Abfrage-Codeblock in besonderer Schreibweise (mit @-Präfix). | Wie einen normalen Abfrageblock behandeln und durch ein generiertes Tabellen-Fragment oder eine statische Tabelle ersetzen. |
| json | 58 | Zeigt eine Ressource oder ein Beispiel in JSON-Darstellung an. | Durch das vom IG Publisher erzeugte JSON-Anzeige-Fragment ersetzen. |
| render | 22 | Bindet generierten Inhalt ein - ein Bild/Grafik oder eine vollständige FHIR-Ressource (z.B. CapabilityStatement). | Bild: nach input/images/ kopieren und als Markdown-/HTML-Bild einbinden. Ressource/Artefakt: meist entfernen (der IG Publisher erzeugt je Artefakt automatisch eine Seite) ODER das passende vorgefertigte Anzeige-Fragment einbinden. |
| link | 18 | Erzeugt einen Verweis auf ein einzelnes Artefakt (z.B. dessen Übersichtsseite). | Durch einen normalen Markdown-Link auf die generierte Artefaktseite ersetzen (Form Typ-id.html). |
| tree | 16 | Zeigt die Struktur eines Profils/einer Extension als aufklappbaren Strukturbaum an. | Durch das vom IG Publisher erzeugte Struktur-Fragment ersetzen (Snapshot- oder Differential-Ansicht bzw. Element-Wörterbuch). |
| xml | 14 | Zeigt eine Ressource oder ein Beispiel in XML-Darstellung an. | Durch das vom IG Publisher erzeugte XML-Anzeige-Fragment ersetzen. |
| page-title | 8 | Setzt an dieser Stelle den Titel der Seite, der aus den Seiteneinstellungen gezogen wird. | Entfällt ersatzlos - Seitentitel und Überschrift steuert man zentral über die Seiten- und Menükonfiguration. |
| pagelink | 8 | Erzeugt einen Verweis auf eine andere Seite oder ein Artefakt anhand eines Namens-Hinweises. | Durch einen normalen Markdown-Link auf die generierte Artefaktseite ersetzen (Form Typ-id.html); der Artefaktname wird in die kleingeschriebene id umgesetzt. |
| index-root | 2 | Erzeugt an dieser Stelle ein automatisches Inhaltsverzeichnis bzw. die Wurzel der Navigationsstruktur. | Entfällt - Navigation und Inhaltsverzeichnis erzeugt der IG Publisher selbst aus der konfigurierten Seitenstruktur. |

</div>

# Anhang: Detailaufschlüsselung

_Im Anhang steht jeder Einzelwert mit seiner Quelle, damit man die Kennzahlen nachvollziehen kann, ohne im Projekt suchen zu müssen._

## Identität & Herkunft

_Kerndaten des IG (Kennungen, Version, Status, Herausgeber) und woher sie stammen._

<div align="center">

| Feld | Wert | Quelle |
|---|---|---|
| id | mii-ig-medikation | sushi-config.yaml / package.json |
| canonical | https://www.medizininformatik-initiative.de/fhir/core/modul-medikation | sushi-config.yaml / package.json |
| packageId | de.medizininformatikinitiative.kerndatensatz.medikation | sushi-config.yaml / package.json |
| name | MII_IG_Medikation | sushi-config.yaml / package.json |
| title | MII IG Medikation | sushi-config.yaml / package.json |
| version | 2026.0.1 | sushi-config.yaml / package.json |
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
| hl7.fhir.uv.ips | 2.0.0 | gepinnt |
| de.medizininformatikinitiative.kerndatensatz.meta | 2026.0.x | floating ⚠ |
| de.basisprofil.r4 | 1.5.x | floating ⚠ |
| de.ihe-d.terminology | 3.0.1 | gepinnt |
| de.fhir.medication | 1.0.x | floating ⚠ |

</div>

## Artefakte (Quelle: input/fsh (FSH-Deklarationen))

_Jedes definierte Artefakt mit Typ, Name und Fundort in den Quelldateien._

<div align="center">

| Typ | Name | InstanceOf | Quelle |
|---|---|---|---|
| RuleSet | SupportResource |  | input/fsh/capabilitystatements/CapabilityStatement-2x.fsh:3 |
| RuleSet | Profile |  | input/fsh/capabilitystatements/CapabilityStatement-2x.fsh:9 |
| RuleSet | SupportProfile |  | input/fsh/capabilitystatements/CapabilityStatement-2x.fsh:14 |
| RuleSet | SupportInteraction |  | input/fsh/capabilitystatements/CapabilityStatement-2x.fsh:20 |
| RuleSet | SupportSearchParam |  | input/fsh/capabilitystatements/CapabilityStatement-2x.fsh:26 |
| RuleSet | SupportSpecialSearchParam |  | input/fsh/capabilitystatements/CapabilityStatement-2x.fsh:34 |
| Instance | mii-cps-medikation-capabilitystatement | CapabilityStatement | input/fsh/capabilitystatements/CapabilityStatement-2x.fsh:41 |
| CodeSystem | MII_CS_Medikation_Wirkstofftyp |  | input/fsh/codesystems/CodeSystem-Wirkstofftyp.fsh:1 |
| Extension | MII_EX_Medikation_Wirkstoffrelation |  | input/fsh/extensions/Extension-Wirkstoffrelation.fsh:1 |
| Extension | MII_EX_Medikation_Wirkstofftyp |  | input/fsh/extensions/Extension-Wirkstofftyp.fsh:1 |
| Instance | mii-exa-medikation-medication-rezeptur | mii-pr-medikation-medication | input/fsh/instances/Instances.fsh:1 |
| Instance | mii-exa-medikation-medication-glucoseloesung | mii-pr-medikation-medication | input/fsh/instances/Instances.fsh:16 |
| Instance | mii-exa-medikation-medication-calcium | mii-pr-medikation-medication | input/fsh/instances/Instances.fsh:39 |
| Instance | mii-exa-medikation-medication-caelyx | mii-pr-medikation-medication | input/fsh/instances/Instances.fsh:82 |
| Instance | mii-exa-medikation-medication-ass-100 | mii-pr-medikation-medication | input/fsh/instances/Instances.fsh:97 |
| Instance | mii-exa-medikation-medication-propofol | mii-pr-medikation-medication | input/fsh/instances/Instances.fsh:111 |
| Instance | mii-exa-medikation-medication-thiotepa | mii-pr-medikation-medication | input/fsh/instances/Instances.fsh:124 |
| Instance | mii-exa-medikation-medication-dolomo | mii-pr-medikation-medication | input/fsh/instances/Instances.fsh:135 |
| Instance | mii-exa-medikation-medication-dolomo-tag | mii-pr-medikation-medication | input/fsh/instances/Instances.fsh:156 |
| Instance | mii-exa-medikation-medication-dolomo-nacht | mii-pr-medikation-medication | input/fsh/instances/Instances.fsh:190 |
| Instance | mii-exa-medikation-medication-administration | mii-pr-medikation-medication-administration | input/fsh/instances/Instances.fsh:224 |
| Instance | mii-exa-medikation-medication-statement | mii-pr-medikation-medication-statement | input/fsh/instances/Instances.fsh:239 |
| Instance | mii-exa-medikation-medication-statement-periodisches-intervall | mii-pr-medikation-medication-statement | input/fsh/instances/Instances.fsh:255 |
| Instance | mii-exa-medikation-medication-statement-offset | mii-pr-medikation-medication-statement | input/fsh/instances/Instances.fsh:274 |
| Instance | mii-exa-medikation-medication-statement-caelyx | mii-pr-medikation-medication-statement | input/fsh/instances/Instances.fsh:291 |
| Instance | mii-exa-medikation-medication-statement-intravenous-use | mii-pr-medikation-medication-statement | input/fsh/instances/Instances.fsh:306 |
| Instance | mii-exa-medikation-procedure-thiotepa | Procedure | input/fsh/instances/Instances.fsh:321 |
| Instance | mii-exa-medikation-medication-request-caelyx | mii-pr-medikation-medication-request | input/fsh/instances/Instances.fsh:333 |
| Instance | mii-exa-medikation-medikationsliste-aufnahmemedikation | mii-pr-medikation-medikationsliste | input/fsh/instances/Instances.fsh:354 |
| Instance | mii-exa-medikation-medikationsliste-aktuelle-therapie | mii-pr-medikation-medikationsliste | input/fsh/instances/Instances.fsh:367 |
| Instance | mii-exa-medikation-medication-statement-concor | mii-pr-medikation-medication-statement | input/fsh/instances/Instances.fsh:380 |
| Instance | mii-exa-medikation-medication-statement-hct | mii-pr-medikation-medication-statement | input/fsh/instances/Instances.fsh:415 |
| Instance | mii-exa-medikation-medication-statement-ibuprofen | mii-pr-medikation-medication-statement | input/fsh/instances/Instances.fsh:433 |
| Instance | mii-exa-medikation-medication-statement-zopiclon | mii-pr-medikation-medication-statement | input/fsh/instances/Instances.fsh:451 |
| Instance | mii-exa-medikation-list-admission | mii-pr-medikation-medikationsliste | input/fsh/instances/Instances.fsh:486 |
| Invariant | dsg-1 |  | input/fsh/invariants/invariants.fsh:1 |
| Logical | MII_LM_Medikation |  | input/fsh/logicals/LogicalModelMedikation.fsh:1 |
| Mapping | Medikation-LogicalModel |  | input/fsh/logicals/LogicalModelMedikation.fsh:212 |
| Mapping | Medikation-LogicalModel-Profile |  | input/fsh/logicals/LogicalModelMedikation.fsh:315 |
| Profile | MII_PR_Medikation_Medikationsliste |  | input/fsh/profiles/Profile-List.fsh:2 |
| ValueSet | MII_VS_Medikation_Fallkontext |  | input/fsh/profiles/Profile-List.fsh:97 |
| Invariant | medication-list-context-1 |  | input/fsh/profiles/Profile-List.fsh:114 |
| Invariant | medication-list-context-2 |  | input/fsh/profiles/Profile-List.fsh:119 |
| Profile | MII_PR_Medikation_Medication |  | input/fsh/profiles/Profile-Medication.fsh:1 |
| Profile | MII_PR_Medikation_MedicationAdministration |  | input/fsh/profiles/Profile-MedicationAdministration.fsh:1 |
| Profile | MII_PR_Medikation_MedicationRequest |  | input/fsh/profiles/Profile-MedicationRequest.fsh:1 |
| Profile | MII_PR_Medikation_MedicationStatement |  | input/fsh/profiles/Profile-MedicationStatement.fsh:1 |
| RuleSet | SNOMED_Copyright |  | input/fsh/rulesets/copyright.fsh:1 |
| RuleSet | LOINC_Copyright |  | input/fsh/rulesets/copyright.fsh:4 |
| RuleSet | ATC_Copyright |  | input/fsh/rulesets/copyright.fsh:7 |
| RuleSet | EDQM_Copyright |  | input/fsh/rulesets/copyright.fsh:10 |
| RuleSet | IHE_Copyright |  | input/fsh/rulesets/copyright.fsh:13 |
| RuleSet | ExtensionContext |  | input/fsh/rulesets/extension-context.fsh:1 |
| RuleSet | LicenseCodeableCCBY40 |  | input/fsh/rulesets/license-terms.fsh:3 |
| RuleSet | LicenseCodeableCCBY40Instance |  | input/fsh/rulesets/license-terms.fsh:7 |
| RuleSet | MetaProfile |  | input/fsh/rulesets/meta-profile.fsh:1 |
| RuleSet | PQTranslation |  | input/fsh/rulesets/pq-translation.fsh:1 |
| RuleSet | Publisher |  | input/fsh/rulesets/publisher.fsh:1 |
| RuleSet | SP_Publisher |  | input/fsh/rulesets/publisher.fsh:6 |
| RuleSet | TestDataLabel |  | input/fsh/rulesets/test-data-label.fsh:3 |
| RuleSet | Translation |  | input/fsh/rulesets/translation.fsh:1 |
| RuleSet | AddSnomedCodingTranslation |  | input/fsh/rulesets/translation.fsh:8 |
| RuleSet | AddPznCodingTranslation |  | input/fsh/rulesets/translation.fsh:16 |
| RuleSet | AddAtcDeCodingTranslation |  | input/fsh/rulesets/translation.fsh:24 |
| RuleSet | AddAtcWhoCodingTranslation |  | input/fsh/rulesets/translation.fsh:32 |
| RuleSet | AddUniiCodingTranslation |  | input/fsh/rulesets/translation.fsh:40 |
| RuleSet | AddEdqmCodingTranslation |  | input/fsh/rulesets/translation.fsh:48 |
| RuleSet | Version |  | input/fsh/rulesets/version.fsh:1 |
| RuleSet | PR_CS_VS_Version |  | input/fsh/rulesets/version.fsh:4 |
| ValueSet | MII_VS_Medikation_Wirkstofftyp |  | input/fsh/valuesets/ValueSet-Wirkstofftyp.fsh:1 |
| ValueSet | MII_VS_Medikation_ASK |  | input/fsh/valuesets/mii-vs-medikation-ask.fsh:1 |
| ValueSet | MII_VS_Medikation_ATC |  | input/fsh/valuesets/mii-vs-medikation-atc.fsh:1 |
| ValueSet | MII_VS_Medikation_UNII |  | input/fsh/valuesets/mii-vs-medikation-unii.fsh:1 |

</div>

## Narrative-Seiten (36 Inhalt / 40 gesamt)

_Die Erklärseiten des IG mit Umfang und der Angabe, ob es sich um Inhalts- oder reine Platzhalterseiten handelt._

<div align="center">

| Datei | Wörter | Format | Stub? |
|---|---|---|---|
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/BeschreibungModul.page.md | 1127 | source |  |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/BeschreibungModul.page.md | 1105 | source |  |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md | 1054 | source |  |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md | 918 | source |  |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/Terminologien.page.md | 781 | source |  |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/Terminologien.page.md | 776 | source |  |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md | 660 | source |  |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md | 548 | source |  |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md | 541 | source |  |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md | 540 | source |  |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md | 526 | source |  |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md | 524 | source |  |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md | 482 | source |  |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/Release-Notes.page.md | 444 | source |  |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/KontextimGesamtprojektBezgezuanderenModulen.page.md | 396 | source |  |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/KontextimGesamtprojektBezgezuanderenModulen.page.md | 396 | source |  |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md | 371 | source |  |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/Index.page.md | 363 | source |  |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/Index.page.md | 357 | source |  |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Index.page.md | 222 | source |  |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstofftyp.page.md | 202 | source |  |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstofftyp.page.md | 201 | source |  |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstoffrelation.page.md | 173 | source |  |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstoffrelation.page.md | 171 | source |  |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/Release-Notes.page.md | 166 | source |  |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/AnwendungsflleInformationsmodell/Datenstzeinkl.Beschreibungen.page.md | 128 | source |  |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/AnwendungsflleInformationsmodell/Datenstzeinkl.Beschreibungen.page.md | 128 | source |  |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/Referenzen.page.md | 123 | source |  |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/Referenzen.page.md | 123 | source |  |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/AnwendungsflleInformationsmodell/BeschreibungvonSzenarienfrdieAnwendungderModule.page.md | 122 | source |  |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/AnwendungsflleInformationsmodell/BeschreibungvonSzenarienfrdieAnwendungderModule.page.md | 122 | source |  |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Index.page.md | 120 | source |  |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/AnwendungsflleInformationsmodell/UML.page.md | 88 | source |  |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/AnwendungsflleInformationsmodell/UML.page.md | 88 | source |  |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/CapabilityStatement.page.md | 86 | source |  |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/CapabilityStatement.page.md | 85 | source |  |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/AnwendungsflleInformationsmodell/Index.page.md | 13 | source | ja |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/AnwendungsflleInformationsmodell/Index.page.md | 13 | source | ja |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/Index.page.md | 12 | source | ja |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/Index.page.md | 12 | source | ja |

</div>

> Format = **source**: Pflichtseiten existieren im Quell-Guide und werden bei der Migration ins Zielformat überführt; „fehlende Zielseiten" wird hier daher nicht als Lücke gewertet.

## Direktiven-Fundstellen

_Jede gefundene Direktive mit genauer Fundstelle und Originaltext zur weiteren Bearbeitung._

<div align="center">

| Fundstelle | Direktive | Text (gekürzt) |
|---|---|---|
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/AnwendungsflleInformationsmodell/Datenstzeinkl.Beschreibungen.page.md:10 | tree | {{tree:https://www.medizininformatik-initiative.de/fhir/core/modul-medikation/St |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/AnwendungsflleInformationsmodell/Datenstzeinkl.Beschreibungen.page.md:14 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/AnwendungsflleInformationsmodell/UML.page.md:6 | render | {{render:implementation-guides/ImplementationGuide-Common/images/UML-2.x.png}} |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/BeschreibungModul.page.md:6 | render | {{render:implementation-guides/ImplementationGuide-Common/images/7_Abbilding_Med |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/BeschreibungModul.page.md:19 | render | {{render:implementation-guides/ImplementationGuide-Common/images/IG_Medikation_K |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/BeschreibungModul.page.md:44 | render | {{render:implementation-guides/ImplementationGuide-Common/images/IG_Medikation_K |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/BeschreibungModul.page.md:72 | render | {{render:implementation-guides/ImplementationGuide-Common/images/IG_Medikation_K |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/BeschreibungModul.page.md:81 | render | {{render:implementation-guides/ImplementationGuide-Common/images/IG_Medikation_K |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/BeschreibungModul.page.md:105 | render | {{render:implementation-guides/ImplementationGuide-Common/images/IG_Medikation_K |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/BeschreibungModul.page.md:121 | render | {{render:implementation-guides/ImplementationGuide-Common/images/IG_Medikation_K |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/BeschreibungModul.page.md:131 | render | {{render:implementation-guides/ImplementationGuide-Common/images/IG_Medikation_K |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/Index.page.md:18 | index-root | {{index:root}} |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/Release-Notes.page.md:1 | page-title | ## {{page-title}} |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/Release-Notes.page.md:8 | pagelink | - Neu im Vergleich zu Version 1.0 sind die Profile {{pagelink: MedikationMedicat |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/Release-Notes.page.md:9 | pagelink | - Im Profil {{pagelink: MedikationList, text: List, hint: MII_PR_Medikation_Medi |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/Release-Notes.page.md:11 | pagelink | - Im Profil {{pagelink: MedikationMedication, text: Medication, hint: MII_PR_Med |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/CapabilityStatement.page.md:4 | page-title | ## {{page-title}} |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/CapabilityStatement.page.md:15 | render | {{render:https://www.medizininformatik-initiative.de/fhir/core/modul-medikation/ |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Index.page.md:12 | render | \| {{render:implementation-guides/ImplementationGuide-Common/images/Warning.jpg}} |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:7 | page-title | ## {{page-title}} |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:13 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:23 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:35 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:46 | tabs | <tabs> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:47 | tree | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:47 | tabs | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:48 | tabs | <tab title="Beschreibung"> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:49 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:59 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:70 | tabs | </tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:71 | xml | <tab title="XML">{{xml}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:71 | tabs | <tab title="XML">{{xml}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:72 | json | <tab title="JSON">{{json}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:72 | tabs | <tab title="JSON">{{json}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:73 | link | <tab title="Link">{{link}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:73 | tabs | <tab title="Link">{{link}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:74 | tabs | </tabs> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:78 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:156 | json | {{json:mii-exa-medikation-list-admission}} |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:162 | json | {{json:mii-exa-medikation-medication-statement-concor}} |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:166 | json | {{json:mii-exa-medikation-medication-statement-hct}} |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:170 | json | {{json:mii-exa-medikation-medication-statement-ibuprofen}} |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:174 | json | {{json:mii-exa-medikation-medication-statement-zopiclon}} |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:183 | json | {{json:mii-exa-medikation-medikationsliste-aktuelle-therapie}} |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstoffrelation.page.md:12 | link | ## {{link}} |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstoffrelation.page.md:18 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstoffrelation.page.md:29 | tabs | <tabs> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstoffrelation.page.md:30 | tree | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstoffrelation.page.md:30 | tabs | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstoffrelation.page.md:31 | tabs | <tab title="Beschreibung"> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstoffrelation.page.md:32 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstoffrelation.page.md:42 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstoffrelation.page.md:53 | tabs | </tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstoffrelation.page.md:54 | xml | <tab title="XML">{{xml}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstoffrelation.page.md:54 | tabs | <tab title="XML">{{xml}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstoffrelation.page.md:55 | json | <tab title="JSON">{{json}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstoffrelation.page.md:55 | tabs | <tab title="JSON">{{json}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstoffrelation.page.md:56 | link | <tab title="Link">{{link}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstoffrelation.page.md:56 | tabs | <tab title="Link">{{link}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstoffrelation.page.md:57 | tabs | </tabs> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstoffrelation.page.md:66 | json | {{json:mii-exa-medikation-medication-calcium}} |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstofftyp.page.md:12 | link | ## {{link}} |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstofftyp.page.md:21 | pagelink | Siehe auch {{pagelink:MedikationTerminologien, text:**Terminologien**, hint:Term |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstofftyp.page.md:25 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstofftyp.page.md:36 | tabs | <tabs> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstofftyp.page.md:37 | tree | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstofftyp.page.md:37 | tabs | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstofftyp.page.md:38 | tabs | <tab title="Beschreibung"> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstofftyp.page.md:39 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstofftyp.page.md:49 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstofftyp.page.md:60 | tabs | </tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstofftyp.page.md:61 | xml | <tab title="XML">{{xml}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstofftyp.page.md:61 | tabs | <tab title="XML">{{xml}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstofftyp.page.md:62 | json | <tab title="JSON">{{json}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstofftyp.page.md:62 | tabs | <tab title="JSON">{{json}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstofftyp.page.md:63 | link | <tab title="Link">{{link}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstofftyp.page.md:63 | tabs | <tab title="Link">{{link}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstofftyp.page.md:64 | tabs | </tabs> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstofftyp.page.md:73 | json | {{json:mii-exa-medikation-medication-calcium}} |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md:11 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md:22 | tabs | <tabs> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md:23 | tree | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md:23 | tabs | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md:24 | tabs | <tab title="Beschreibung"> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md:25 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md:35 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md:46 | tabs | </tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md:47 | xml | <tab title="XML">{{xml}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md:47 | tabs | <tab title="XML">{{xml}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md:48 | json | <tab title="JSON">{{json}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md:48 | tabs | <tab title="JSON">{{json}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md:49 | link | <tab title="Link">{{link}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md:49 | tabs | <tab title="Link">{{link}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md:50 | tabs | </tabs> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md:54 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md:147 | json | {{json:mii-exa-medikation-medication-ass-100}} |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md:154 | json | {{json:mii-exa-medikation-medication-rezeptur}} |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md:161 | json | {{json:mii-exa-medikation-medication-glucoseloesung}} |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md:168 | json | {{json:mii-exa-medikation-medication-dolomo}} |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md:172 | json | {{json:mii-exa-medikation-medication-dolomo-tag}} |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md:176 | json | {{json:mii-exa-medikation-medication-dolomo-nacht}} |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md:13 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md:24 | tabs | <tabs> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md:25 | tree | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md:25 | tabs | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md:26 | tabs | <tab title="Beschreibung"> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md:27 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md:37 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md:48 | tabs | </tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md:49 | xml | <tab title="XML">{{xml}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md:49 | tabs | <tab title="XML">{{xml}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md:50 | json | <tab title="JSON">{{json}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md:50 | tabs | <tab title="JSON">{{json}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md:51 | link | <tab title="Link">{{link}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md:51 | tabs | <tab title="Link">{{link}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md:52 | tabs | </tabs> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md:56 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md:206 | json | {{json:mii-exa-medikation-medication-administration}} |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md:7 | page-title | ## {{page-title}} |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md:13 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md:24 | tabs | <tabs> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md:25 | tree | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md:25 | tabs | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md:26 | tabs | <tab title="Beschreibung"> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md:27 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md:37 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md:48 | tabs | </tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md:49 | xml | <tab title="XML">{{xml}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md:49 | tabs | <tab title="XML">{{xml}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md:50 | json | <tab title="JSON">{{json}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md:50 | tabs | <tab title="JSON">{{json}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md:51 | link | <tab title="Link">{{link}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md:51 | tabs | <tab title="Link">{{link}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md:52 | tabs | </tabs> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md:56 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md:150 | json | {{json:mii-exa-medikation-medication-request-caelyx}} |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md:15 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md:26 | tabs | <tabs> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md:27 | tree | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md:27 | tabs | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md:28 | tabs | <tab title="Beschreibung"> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md:29 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md:39 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md:50 | tabs | </tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md:51 | xml | <tab title="XML">{{xml}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md:51 | tabs | <tab title="XML">{{xml}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md:52 | json | <tab title="JSON">{{json}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md:52 | tabs | <tab title="JSON">{{json}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md:53 | link | <tab title="Link">{{link}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md:53 | tabs | <tab title="Link">{{link}}</tab> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md:54 | tabs | </tabs> |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md:58 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md:264 | json | {{json:mii-exa-medikation-medication-statement-caelyx}} |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md:272 | json | {{json:mii-exa-medikation-medication-statement-offset}} |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md:280 | json | {{json:mii-exa-medikation-medication-statement-periodisches-intervall}} |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md:288 | json | {{json:mii-exa-medikation-medication-statement-intravenous-use}} |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md:292 | json | {{json:mii-exa-medikation-medication-thiotepa}} |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md:296 | json | {{json:mii-exa-medikation-procedure-thiotepa}} |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/Terminologien.page.md:9 | render | \| {{render:implementation-guides/ImplementationGuide-Common/images/Warning.jpg}} |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/Terminologien.page.md:29 | render | {{render:mii-cs-medikation-wirkstofftyp}} |
| implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/Terminologien.page.md:69 | render | {{render:https://www.medizininformatik-initiative.de/fhir/core/modul-medikation/ |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/AnwendungsflleInformationsmodell/Datenstzeinkl.Beschreibungen.page.md:10 | tree | {{tree:https://www.medizininformatik-initiative.de/fhir/core/modul-medikation/St |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/AnwendungsflleInformationsmodell/Datenstzeinkl.Beschreibungen.page.md:14 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/AnwendungsflleInformationsmodell/UML.page.md:6 | render | {{render:implementation-guides/ImplementationGuide-Common/images/UML-2.x.png}} |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/BeschreibungModul.page.md:6 | render | {{render:implementation-guides/ImplementationGuide-Common/images/7_Abbilding_Med |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/BeschreibungModul.page.md:65 | render | {{render:implementation-guides/ImplementationGuide-Common/images/IG_Medikation_K |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/Index.page.md:18 | index-root | {{index:root}} |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/Release-Notes.page.md:1 | page-title | ## {{page-title}} |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/Release-Notes.page.md:47 | pagelink | - Neu im Vergleich zu Version 1.0 sind die Profile {{pagelink: MedikationMedicat |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/Release-Notes.page.md:48 | pagelink | - Im Profil {{pagelink: MedikationList, text: List, hint: MII_PR_Medikation_Medi |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/Release-Notes.page.md:50 | pagelink | - Im Profil {{pagelink: MedikationMedication, text: Medication, hint: MII_PR_Med |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/CapabilityStatement.page.md:4 | page-title | ## {{page-title}} |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/CapabilityStatement.page.md:15 | render | {{render:https://www.medizininformatik-initiative.de/fhir/core/modul-medikation/ |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Index.page.md:28 | render | \| {{render:implementation-guides/ImplementationGuide-Common/images/Warning.jpg}} |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:7 | page-title | ## {{page-title}} |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:13 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:23 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:35 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:46 | tabs | <tabs> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:47 | tree | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:47 | tabs | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:48 | tabs | <tab title="Beschreibung"> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:49 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:59 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:70 | tabs | </tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:71 | xml | <tab title="XML">{{xml}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:71 | tabs | <tab title="XML">{{xml}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:72 | json | <tab title="JSON">{{json}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:72 | tabs | <tab title="JSON">{{json}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:73 | link | <tab title="Link">{{link}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:73 | tabs | <tab title="Link">{{link}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:74 | tabs | </tabs> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:78 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:156 | json | {{json:mii-exa-medikation-list-admission}} |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:162 | json | {{json:mii-exa-medikation-medication-statement-concor}} |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:166 | json | {{json:mii-exa-medikation-medication-statement-hct}} |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:170 | json | {{json:mii-exa-medikation-medication-statement-ibuprofen}} |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:174 | json | {{json:mii-exa-medikation-medication-statement-zopiclon}} |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md:183 | json | {{json:mii-exa-medikation-medikationsliste-aktuelle-therapie}} |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstoffrelation.page.md:12 | link | ## {{link}} |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstoffrelation.page.md:18 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstoffrelation.page.md:29 | tabs | <tabs> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstoffrelation.page.md:30 | tree | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstoffrelation.page.md:30 | tabs | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstoffrelation.page.md:31 | tabs | <tab title="Beschreibung"> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstoffrelation.page.md:32 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstoffrelation.page.md:42 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstoffrelation.page.md:53 | tabs | </tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstoffrelation.page.md:54 | xml | <tab title="XML">{{xml}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstoffrelation.page.md:54 | tabs | <tab title="XML">{{xml}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstoffrelation.page.md:55 | json | <tab title="JSON">{{json}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstoffrelation.page.md:55 | tabs | <tab title="JSON">{{json}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstoffrelation.page.md:56 | link | <tab title="Link">{{link}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstoffrelation.page.md:56 | tabs | <tab title="Link">{{link}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstoffrelation.page.md:57 | tabs | </tabs> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstoffrelation.page.md:66 | json | {{json:mii-exa-medikation-medication-calcium}} |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstofftyp.page.md:12 | link | ## {{link}} |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstofftyp.page.md:21 | pagelink | Siehe auch {{pagelink:MedikationTerminologien, text:**Terminologien**, hint:Term |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstofftyp.page.md:25 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstofftyp.page.md:36 | tabs | <tabs> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstofftyp.page.md:37 | tree | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstofftyp.page.md:37 | tabs | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstofftyp.page.md:38 | tabs | <tab title="Beschreibung"> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstofftyp.page.md:39 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstofftyp.page.md:49 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstofftyp.page.md:60 | tabs | </tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstofftyp.page.md:61 | xml | <tab title="XML">{{xml}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstofftyp.page.md:61 | tabs | <tab title="XML">{{xml}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstofftyp.page.md:62 | json | <tab title="JSON">{{json}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstofftyp.page.md:62 | tabs | <tab title="JSON">{{json}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstofftyp.page.md:63 | link | <tab title="Link">{{link}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstofftyp.page.md:63 | tabs | <tab title="Link">{{link}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstofftyp.page.md:64 | tabs | </tabs> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Extension-Wirkstofftyp.page.md:73 | json | {{json:mii-exa-medikation-medication-calcium}} |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md:11 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md:22 | tabs | <tabs> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md:23 | tree | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md:23 | tabs | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md:24 | tabs | <tab title="Beschreibung"> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md:25 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md:35 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md:46 | tabs | </tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md:47 | xml | <tab title="XML">{{xml}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md:47 | tabs | <tab title="XML">{{xml}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md:48 | json | <tab title="JSON">{{json}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md:48 | tabs | <tab title="JSON">{{json}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md:49 | link | <tab title="Link">{{link}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md:49 | tabs | <tab title="Link">{{link}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md:50 | tabs | </tabs> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md:54 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md:147 | json | {{json:mii-exa-medikation-medication-ass-100}} |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md:154 | json | {{json:mii-exa-medikation-medication-rezeptur}} |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md:161 | json | {{json:mii-exa-medikation-medication-glucoseloesung}} |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md:168 | json | {{json:mii-exa-medikation-medication-dolomo}} |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md:172 | json | {{json:mii-exa-medikation-medication-dolomo-tag}} |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md:176 | json | {{json:mii-exa-medikation-medication-dolomo-nacht}} |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md:20 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md:31 | tabs | <tabs> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md:32 | tree | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md:32 | tabs | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md:33 | tabs | <tab title="Beschreibung"> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md:34 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md:44 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md:55 | tabs | </tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md:56 | xml | <tab title="XML">{{xml}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md:56 | tabs | <tab title="XML">{{xml}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md:57 | json | <tab title="JSON">{{json}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md:57 | tabs | <tab title="JSON">{{json}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md:58 | link | <tab title="Link">{{link}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md:58 | tabs | <tab title="Link">{{link}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md:59 | tabs | </tabs> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md:63 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md:221 | json | {{json:mii-exa-medikation-medication-administration}} |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md:7 | page-title | ## {{page-title}} |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md:22 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md:33 | tabs | <tabs> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md:34 | tree | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md:34 | tabs | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md:35 | tabs | <tab title="Beschreibung"> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md:36 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md:46 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md:57 | tabs | </tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md:58 | xml | <tab title="XML">{{xml}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md:58 | tabs | <tab title="XML">{{xml}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md:59 | json | <tab title="JSON">{{json}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md:59 | tabs | <tab title="JSON">{{json}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md:60 | link | <tab title="Link">{{link}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md:60 | tabs | <tab title="Link">{{link}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md:61 | tabs | </tabs> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md:65 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md:159 | json | {{json:mii-exa-medikation-medication-request-caelyx}} |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md:24 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md:35 | tabs | <tabs> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md:36 | tree | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md:36 | tabs | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md:37 | tabs | <tab title="Beschreibung"> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md:38 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md:48 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md:59 | tabs | </tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md:60 | xml | <tab title="XML">{{xml}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md:60 | tabs | <tab title="XML">{{xml}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md:61 | json | <tab title="JSON">{{json}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md:61 | tabs | <tab title="JSON">{{json}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md:62 | link | <tab title="Link">{{link}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md:62 | tabs | <tab title="Link">{{link}}</tab> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md:63 | tabs | </tabs> |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md:67 | fql-at | @``` |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md:281 | json | {{json:mii-exa-medikation-medication-statement-caelyx}} |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md:289 | json | {{json:mii-exa-medikation-medication-statement-offset}} |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md:297 | json | {{json:mii-exa-medikation-medication-statement-periodisches-intervall}} |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md:305 | json | {{json:mii-exa-medikation-medication-statement-intravenous-use}} |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md:309 | json | {{json:mii-exa-medikation-medication-thiotepa}} |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md:313 | json | {{json:mii-exa-medikation-procedure-thiotepa}} |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/Terminologien.page.md:9 | render | \| {{render:implementation-guides/ImplementationGuide-Common/images/Warning.jpg}} |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/Terminologien.page.md:29 | render | {{render:mii-cs-medikation-wirkstofftyp}} |
| implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/Terminologien.page.md:69 | render | {{render:https://www.medizininformatik-initiative.de/fhir/core/modul-medikation/ |

</div>

## QC-Regeln (definiert; Quelle: qc/custom.rules.yaml)

_Die im Projekt hinterlegten Qualitätsregeln; ihre Einhaltung wird erst beim Qualitätslauf des Builds geprüft._

<div align="center">

| Name | Aktion | Prüfzweck (status) |
|---|---|---|
| include-recommended |  |  |
| conformance-version-filled |  | Checking if all resources have version filled |
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
| anwendungshinweise: weitere informationen zur suche nach "code" finden sich in der [fhir b | ⚠ mii-ig-medikation-de-v2024 / mii-ig-medikation-v2025 | implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md · implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md · implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md · implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md · implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md · implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md · implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md |
| anwendungshinweise: weitere informationen zur suche nach " id" finden sich in der [fhir ba | ⚠ mii-ig-medikation-de-v2024 / mii-ig-medikation-v2025 | implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md · implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md · implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md · implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md · implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md |
| anwendungshinweise: weitere informationen zur suche nach " profile" finden sich in der [fh | ⚠ mii-ig-medikation-de-v2024 / mii-ig-medikation-v2025 | implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md · implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md · implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md · implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md · implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/Medication/Index.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md |
| anwendungshinweise: weitere informationen zur suche nach "status" finden sich in der [fhir | ⚠ mii-ig-medikation-de-v2024 / mii-ig-medikation-v2025 | implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md · implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md · implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md · implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md |
| anwendungshinweise: weitere informationen zur suche nach "subject" finden sich in der [fhi | ⚠ mii-ig-medikation-de-v2024 / mii-ig-medikation-v2025 | implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md · implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md · implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md · implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md |
| anwendungshinweise: weitere informationen zur suche nach "category" finden sich in der [fh | ⚠ mii-ig-medikation-de-v2024 / mii-ig-medikation-v2025 | implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md · implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md · implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/List.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md |
| anwendungshinweise: weitere informationen zur suche nach "medication" finden sich in der [ | ⚠ mii-ig-medikation-de-v2024 / mii-ig-medikation-v2025 | implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md · implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md · implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md |
| anwendungshinweise: weitere informationen zur suche nach "context" finden sich in der [fhi | ⚠ mii-ig-medikation-de-v2024 / mii-ig-medikation-v2025 | implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md · implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md · implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md |
| anwendungshinweise: weitere informationen zur suche nach "reason reference" finden sich in | ⚠ mii-ig-medikation-de-v2024 / mii-ig-medikation-v2025 | implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md · implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md |
| anwendungshinweise: weitere informationen zur suche nach "dosage site" finden sich in der  | ⚠ mii-ig-medikation-de-v2024 / mii-ig-medikation-v2025 | implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md · implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md |
| anwendungshinweise: weitere informationen zur suche nach "dosage route" finden sich in der | ⚠ mii-ig-medikation-de-v2024 / mii-ig-medikation-v2025 | implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md · implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md |
| anwendungshinweise: weitere informationen zur suche nach "rateratio numerator" finden sich | ⚠ mii-ig-medikation-de-v2024 / mii-ig-medikation-v2025 | implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md · implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md |
| anwendungshinweise: weitere informationen zur suche nach "rateratio denominator" finden si | ⚠ mii-ig-medikation-de-v2024 / mii-ig-medikation-v2025 | implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md · implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md |
| anwendungshinweise: weitere informationen zur suche nach "rateratio" finden sich in der [f | ⚠ mii-ig-medikation-de-v2024 / mii-ig-medikation-v2025 | implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md · implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md |
| das verabreichte medikament soll entweder über eine referenz auf ein medication objekt, üb | mii-ig-medikation-v2025 | implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationAdministration.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationRequest.page.md · implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/FHIR-Profile/MedicationStatement.page.md |

</div>

> ⚠ 126 Inhaltsblock/-blöcke kommen **ordnerübergreifend** (in mehreren IG-Ordnern) vor — Kandidat für Konsolidierung bzw. ausgelagerte Übersetzung.

**Identische Seiten:** `implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/AnwendungsflleInformationsmodell/BeschreibungvonSzenarienfrdieAnwendungderModule.page.md` = `implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/AnwendungsflleInformationsmodell/BeschreibungvonSzenarienfrdieAnwendungderModule.page.md`; `implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/AnwendungsflleInformationsmodell/Datenstzeinkl.Beschreibungen.page.md` = `implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/AnwendungsflleInformationsmodell/Datenstzeinkl.Beschreibungen.page.md`; `implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/AnwendungsflleInformationsmodell/Index.page.md` = `implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/AnwendungsflleInformationsmodell/Index.page.md`; `implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/AnwendungsflleInformationsmodell/UML.page.md` = `implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/AnwendungsflleInformationsmodell/UML.page.md`; `implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/KontextimGesamtprojektBezgezuanderenModulen.page.md` = `implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/KontextimGesamtprojektBezgezuanderenModulen.page.md`; `implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/Referenzen.page.md` = `implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/Referenzen.page.md`; `implementation-guides/mii-ig-medikation-de-v2024/MIIIGModulMedikation/TechnischeImplementierung/Index.page.md` = `implementation-guides/mii-ig-medikation-v2025/MIIIGModulMedikation/TechnischeImplementierung/Index.page.md`

**Nicht referenzierte Bilder (18):** `implementation-guides/ImplementationGuide-Common/images/8_Abbilding_Medikation_en.jpg`, `implementation-guides/ImplementationGuide-Common/images/BMP.png`, `implementation-guides/ImplementationGuide-Common/images/IG_Medikation_KDS_Liste.png`, `implementation-guides/ImplementationGuide-Common/images/IG_Medikation_KDS_Medikation_2x.png`, `implementation-guides/ImplementationGuide-Common/images/IG_Medikation_KDS_Medikation_Modul_AD_2x.png`, `implementation-guides/ImplementationGuide-Common/images/IG_Medikation_KDS_Medikationseintrag.png`, `implementation-guides/ImplementationGuide-Common/images/IG_Medikation_KDS_Medikationseintrag_2x.png`, `implementation-guides/ImplementationGuide-Common/images/IG_Medikation_KDS_Medikationsverabreichung_2x.png`, `implementation-guides/ImplementationGuide-Common/images/IG_Medikation_KDS_Medikationsvergabe.png`, `implementation-guides/ImplementationGuide-Common/images/IG_Medikation_KDS_Medikationsverordnung_2x.png`, `implementation-guides/ImplementationGuide-Common/images/IG_Medikation_KDS_Modul_Uebersicht.png`, `implementation-guides/ImplementationGuide-Common/images/KDS_MED_01.png`, `implementation-guides/ImplementationGuide-Common/images/KDS_MED_02.png`, `implementation-guides/ImplementationGuide-Common/images/KDS_MED_03.png`, `implementation-guides/ImplementationGuide-Common/images/KDS_MED_04.JPG`, `implementation-guides/ImplementationGuide-Common/images/Medikation_v2.0.puml`, `implementation-guides/ImplementationGuide-Common/images/Mediktion_v2.0.pdf`, `implementation-guides/ImplementationGuide-Common/images/UML-1.x.png`

**Beispiele nicht in Narrativen eingebunden (2):** `mii-exa-medikation-medication-propofol`, `mii-exa-medikation-medikationsliste-aufnahmemedikation`

# Anhang: Methodik & Metrik-Erklärung

_Beschreibung jeder im Report verwendeten Kennzahl - was sie misst und wie sie ermittelt wird - zur Nachvollziehbarkeit. Maßstab für Aufwand ist ZEIT (Stunden/Personentage/Kalenderzeit), keine Geldgrößen._

<div align="center">

| Kennzahl | Was es misst | Herkunft / Berechnung |
|---|---|---|
| Artefakte (publiziert) | Anzahl der vom IG bereitgestellten FHIR-Konformitätsressourcen je Typ (Profile, Extensions, ValueSets, CodeSystems, Logical Models, CapabilityStatements, Beispiele). | Zählung der Deklarationen in input/fsh (bzw. generierten Ressourcen); interne FSH-Konstrukte (RuleSets/Invarianten/Mappings) separat, nicht im Total. |
| Plattform-/Simplifier-Direktiven | Vorkommen plattformspezifischer Platzhalter in den Erklärseiten, die ein generischer IG Publisher nicht versteht (Migrations-Aufwandstreiber). | Mustererkennung je Direktiven-Typ in den Narrative-Seiten; nicht abgedeckte -> UNBEKANNT. |
| Linguistik (Wörter/Seite) | Textumfang der Inhalts-Seiten als Durchschnitt, Median und Extremwerte - Indikator für Dokumentations- und Übersetzungsumfang. | Wortzählung je Inhalts-Seite (ohne Stubs). |
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
| Lizenz | Die Nutzungsbedingungen des IG; CC0-1.0 bedeutet Gemeinfreiheit, also freie Nutzung ohne Einschränkung. |
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
