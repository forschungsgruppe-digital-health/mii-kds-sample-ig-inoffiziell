# IG-Statistik — MII KDS Meta v2026.0.0

_Modus: `static` · Stand: 2026-06-26T21:58:49Z · Commit: `6935ebb`_

## Executive Summary: Migration des FHIR-Leitfadens "MII IG Meta"

> **Worum geht es?** Ein FHIR Implementation Guide (kurz „IG“) ist die technische Spezifikation eines Datenstandards im Gesundheitswesen – das Regelwerk plus die zugehörige Online-Dokumentation. Dieser IG soll von einer herstellergebundenen Plattform auf das herstellerneutrale Standard-Werkzeug der FHIR-Community (den „IG Publisher“) umgezogen werden. Inhaltlich ändert sich nichts – nur die technische Bauweise der Veröffentlichung. _Fachbegriffe sind im Glossar am Dokumentende erklärt._

### Das Wichtigste in einem Satz

Der Umzug ist **gut machbar und mittelgroß** (geschätzt **12–20 Personenstunden**, also rund **1,5–2,5 Personentage**), **ohne erkennbare Blocker** – die fachliche Substanz liegt bereits in maschinenlesbarer, sauberer Form vor. Mit KI-Unterstützung lässt sich der Aufwand voraussichtlich spürbar senken (modellierte ~11–17 h, ≈ 11 % weniger; Annahmen und Vorbehalte siehe „Aufwand“).

### Inhaltlicher Umfang (was migriert wird)

- **Identität:** `mii-ig-meta`, Version 2026.0.0, Herausgeber Medizininformatik Initiative, Lizenz CC-BY-4.0, Status „active“.
- **175 fachliche Bausteine:** 1 Profil (Kernregelwerk), 1 Erweiterung, 1 Codesystem, 5 Beispiele.
- **Dokumentation:** 11 inhaltliche Textseiten (~2218 Wörter, Ø 202 Wörter/Seite) und 0 Bilder.

### Aufwand und was das Band bedeutet

- **Aufwandsband: M (mittel)** – auf einer Skala S (klein, <1 Tag) / M (mittel, einige Tage) / L (groß, 1–2 Wochen) / XL (sehr groß) liegt dieses Vorhaben **im Mittelfeld**.
- **Manuell: rund 12–20 Stunden.** Das ist eine **Größenordnungsschätzung zur Budgetplanung** (Faustregel: Menge der Arbeitsschritte × Erfahrungswert) – **kein verbindliches Angebot**.
- **KI-gestützt teilautomatisiert: rund 11–17 Stunden** (≈ 11 % weniger). Das heißt: eine KI erledigt die wiederkehrenden Umbauten, Menschen prüfen und geben an Kontrollpunkten frei (Human-in-the-Loop / Review-Gates). Die Schätzung gilt **unabhängig davon, welches KI-Produkt eingesetzt wird** – sie ist eine _modellierte_ Annahme mit noch nicht kalibrierten Faktoren, **keine garantierte Einsparung**.
- **Größte Aufwandstreiber:** 48 plattformspezifische Platzhalter in den Textseiten (sog. „Direktiven“ – das neue Standard-Werkzeug kennt sie nicht, sie werden einzeln umgebaut; ~10 h) und 11 Inhaltsseiten (~6 h).
- **Reife & Strategie:** Reifegrad **70/100 (fortgeschritten)** · Hersteller-Lock-in mittel. (Details in den Abschnitten Reife & Freigabe und Strategie.)

### Wie sauber ist die Quelle?

- **Regeln liegen bereits in der bearbeitbaren Textform (FSH) vor – kein aufwändiger Rückbau nötig (Effizienzvorteil).**
- **0 externe Abhängigkeiten, davon 0 fest verankert, 0 beweglich.** Feste Versionen bedeuten reproduzierbare, stabile Builds – kein wackeliges Fundament.
- **Versionsnummer aus dem Kalenderjahr (CalVer)** – wird unverändert übernommen, kein Anpassungsbedarf.
- **14 Qualitätsregeln** bereits definiert und 1:1 übernehmbar.

### Risiken und Blocker

- **Keine harten Blocker.**
- **1 der 48 Platzhalter/„Direktiven“ sind „unbekannt“** – ohne automatisches Umsetzungsmuster, daher **von Hand** zu übertragen. Überwiegend eingebettete Ansichten; Mehraufwand begrenzt, aber einzuplanen.
- **Schätzungs-Vorbehalt:** beruht auf einer rein **statischen** Analyse der Quelldateien (ohne Test-Build); ein vollständiger Validierungslauf kann zusätzliche Detailkorrekturen aufdecken. Die Erfahrungswerte sind noch nicht final kalibriert – daher die bewusst breite Spanne.
- **Risikomindernd:** Der Umzug erfolgt isoliert auf einem separaten Arbeitszweig, ohne Eingriff in den produktiven Stand; ein menschliches Abschluss-Review ist vorgesehen.

### Bottom Line / Empfehlung

**Durchführen empfohlen.** Der Aufwand ist mittel und kalkulierbar (manuell ~1,5–2,5 Personentage, KI-gestützt voraussichtlich spürbar weniger), die Quelle ist reif. Konkret einzuplanen: die 1 von Hand zu übertragenden Platzhalter sowie ein abschließender Validierungslauf mit fachlichem Review.

## Kennzahlen-Überblick

### Artefakte (Σ 175 publiziert)

_Hier wird gezählt, wie viele FHIR-Bausteine (Profile, Extensions, ValueSets usw.) der IG je Typ definiert._

<div align="center">

```mermaid
%%{init: {'theme':'base','themeVariables':{"pie1": "#4E79A7", "pie2": "#F28E2B", "pie3": "#59A14F", "pie4": "#E15759", "pie5": "#76B7B2", "pieOpacity": "1", "pieSectionTextColor": "#1A1A1A", "pieTitleTextSize": "18px"}}}%%
pie showData title Artefakte
    "searchparameters" : 167
    "examples" : 5
    "profiles" : 1
    "extensions" : 1
    "codesystems" : 1
```

</div>

<div align="center">

| Typ | Anzahl |
|---|---|
| searchparameters | 167 |
| examples | 5 |
| profiles | 1 |
| extensions | 1 |
| codesystems | 1 |

</div>

_Interne FSH-Konstrukte (nicht in Σ): 21 rulesets, 1 invariants._

### Plattform-Direktiven — Σ 48 (unbekannt: 1)

_Dieser Abschnitt listet die plattformspezifischen Platzhalter in den Erklärseiten, die ein generischer IG Publisher nicht versteht und die daher umgesetzt werden müssen._

<div align="center">

```mermaid
%%{init: {'theme':'base','themeVariables':{"pie1": "#4E79A7", "pie2": "#F28E2B", "pie3": "#59A14F", "pie4": "#E15759", "pie5": "#76B7B2", "pie6": "#EDC948", "pie7": "#B07AA1", "pie8": "#FF9DA7", "pie9": "#9C755F", "pie10": "#BAB0AC", "pie11": "#86BCB6", "pieOpacity": "1", "pieSectionTextColor": "#1A1A1A", "pieTitleTextSize": "18px"}}}%%
pie showData title Direktiven
    "tabs" : 16
    "fql-at" : 8
    "page-title" : 7
    "pagelink" : 4
    "index-root" : 2
    "render" : 2
    "tree" : 2
    "xml" : 2
    "json" : 2
    "link" : 2
    "fql-tag" : 1
```

</div>

<div align="center">

| Direktive | Anzahl |
|---|---|
| tabs | 16 |
| fql-at | 8 |
| page-title | 7 |
| pagelink | 4 |
| index-root | 2 |
| render | 2 |
| tree | 2 |
| xml | 2 |
| json | 2 |
| link | 2 |
| fql-tag | 1 |

</div>

## Inhaltsumfang & Repo-Hygiene

_Linguistische Kennzahlen zum Textumfang (Wörter je Seite, Durchschnitt) sowie Hinweise auf inhaltliche Dopplungen und nicht referenzierte Dateien (Dead-Code-Analogie) - hilft, Umfang und Aufräumpotenzial einzuschätzen._

<div align="center">

| Kennzahl | Wert |
|---|---|
| Enthaltene IG-Ordner | 2 |
| Inhalts-Seiten | 11 |
| Wörter gesamt | 2218 |
| Ø Wörter / Seite | 201,6 |
| Median Wörter / Seite | 125 |
| kürzeste / längste Seite | 28 / 613 Wörter |
| doppelte Inhaltsblöcke | 3 (davon 3 ordnerübergreifend) |
| identische Seiten (Gruppen) | 0 |
| Bilder nicht referenziert | 0 von 0 |
| Beispiele nicht in Narrativen | 5 von 5 |

</div>

**Enthaltene IG-Ordner (2) — Aufschlüsselung je IG (Spalten: aktuell → ältest):**

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

> ⚠ Das Repo enthält **2 IG-Ordner** (Versions-/Sprachvarianten). Aggregat-Kennzahlen (Direktiven, Wörter, **Aufwand**) summieren über **alle** Ordner — für die Migration **einer** Version entsprechend nach unten zu korrigieren; die 3 ordnerübergreifenden Dopplungen zeigen das Ausmaß.

_Heuristik: 'nicht referenziert' = Dateiname/Artefaktname kommt in keiner Erklärseite vor. Kein Beweis für Ungenutztheit (Referenz kann über Konfiguration/Build erfolgen)._

## Aufwand: manuell vs. KI-gestützt

_Dieser Abschnitt schätzt den Arbeitsaufwand der Überführung als Spanne - manuell und KI-gestützt teilautomatisiert - abgeleitet aus zählbaren Treibern und Stundenfaktoren._

<div align="center">

| Treiber | Menge | manuell [h] | KI-gestützt [h] |
|---|---|---|---|
| Direktiven (bekannt) | 47 | 9,4 | 3,8 |
| Inhalts-Seiten | 11 | 5,5 | 2,2 |
| Direktiven (unbekannt → manuell) | 1 | 0,2 | 0,2 |
| GoFSH-Vorlauf (Regel-Rückgewinnung) | nein | 0 | 0 |
| Floating Pins (Versionen fixieren) | 0 | 0 | 0 |
| Einarbeitung/Setup (einmalig) | — | 0 | 3 |
| Review-Gates (Pauschale) | — | 0 | 3 |
| Validierungs-/Iterationsaufschlag (20 %) | — | 0 | 1,2 |

</div>

**Manuell:** Band M · **12,1–19,6 h**  |  **KI-gestützt (HITL, Review-Gates, anbieter-/modellunabhängig):** Band M · **10,7–17,4 h** · **≈ 11 % weniger**

_Annahmen:_ • Nur statisch berechenbare Treiber; id/url-Mismatch, QC-Verletzungen und quell-intrinsische Validierungsfehler erfordern einen Build und sind hier nicht enthalten. • Faktoren sind Erfahrungswerte, noch nicht final kalibriert; Spanne = Basis × 0,8…1,3. • pages = Inhalts-Seiten (Stubs/Navigation < 20 Wörter ausgeschlossen). • Personentage = Aufwand in 8-h-Arbeitstagen (1 PT = 8 Personenstunden); beide Schätzungen messen MENSCHLICHE Arbeitszeit — manuell die Migration von Hand, KI-gestützt die Bedien-/Review-Zeit der KI (Prompts, Review-Gates, Korrekturen), NICHT die Rechen-/Laufzeit oder Wartezeit der KI. • KI-Schätzung: anbieter-/modellunabhängig (Human-in-the-Loop, Review-Gates). Enthält feste Pauschalen für Einarbeitung/Setup (3 h) und Review-Gates (3 h) sowie einen Validierungs-/Iterationsaufschlag (20 %); unbekannte Direktiven werden wie manuell gerechnet. Bewusst konservativ – keine garantierte Einsparung.

## Reife & Freigabe

_Verdichteter Reifegrad als Freigabe-Indikator: Status, Vollständigkeit der Dokumentation, Beispiel-Abdeckung der Profile und Governance-Reife._

<div align="center">

| Komponente | Wert |
|---|---|
| **Reifegrad-Score** | **70/100 (fortgeschritten)** |
| Status | active |
| Doku-Vollständigkeit (Inhalt vs. Stubs) | 46 % |
| Beispiel-Abdeckung Profile | 100 % (1/1) |
| Governance (CI · ig.ini · publication · devcontainer) | 50/100 |

</div>

## Strategie: Wiederverwendung, Lock-in & Zukunftssicherheit

_Strategische Kennzahlen: Bindung an die Quellplattform (Lock-in), Anteil standardisierter Terminologie, Wiederverwendung externer Bausteine und Zukunftssicherheit (FHIR-Version, Pflege-Aktivität)._

<div align="center">

| Kennzahl | Wert |
|---|---|
| Hersteller-Lock-in | 52/100 (mittel) · 4,4 Direktiven/Seite |
| Standard-Terminologie-Anteil | 98 % (ICD-10) |
| Wiederverwendung externer Profile (Parents) | 100 % (1 von 1 Profil-Parents extern; abstrakte LM-Basistypen ausgeschlossen) |
| FHIR-Version | R4 — aktuell verbreitet |
| Dependency-Veraltung | 0 veraltet (Heuristik) |
| Pflege-Kadenz | 62.2 Commits/Jahr · letzter Commit vor 214 Tagen |

</div>

_Lock-in und Standard-Terminologie-Anteil sind grobe Heuristiken aus Textvorkommen. Heuristik aus CalVer-Jahr; exakt nur via Package-Registry (extern)._

## Planung & Terminierung

_Planungsgrößen jenseits reiner Personenstunden: Kalenderzeit, Szenarien (Min/Erwartet/Max), Schätz-Konfidenz, Startbereitschaft und grober Rollen-Mix._

<div align="center">

| Planungsgröße | Wert |
|---|---|
| Kalenderzeit | 3–5 Arbeitstage |
| Szenario Min / Erwartet / Max | 12,1 / 15,9 / 19,6 h |
| Schätz-Konfidenz | mittel |
| Startbereitschaft | 90/100 |
| Cross-Modul-Abhängigkeit | gering |
| KI-Fixaufwandsanteil | 34 % |

</div>

**Rollen-Mix (grob):** FSH-Rückgewinnung/Pins 0 % · Template/Tooling (Direktiven) 64 % · Redaktion/Doku (Seiten) 36 %. Direktiven & Seiten gut parallelisierbar; Setup/QA seriell.

_Hinweis: FHIR-/FSH-Fachwissen ist für Review, Validierung und QC-Übernahme generell erforderlich; ein 0-%-Wert bei FSH bedeutet nur, dass **kein FSH-Rückbau (GoFSH)** anfällt. Annahmen Kalenderzeit: 8 h/Tag · Team 1 · Auslastung 60 %._

## Risiko & Compliance

_Entscheidungsrelevante Risiken für die Freigabe: Terminologie-Lizenzen, unterdrückte Warnungen, Datenschutz-Substanz, Wissenskonzentration (Bus-Faktor) und Kompatibilitätsbruch zur Vorversion._

<div align="center">

| Risiko | Bewertung |
|---|---|
| Terminologie-Lizenz | unkritisch — ICD-10: frei |
| Unterdrückte QA-Warnungen | 0 (davon 0 breit) → keine |
| Datenschutz-Seite (Substanz) | fehlt/nur Stub (0 Wörter) |
| PII-artige Beispieldaten | keine erkannt |
| Bus-Faktor (Wissenskonzentration) | 31 % Top-Autor → gering |
| Breaking-Change-Risiko ggü. Vorversion | — (nur per Build/Vorversions-Diff) |

</div>

## Empfehlungen für die Überführung in ein generisches HL7-FHIR-IG

_Hier stehen je Themenbereich konkrete, aus den Kennzahlen abgeleitete Schritte, um den IG in das generische HL7-FHIR-IG-Format zu überführen._

<div align="center">

| Bereich | Befund | Empfehlung |
|---|---|---|
| Artefakte (FSH) | 175 publiziert, FSH vorhanden | Liegen die Artefakte bereits als FSH vor, können sie unverändert nach input/fsh/ übernommen werden; ein Rückwandeln aus fertigen FHIR-Dateien entfällt. Wichtig: ids und Canonical-URLs bleiben gleich, damit bestehende Verweise weiter funktionieren (Bestandsschutz). |
| Narrative | 11 Inhalts-Seiten, Format source | Die frei geschriebenen Erklärseiten gehören als Markdown-Dateien nach input/pagecontent/. Reine Platzhalter-/Navigationsseiten werden nicht übernommen, da Navigation und Inhaltsverzeichnis automatisch entstehen. |
| Direktiven | 48 (1 unbekannt) | Plattformspezifische Platzhalter/Tags werden durch die passenden Mechanismen des IG Publishers ersetzt (meist Vorlagen-Includes oder normale Markdown-Konstrukte). Direktiven ohne bekanntes Gegenstück werden einzeln von Hand geprüft und sinnvoll übersetzt. |
| Dependencies | 0 (0 floating) | Alle deklarierten Paket-Abhängigkeiten werden mit fester Version in die sushi-config.yaml übernommen. Feste Versionen (Pinning) sind reproduzierbaren Builds vorzuziehen; bewegliche Einträge werden auf eine konkrete Version festgelegt. |
| Mehrsprachigkeit | FSH-Übersetzung nein, Supplements 0 | In Ressourcen eingebettete Übersetzungen werden vom Build automatisch in die jeweilige Sprachausgabe übernommen. Für übersetzte Erklärseiten legt man pro Sprache eigene Seiten an; eine Sprache bleibt führend, jede maschinelle Übersetzung ist menschlich zu prüfen. |
| Pflichtseiten | 1/11 im Zielformat | Das Standard-Seitenraster sollte vollständig vorhanden sein (z.B. Startseite, Anwendungsfälle, Datensätze, Konformität, Kontext, Referenzen, Änderungen, Downloads, Datenschutz, Übersetzungshinweis). Fehlende Zielseiten werden ergänzt und in die Seiten-/Menükonfiguration aufgenommen. |
| QC-Regeln | 14 definiert | Die im Quellprojekt definierten Qualitätsregeln (qc/custom.rules.yaml) werden übernommen und in der CI-Pipeline regelmäßig ausgeführt, damit Validierung und Namenskonventionen automatisch geprüft werden. |
| Metadaten/Config | id mii-ig-meta, v2026.0.0 | Die Kerndaten des IG (id, Version, Status, Publisher, Lizenz) werden in sushi-config.yaml und ig.ini ins Zielformat überführt, inklusive Seiten-, Menü- und Sprachkonfiguration; die gewünschte Zielversion wird gesetzt. |
| Arbeitsweise | — | Die Migration findet isoliert auf einem eigenen Arbeitszweig statt, getrennt vom Hauptstand. Änderungen werden über einen Pull Request eingebracht und vor dem Zusammenführen menschlich geprüft, statt direkt auf den Hauptzweig zu schreiben. |

</div>

## Direktiven-Mapping (Detail)

_Dieser Abschnitt ordnet jedem Direktiven-Typ sein Gegenstück im IG-Publisher-Format zu, sortiert nach Häufigkeit._

<div align="center">

| Direktive | Anzahl | Was es tut | Empfehlung (→ IG Publisher) |
|---|---|---|---|
| tabs | 16 | Gruppiert mehrere Inhalte (z.B. Darstellung, XML, JSON) in umschaltbare Reiter. | Die einzelnen Reiterinhalte durch die jeweils passenden generierten Anzeige-Fragmente (Struktur, XML, JSON) ersetzen; eine eigene Reiter-Mechanik ist meist nicht nötig. |
| fql-at | 8 | Markiert einen Abfrage-Codeblock in besonderer Schreibweise (mit @-Präfix). | Wie einen normalen Abfrageblock behandeln und durch ein generiertes Tabellen-Fragment oder eine statische Tabelle ersetzen. |
| page-title | 7 | Setzt an dieser Stelle den Titel der Seite, der aus den Seiteneinstellungen gezogen wird. | Entfällt ersatzlos - Seitentitel und Überschrift steuert man zentral über die Seiten- und Menükonfiguration. |
| pagelink | 4 | Erzeugt einen Verweis auf eine andere Seite oder ein Artefakt anhand eines Namens-Hinweises. | Durch einen normalen Markdown-Link auf die generierte Artefaktseite ersetzen (Form Typ-id.html); der Artefaktname wird in die kleingeschriebene id umgesetzt. |
| index-root | 2 | Erzeugt an dieser Stelle ein automatisches Inhaltsverzeichnis bzw. die Wurzel der Navigationsstruktur. | Entfällt - Navigation und Inhaltsverzeichnis erzeugt der IG Publisher selbst aus der konfigurierten Seitenstruktur. |
| render | 2 | Bindet generierten Inhalt ein - ein Bild/Grafik oder eine vollständige FHIR-Ressource (z.B. CapabilityStatement). | Bild: nach input/images/ kopieren und als Markdown-/HTML-Bild einbinden. Ressource/Artefakt: meist entfernen (der IG Publisher erzeugt je Artefakt automatisch eine Seite) ODER das passende vorgefertigte Anzeige-Fragment einbinden. |
| tree | 2 | Zeigt die Struktur eines Profils/einer Extension als aufklappbaren Strukturbaum an. | Durch das vom IG Publisher erzeugte Struktur-Fragment ersetzen (Snapshot- oder Differential-Ansicht bzw. Element-Wörterbuch). |
| xml | 2 | Zeigt eine Ressource oder ein Beispiel in XML-Darstellung an. | Durch das vom IG Publisher erzeugte XML-Anzeige-Fragment ersetzen. |
| json | 2 | Zeigt eine Ressource oder ein Beispiel in JSON-Darstellung an. | Durch das vom IG Publisher erzeugte JSON-Anzeige-Fragment ersetzen. |
| link | 2 | Erzeugt einen Verweis auf ein einzelnes Artefakt (z.B. dessen Übersichtsseite). | Durch einen normalen Markdown-Link auf die generierte Artefaktseite ersetzen (Form Typ-id.html). |
| fql-tag | 1 | Öffnet einen Abfrageblock, der eine Tabelle aus FHIR-Inhalten erzeugt. | Bei Elementtabellen eines Profils durch das vorgefertigte Element-Wörterbuch-Fragment ersetzen; reine Metadaten (URL, Status, Version) entfallen (im generierten Kopfbereich vorhanden); sonst statische oder vorlagenbasierte Tabelle. |

</div>

> **1 unbekannte Treffer** ohne bekanntes Standard-Gegenstück – einzeln manuell prüfen (Fundorte im Anhang).

# Anhang: Detailaufschlüsselung

_Im Anhang steht jeder Einzelwert mit seiner Quelle, damit man die Kennzahlen nachvollziehen kann, ohne im Projekt suchen zu müssen._

## Identität & Herkunft

_Kerndaten des IG (Kennungen, Version, Status, Herausgeber) und woher sie stammen._

<div align="center">

| Feld | Wert | Quelle |
|---|---|---|
| id | mii-ig-meta | sushi-config.yaml / package.json |
| canonical | https://www.medizininformatik-initiative.de/fhir/modul-meta | sushi-config.yaml / package.json |
| packageId | de.medizininformatikinitiative.kerndatensatz.meta | sushi-config.yaml / package.json |
| name | MII_IG_Meta | sushi-config.yaml / package.json |
| title | MII IG Meta | sushi-config.yaml / package.json |
| version | 2026.0.0 | sushi-config.yaml / package.json |
| status | active | sushi-config.yaml / package.json |
| fhirVersion | 4.0.1 | sushi-config.yaml / package.json |
| license | CC-BY-4.0 | sushi-config.yaml / package.json |
| publisher | Medizininformatik Initiative | sushi-config.yaml / package.json |
| calver | True | version-Regex |

</div>

## Dependencies

_Die FHIR-Pakete, auf denen der IG aufbaut, samt Version und ob diese fest oder offen angegeben ist._

_keine_

## Artefakte (Quelle: input/fsh (FSH-Deklarationen))

_Jedes definierte Artefakt mit Typ, Name und Fundort in den Quelldateien._

<div align="center">

| Typ | Name | InstanceOf | Quelle |
|---|---|---|---|
| RuleSet | AddAbbreviation |  | input/fsh/codesystems/mii-cs-meta-diz-standorte.fsh:1 |
| RuleSet | AddKonsortium |  | input/fsh/codesystems/mii-cs-meta-diz-standorte.fsh:5 |
| RuleSet | AddUri |  | input/fsh/codesystems/mii-cs-meta-diz-standorte.fsh:9 |
| RuleSet | AddStatus |  | input/fsh/codesystems/mii-cs-meta-diz-standorte.fsh:13 |
| RuleSet | AddDeprecationDate |  | input/fsh/codesystems/mii-cs-meta-diz-standorte.fsh:17 |
| RuleSet | AddRetirementDate |  | input/fsh/codesystems/mii-cs-meta-diz-standorte.fsh:21 |
| RuleSet | AddDatenmanagementstelle |  | input/fsh/codesystems/mii-cs-meta-diz-standorte.fsh:25 |
| RuleSet | AddDiz |  | input/fsh/codesystems/mii-cs-meta-diz-standorte.fsh:29 |
| RuleSet | AddReplaces |  | input/fsh/codesystems/mii-cs-meta-diz-standorte.fsh:33 |
| RuleSet | AddReplacedBy |  | input/fsh/codesystems/mii-cs-meta-diz-standorte.fsh:37 |
| RuleSet | AddTRV |  | input/fsh/codesystems/mii-cs-meta-diz-standorte.fsh:41 |
| CodeSystem | MII_CS_Meta_DIZ_Standorte |  | input/fsh/codesystems/mii-cs-meta-diz-standorte.fsh:45 |
| Extension | MII_EX_Meta_License_Codeable |  | input/fsh/extensions/mii-ex-meta-license-codeable.fsh:1 |
| Invariant | search-param-code-regex |  | input/fsh/invariants/search-param-code.fsh:1 |
| Profile | MII_PR_Meta_SearchParameter |  | input/fsh/profiles/MII_PR_Meta_SearchParameter.fsh:1 |
| RuleSet | ExtensionContext |  | input/fsh/rulesets/extension-context.fsh:1 |
| RuleSet | LicenseCodeableCCBY40 |  | input/fsh/rulesets/license-terms.fsh:1 |
| RuleSet | LicenseCodeableCCBY40Instance |  | input/fsh/rulesets/license-terms.fsh:5 |
| RuleSet | Publisher |  | input/fsh/rulesets/publisher.fsh:1 |
| RuleSet | SP_Publisher |  | input/fsh/rulesets/publisher.fsh:6 |
| RuleSet | SP_Profile |  | input/fsh/rulesets/searchparam-profile.fsh:1 |
| RuleSet | Version |  | input/fsh/rulesets/version.fsh:2 |
| RuleSet | PR_CS_VS_Version |  | input/fsh/rulesets/version.fsh:5 |
| Instance | mii-sp-meta-supporting-info | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:1 |
| Instance | mii-sp-meta-description | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:21 |
| Instance | mii-sp-meta-body-structure-location-qualifier | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:44 |
| Instance | mii-sp-meta-composition-section-title | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:70 |
| Instance | mii-sp-meta-composition-section-author | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:91 |
| Instance | mii-sp-meta-diagnostic-report-conclusion | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:111 |
| Instance | mii-sp-meta-imaging-study-modality-body-site | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:133 |
| Instance | mii-sp-meta-imaging-study-bildgebungsgrund | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:155 |
| Instance | mii-sp-meta-imaging-study-modality | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:176 |
| Instance | mii-sp-meta-reason-reference | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:201 |
| Instance | mii-sp-meta-imaging-study-number-series | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:223 |
| Instance | mii-sp-meta-imaging-study-number-instances | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:246 |
| Instance | mii-sp-meta-imaging-study-procedure-reference | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:269 |
| Instance | mii-sp-meta-imaging-study-series-convolutional-kernel | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:288 |
| Instance | mii-sp-meta-imaging-study-series-ctdi-volume | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:309 |
| Instance | mii-sp-meta-imaging-study-series-exposure-time | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:332 |
| Instance | mii-sp-meta-imaging-study-series-exposure | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:355 |
| Instance | mii-sp-meta-imaging-study-series-xray-tube-current | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:378 |
| Instance | mii-sp-meta-imaging-study-series-kvp | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:401 |
| Instance | mii-sp-meta-imaging-study-series-view-position | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:424 |
| Instance | mii-sp-meta-imaging-study-series-magnetic-field-strength | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:449 |
| Instance | mii-sp-meta-imaging-study-series-scanning-sequence | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:472 |
| Instance | mii-sp-meta-imaging-study-series-scanning-sequence-variant | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:497 |
| Instance | mii-sp-meta-imaging-study-series-echo-time | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:522 |
| Instance | mii-sp-meta-imaging-study-series-repetition-time | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:545 |
| Instance | mii-sp-meta-imaging-study-series-inversion-time | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:568 |
| Instance | mii-sp-meta-imaging-study-series-flip-angle | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:591 |
| Instance | mii-sp-meta-imaging-study-series-radiopharmaceutical | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:614 |
| Instance | mii-sp-meta-imaging-study-series-radionuclide | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:639 |
| Instance | mii-sp-meta-imaging-study-series-tracer-exposure-time | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:664 |
| Instance | mii-sp-meta-imaging-study-series-units | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:687 |
| Instance | mii-sp-meta-imaging-study-series-radionuclide-total-dose | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:712 |
| Instance | mii-sp-meta-imaging-study-series-radionuclide-half-life | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:735 |
| Instance | mii-sp-meta-imaging-study-series-series-type | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:758 |
| Instance | mii-sp-meta-imaging-study-series-transducer-type | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:783 |
| Instance | mii-sp-meta-imaging-study-series-transducer-frequency | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:808 |
| Instance | mii-sp-meta-imaging-study-series-pulse-frequency | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:831 |
| Instance | mii-sp-meta-imaging-study-series-ultrasound-color | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:854 |
| Instance | mii-sp-meta-imaging-study-series-contrast-bolus | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:879 |
| Instance | mii-sp-meta-imaging-study-series-contrast-bolus-details | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:904 |
| Instance | mii-sp-meta-imaging-study-series-slice-thickness | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:924 |
| Instance | mii-sp-meta-imaging-study-series-number | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:947 |
| Instance | mii-sp-meta-imaging-study-series-laterality | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:970 |
| Instance | mii-sp-meta-imaging-study-series-started | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:995 |
| Instance | mii-sp-meta-imaging-study-instance-pixel-x | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:1013 |
| Instance | mii-sp-meta-imaging-study-instance-pixel-y | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:1036 |
| Instance | mii-sp-meta-imaging-study-instance-slice-thickness | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:1059 |
| Instance | mii-sp-meta-imaging-study-instance-image-type | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:1082 |
| Instance | mii-sp-meta-imaging-study-instance-burned-in-annotation | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:1107 |
| Instance | mii-sp-meta-imaging-study-instance-number | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:1132 |
| Instance | mii-sp-meta-observation-series-uid | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:1156 |
| Instance | mii-sp-meta-observation-sop-instance-uid | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:1181 |
| Instance | mii-sp-meta-observation-body-structure | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:1206 |
| Instance | mii-sp-meta-read-proc-report | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:1226 |
| RuleSet | AddTransactionEntry |  | input/fsh/searchparameters/mii-sp-meta-bundle.fsh:1 |
| RuleSet | AddCollectionEntry |  | input/fsh/searchparameters/mii-sp-meta-bundle.fsh:7 |
| Instance | mii-exa-meta-searchparam-transaction-bundle | Bundle | input/fsh/searchparameters/mii-sp-meta-bundle.fsh:11 |
| Instance | mii-exa-meta-searchparam-collection-bundle | Bundle | input/fsh/searchparameters/mii-sp-meta-bundle.fsh:201 |
| Instance | mii-sp-meta-condition-icd10gm-diagnosesicherheit | SearchParameter | input/fsh/searchparameters/mii-sp-meta-condition-icd10gm-diagnosesicherheit.fsh:1 |
| Instance | mii-sp-meta-condition-icd10gm-mehrfachcodierung | SearchParameter | input/fsh/searchparameters/mii-sp-meta-condition-icd10gm-mehrfachcodierung.fsh:1 |
| Instance | mii-sp-meta-condition-icd10gm-seitenlokalisation | SearchParameter | input/fsh/searchparameters/mii-sp-meta-condition-icd10gm-seitenlokalisation.fsh:1 |
| Instance | mii-sp-meta-consent-policyuri | SearchParameter | input/fsh/searchparameters/mii-sp-meta-consent-policyuri.fsh:1 |
| Instance | mii-sp-meta-consent-provisioncode | SearchParameter | input/fsh/searchparameters/mii-sp-meta-consent-provisioncode.fsh:1 |
| Instance | mii-sp-meta-consent-provisioncodeperiod | SearchParameter | input/fsh/searchparameters/mii-sp-meta-consent-provisioncodeperiod.fsh:1 |
| Instance | mii-sp-meta-consent-provisioncodetype | SearchParameter | input/fsh/searchparameters/mii-sp-meta-consent-provisioncodetype.fsh:1 |
| Instance | mii-sp-meta-consent-provisionperiod | SearchParameter | input/fsh/searchparameters/mii-sp-meta-consent-provisionperiod.fsh:1 |
| Instance | mii-sp-meta-consent-provisiontype | SearchParameter | input/fsh/searchparameters/mii-sp-meta-consent-provisiontype.fsh:1 |
| Instance | mii-sp-meta-device-property-type | SearchParameter | input/fsh/searchparameters/mii-sp-meta-device-property-type.fsh:1 |
| Instance | mii-sp-meta-devicemetric-source | SearchParameter | input/fsh/searchparameters/mii-sp-meta-devicemetric-source.fsh:1 |
| Instance | mii-sp-meta-dokument-documentreference-attachment-creation | MII_PR_Meta_SearchParameter | input/fsh/searchparameters/mii-sp-meta-dokument.fsh:1 |
| Instance | mii-sp-meta-dokument-documentreference-doc-status | MII_PR_Meta_SearchParameter | input/fsh/searchparameters/mii-sp-meta-dokument.fsh:19 |
| Instance | mii-sp-meta-dokument-documentreference-nlp-processing-status | MII_PR_Meta_SearchParameter | input/fsh/searchparameters/mii-sp-meta-dokument.fsh:37 |
| Instance | mii-sp-meta-encounter-aufnahmegrund-ersteundzweitestelle | SearchParameter | input/fsh/searchparameters/mii-sp-meta-encounter-aufnahmegrund.fsh:1 |
| Instance | mii-sp-meta-encounter-aufnahmegrund-drittestelle | SearchParameter | input/fsh/searchparameters/mii-sp-meta-encounter-aufnahmegrund.fsh:18 |
| Instance | mii-sp-meta-encounter-aufnahmegrund-viertestelle | SearchParameter | input/fsh/searchparameters/mii-sp-meta-encounter-aufnahmegrund.fsh:35 |
| Instance | mii-sp-meta-encounter-diagnosis-use | SearchParameter | input/fsh/searchparameters/mii-sp-meta-encounter-diagnosis-use.fsh:1 |
| Instance | mii-sp-meta-encounter-entlassungsgrund-ersteundzweitestelle | SearchParameter | input/fsh/searchparameters/mii-sp-meta-encounter-entlassungsgrund.fsh:1 |
| Instance | mii-sp-meta-encounter-entlassungsgrund-drittestelle | SearchParameter | input/fsh/searchparameters/mii-sp-meta-encounter-entlassungsgrund.fsh:18 |
| Instance | mii-sp-meta-encounter-hospitalization-admitsource | SearchParameter | input/fsh/searchparameters/mii-sp-meta-encounter-hospitalization-admitsource.fsh:1 |
| Instance | mii-sp-meta-encounter-location-physical-type | SearchParameter | input/fsh/searchparameters/mii-sp-meta-encounter-location-physical-type.fsh:1 |
| Instance | mii-sp-meta-encounter-servicetype | SearchParameter | input/fsh/searchparameters/mii-sp-meta-encounter-servicetype.fsh:1 |
| Instance | mii-sp-meta-medication-ingredient-strength-numerator | SearchParameter | input/fsh/searchparameters/mii-sp-meta-medication.fsh:1 |
| Instance | mii-sp-meta-medication-ingredient-strength-denominator | SearchParameter | input/fsh/searchparameters/mii-sp-meta-medication.fsh:24 |
| Instance | mii-sp-meta-medication-ingredient-strength | SearchParameter | input/fsh/searchparameters/mii-sp-meta-medication.fsh:47 |
| Instance | mii-sp-meta-medication-reasonreference | SearchParameter | input/fsh/searchparameters/mii-sp-meta-medication.fsh:69 |
| Instance | mii-sp-meta-medication-dosage-site | SearchParameter | input/fsh/searchparameters/mii-sp-meta-medication.fsh:91 |
| Instance | mii-sp-meta-medication-dosage-route | SearchParameter | input/fsh/searchparameters/mii-sp-meta-medication.fsh:116 |
| Instance | mii-sp-meta-medication-dosage-doserange-low | SearchParameter | input/fsh/searchparameters/mii-sp-meta-medication.fsh:141 |
| Instance | mii-sp-meta-medication-dosage-doserange-high | SearchParameter | input/fsh/searchparameters/mii-sp-meta-medication.fsh:165 |
| Instance | mii-sp-meta-medication-dosage-doserange | SearchParameter | input/fsh/searchparameters/mii-sp-meta-medication.fsh:189 |
| Instance | mii-sp-meta-medication-dosage-dosequantity | SearchParameter | input/fsh/searchparameters/mii-sp-meta-medication.fsh:212 |
| Instance | mii-sp-meta-medication-dosage-raterange-low | SearchParameter | input/fsh/searchparameters/mii-sp-meta-medication.fsh:237 |
| Instance | mii-sp-meta-medication-dosage-raterange-high | SearchParameter | input/fsh/searchparameters/mii-sp-meta-medication.fsh:261 |
| Instance | mii-sp-meta-medication-dosage-raterange | SearchParameter | input/fsh/searchparameters/mii-sp-meta-medication.fsh:285 |
| Instance | mii-sp-meta-medication-dosage-ratequantity | SearchParameter | input/fsh/searchparameters/mii-sp-meta-medication.fsh:308 |
| Instance | mii-sp-meta-medication-list-mode | SearchParameter | input/fsh/searchparameters/mii-sp-meta-medication.fsh:333 |
| Instance | mii-sp-meta-medication-dosage-rateratio-numerator | SearchParameter | input/fsh/searchparameters/mii-sp-meta-medication.fsh:351 |
| Instance | mii-sp-meta-medication-dosage-rateratio-denominator | SearchParameter | input/fsh/searchparameters/mii-sp-meta-medication.fsh:376 |
| Instance | mii-sp-meta-medication-dosage-rateratio | SearchParameter | input/fsh/searchparameters/mii-sp-meta-medication.fsh:401 |
| Instance | mii-sp-meta-medication-partof | SearchParameter | input/fsh/searchparameters/mii-sp-meta-medication.fsh:425 |
| Instance | mii-sp-meta-servicerequest-reasoncode | SearchParameter | input/fsh/searchparameters/mii-sp-meta-molgen.fsh:1 |
| Instance | mii-sp-meta-servicerequest-reasonreference | SearchParameter | input/fsh/searchparameters/mii-sp-meta-molgen.fsh:19 |
| Instance | mii-sp-meta-task-reasoncode | SearchParameter | input/fsh/searchparameters/mii-sp-meta-molgen.fsh:41 |
| Instance | mii-sp-meta-task-reasonreference | SearchParameter | input/fsh/searchparameters/mii-sp-meta-molgen.fsh:59 |
| Instance | mii-sp-meta-task-for | SearchParameter | input/fsh/searchparameters/mii-sp-meta-molgen.fsh:78 |
| Instance | mii-sp-meta-familymemberhistory-reasoncode | SearchParameter | input/fsh/searchparameters/mii-sp-meta-molgen.fsh:97 |
| Instance | mii-sp-meta-familymemberhistory-reasonreference | SearchParameter | input/fsh/searchparameters/mii-sp-meta-molgen.fsh:115 |
| Instance | mii-sp-meta-observation-component-interpretation | SearchParameter | input/fsh/searchparameters/mii-sp-meta-observation-component-interpretation.fsh:1 |
| Instance | mii-sp-meta-observation-interpretation | SearchParameter | input/fsh/searchparameters/mii-sp-meta-observation-interpretation.fsh:1 |
| Instance | mii-sp-meta-observation-issued | SearchParameter | input/fsh/searchparameters/mii-sp-meta-observation-issued.fsh:1 |
| Instance | mii-sp-meta-observation-referencerange | SearchParameter | input/fsh/searchparameters/mii-sp-meta-observation-referencerange.fsh:1 |
| Instance | mii-sp-meta-observation-referencerange-low | SearchParameter | input/fsh/searchparameters/mii-sp-meta-observation-referencerange.fsh:23 |
| Instance | mii-sp-meta-observation-referencerange-high | SearchParameter | input/fsh/searchparameters/mii-sp-meta-observation-referencerange.fsh:41 |
| Instance | mii-sp-meta-condition-verification-status | SearchParameter | input/fsh/searchparameters/mii-sp-meta-onko.fsh:4 |
| Instance | mii-sp-meta-condition-evidence-detail | SearchParameter | input/fsh/searchparameters/mii-sp-meta-onko.fsh:21 |
| Instance | mii-sp-meta-observation-hasmember | SearchParameter | input/fsh/searchparameters/mii-sp-meta-onko.fsh:63 |
| Instance | mii-sp-meta-procedure-complication | SearchParameter | input/fsh/searchparameters/mii-sp-meta-onko.fsh:123 |
| Instance | mii-sp-meta-procedure-outcome | SearchParameter | input/fsh/searchparameters/mii-sp-meta-onko.fsh:263 |
| Instance | mii-sp-meta-adverseevent-suspectentity-instance | SearchParameter | input/fsh/searchparameters/mii-sp-meta-onko.fsh:283 |
| Instance | mii-sp-meta-adverseevent-encounter | SearchParameter | input/fsh/searchparameters/mii-sp-meta-onko.fsh:300 |
| Instance | mii-sp-meta-careplan-created | SearchParameter | input/fsh/searchparameters/mii-sp-meta-onko.fsh:347 |
| Instance | mii-sp-meta-careplan-contributor | SearchParameter | input/fsh/searchparameters/mii-sp-meta-onko.fsh:364 |
| Instance | mii-sp-meta-careplan-addresses | SearchParameter | input/fsh/searchparameters/mii-sp-meta-onko.fsh:381 |
| Instance | mii-sp-meta-observation-focus | SearchParameter | input/fsh/searchparameters/mii-sp-meta-onko.fsh:416 |
| Instance | mii-sp-meta-observation-encounter | SearchParameter | input/fsh/searchparameters/mii-sp-meta-onko.fsh:433 |
| Instance | mii-sp-meta-specimen-request | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patho.fsh:4 |
| Instance | mii-sp-meta-specimen-collection-method | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patho.fsh:21 |
| Instance | mii-sp-meta-specimen-collection-body-site | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patho.fsh:38 |
| Instance | mii-sp-meta-specimen-processing-procedure | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patho.fsh:55 |
| Instance | mii-sp-meta-specimen-processing-additive | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patho.fsh:72 |
| Instance | mii-sp-meta-specimen-processing-date | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patho.fsh:89 |
| Instance | mii-sp-meta-specimen-container-additive | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patho.fsh:106 |
| Instance | mii-sp-meta-observation-bodysite | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patho.fsh:126 |
| Instance | mii-sp-meta-observation-value-ratio | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patho.fsh:143 |
| Instance | mii-sp-meta-observation-value-ratio-numerator | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patho.fsh:164 |
| Instance | mii-sp-meta-observation-value-ratio-denominator | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patho.fsh:182 |
| Instance | mii-sp-meta-servicerequest-supportinginfo | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patho.fsh:218 |
| Instance | mii-sp-meta-diagnosticreport-imagingstudy | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patho.fsh:238 |
| Instance | mii-sp-meta-composition-attester-mode | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patho.fsh:259 |
| Instance | mii-sp-meta-composition-custodian | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patho.fsh:276 |
| Instance | mii-sp-meta-composition-relatesto-code | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patho.fsh:293 |
| Instance | mii-sp-meta-media-partof | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patho.fsh:313 |
| Instance | mii-sp-meta-patient-adresszusatz | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patient-adresszusatz.fsh:1 |
| Instance | mii-sp-meta-patient-assignerpid | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patient-assignerpid.fsh:1 |
| Instance | mii-sp-meta-patient-gemeindeschluessel | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patient-gemeindeschluessel.fsh:1 |
| Instance | mii-sp-meta-patient-hausnummer | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patient-hausnummer.fsh:1 |
| Instance | mii-sp-meta-patient-otheramtlich | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patient-otheramtlich.fsh:1 |
| Instance | mii-sp-meta-patient-postfach | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patient-postfach.fsh:1 |
| Instance | mii-sp-meta-patient-prefix | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patient-prefix.fsh:1 |
| Instance | mii-sp-meta-patient-prefixqualifier | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patient-prefixqualifier.fsh:1 |
| Instance | mii-sp-meta-patient-stadtteil | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patient-stadtteil.fsh:1 |
| Instance | mii-sp-meta-patient-strasse | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patient-strasse.fsh:1 |
| Instance | mii-sp-meta-procedure-bodysite | SearchParameter | input/fsh/searchparameters/mii-sp-meta-procedure-bodysite.fsh:1 |
| Instance | mii-sp-meta-procedure-dokumentationsdatum | SearchParameter | input/fsh/searchparameters/mii-sp-meta-procedure-dokumentationsdatum.fsh:1 |
| Instance | mii-sp-meta-procedure-durchfuehrungsabsicht | SearchParameter | input/fsh/searchparameters/mii-sp-meta-procedure-durchfuehrungsabsicht.fsh:1 |
| Instance | mii-sp-meta-procedure-recorder | SearchParameter | input/fsh/searchparameters/mii-sp-meta-procedure-recorder.fsh:1 |
| Instance | mii-sp-meta-procedure-ops-seitenlokalisation | SearchParameter | input/fsh/searchparameters/mii-sp-meta-procedure-seitenlokalisation.fsh:1 |
| Instance | mii-sp-meta-researchsubject-consent | SearchParameter | input/fsh/searchparameters/mii-sp-meta-researchsubject-consent.fsh:1 |
| Instance | mii-sp-meta-specimen-diagnose | SearchParameter | input/fsh/searchparameters/mii-sp-meta-specimen-diagnose.fsh:1 |
| Instance | mii-sp-meta-documentreference-attachment-title | SearchParameter | input/fsh/searchparameters/mii-sp-meta-studie.fsh:1 |
| Instance | mii-sp-meta-documentreference-attachment-size | SearchParameter | input/fsh/searchparameters/mii-sp-meta-studie.fsh:19 |
| Instance | mii-sp-meta-evidencevariable-characteristic-description | SearchParameter | input/fsh/searchparameters/mii-sp-meta-studie.fsh:37 |
| Instance | mii-sp-meta-library-quellregister | SearchParameter | input/fsh/searchparameters/mii-sp-meta-studie.fsh:55 |
| Instance | mii-sp-meta-library-relatedartifact-url | SearchParameter | input/fsh/searchparameters/mii-sp-meta-studie.fsh:73 |
| Instance | mii-sp-meta-researchstudy-arm-name | SearchParameter | input/fsh/searchparameters/mii-sp-meta-studie.fsh:91 |
| Instance | mii-sp-meta-researchstudy-label | SearchParameter | input/fsh/searchparameters/mii-sp-meta-studie.fsh:109 |
| Instance | mii-sp-meta-researchstudy-akronym | SearchParameter | input/fsh/searchparameters/mii-sp-meta-studie.fsh:127 |
| Instance | mii-sp-meta-researchstudy-finanzierung | SearchParameter | input/fsh/searchparameters/mii-sp-meta-studie.fsh:145 |
| Instance | mii-sp-meta-researchstudy-studienregister | SearchParameter | input/fsh/searchparameters/mii-sp-meta-studie.fsh:163 |
| Instance | mii-sp-meta-researchstudy-rekrutierungsstand-datum | SearchParameter | input/fsh/searchparameters/mii-sp-meta-studie.fsh:181 |
| Instance | mii-sp-meta-researchstudy-rekrutierungsstand-genauigkeit | SearchParameter | input/fsh/searchparameters/mii-sp-meta-studie.fsh:199 |
| Instance | mii-sp-meta-researchstudy-rekrutierungsstand | SearchParameter | input/fsh/searchparameters/mii-sp-meta-studie.fsh:217 |
| Instance | mii-sp-meta-researchstudy-rekrutierungsziel | SearchParameter | input/fsh/searchparameters/mii-sp-meta-studie.fsh:235 |
| Instance | mii-sp-meta-researchstudy-rekrutierungsstart | SearchParameter | input/fsh/searchparameters/mii-sp-meta-studie.fsh:253 |

</div>

## Narrative-Seiten (11 Inhalt / 24 gesamt)

_Die Erklärseiten des IG mit Umfang und der Angabe, ob es sich um Inhalts- oder reine Platzhalterseiten handelt._

<div align="center">

| Datei | Wörter | Format | Stub? |
|---|---|---|---|
| implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/TechnischeImplementierung/FHIRProfile/Index.page.md | 613 | source |  |
| implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/TechnischeImplementierung/Conformance.page.md | 494 | source |  |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Index.page.md | 280 | source |  |
| implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/Index.page.md | 268 | source |  |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Release-notes.page.md | 163 | source |  |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Profil-SearchParameter.page.md | 125 | source |  |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Extension-Lizenzbedingungen.page.md | 119 | source |  |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Liste-Kerndatensatz-Suchparameter/Index.page.md | 64 | source |  |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/CodeSystem-MII-Standorte.page.md | 35 | source |  |
| implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/Release-notes.page.md | 29 | source |  |
| implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/TechnischeImplementierung/FHIRProfile/FHIR-Profil--Ressourcentyp.page.md | 28 | source |  |
| input/pagecontent/index.md | 17 | target | ja |
| implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/AnwendungsflleInformationsmodell/BeschreibungvonSzenarienfrdieAnwendungderModule.page.md | 17 | source | ja |
| implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/AnwendungsflleInformationsmodell/Datenstzeinkl.Beschreibungen.page.md | 15 | source | ja |
| implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/BeschreibungModulModul.page.md | 15 | source | ja |
| implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/AnwendungsflleInformationsmodell/Index.page.md | 13 | source | ja |
| implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/TechnischeImplementierung/Terminologien.page.md | 13 | source | ja |
| implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/KontextimGesamtprojektBezgezuanderenModulen.page.md | 12 | source | ja |
| implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/Referenzen.page.md | 12 | source | ja |
| implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/TechnischeImplementierung/Index.page.md | 12 | source | ja |
| implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/AnwendungsflleInformationsmodell/UML.page.md | 7 | source | ja |
| implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/TechnischeImplementierung/CapabilityStatement.page.md | 7 | source | ja |
| implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/HinweisTemplate.page.md | 4 | source | ja |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Index.page.md | 3 | source | ja |

</div>

> Format = **source**: Pflichtseiten existieren im Quell-Guide und werden bei der Migration ins Zielformat überführt; „fehlende Zielseiten" wird hier daher nicht als Lücke gewertet.

## Direktiven-Fundstellen

_Jede gefundene Direktive mit genauer Fundstelle und Originaltext zur weiteren Bearbeitung._

<div align="center">

| Fundstelle | Direktive | Text (gekürzt) |
|---|---|---|
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Index.page.md:1 | page-title | # {{page-title}} |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Index.page.md:15 | index-root | {{index:root}} |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Release-notes.page.md:1 | page-title | ## {{page-title}} |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Release-notes.page.md:19 | pagelink | * `Added`: `SearchParameter`-Ressource für Procedure OPS-Seitenlokalisation. Sie |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Release-notes.page.md:25 | pagelink | * `Changed`: `CodeSystem`-Ressource `MII_CS_Meta_DIZ_Standorte` der Medizininfor |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Release-notes.page.md:26 | pagelink | * `Added`: `SearchParameter`-Ressourcen der Erweiterungsmodule Bildgebung und Do |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Release-notes.page.md:33 | pagelink | * SearchParameter-Ressourcen aus Basis- und Erweiterungsmodulen werden nun zentr |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/CodeSystem-MII-Standorte.page.md:9 | fql-tag | <fql> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/CodeSystem-MII-Standorte.page.md:20 | render | {{render:https://www.medizininformatik-initiative.de/fhir/core/CodeSystem/core-l |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Extension-Lizenzbedingungen.page.md:11 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Extension-Lizenzbedingungen.page.md:24 | tabs | <tabs> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Extension-Lizenzbedingungen.page.md:25 | tree | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Extension-Lizenzbedingungen.page.md:25 | tabs | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Extension-Lizenzbedingungen.page.md:26 | tabs | <tab title="Beschreibung"> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Extension-Lizenzbedingungen.page.md:27 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Extension-Lizenzbedingungen.page.md:37 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Extension-Lizenzbedingungen.page.md:48 | tabs | </tab> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Extension-Lizenzbedingungen.page.md:49 | xml | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Extension-Lizenzbedingungen.page.md:49 | tabs | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Extension-Lizenzbedingungen.page.md:50 | json | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Extension-Lizenzbedingungen.page.md:50 | tabs | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Extension-Lizenzbedingungen.page.md:51 | link | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Extension-Lizenzbedingungen.page.md:51 | tabs | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Extension-Lizenzbedingungen.page.md:52 | tabs | </tabs> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Index.page.md:1 | page-title | ## {{page-title}} |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Liste-Kerndatensatz-Suchparameter/Index.page.md:5 | page-title | ## {{page-title}} |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Liste-Kerndatensatz-Suchparameter/Index.page.md:9 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Profil-SearchParameter.page.md:11 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Profil-SearchParameter.page.md:24 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Profil-SearchParameter.page.md:38 | tabs | <tabs> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Profil-SearchParameter.page.md:39 | tree | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Profil-SearchParameter.page.md:39 | tabs | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Profil-SearchParameter.page.md:40 | tabs | <tab title="Beschreibung"> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Profil-SearchParameter.page.md:41 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Profil-SearchParameter.page.md:51 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Profil-SearchParameter.page.md:62 | tabs | </tab> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Profil-SearchParameter.page.md:63 | xml | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Profil-SearchParameter.page.md:63 | tabs | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Profil-SearchParameter.page.md:64 | json | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Profil-SearchParameter.page.md:64 | tabs | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Profil-SearchParameter.page.md:65 | link | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Profil-SearchParameter.page.md:65 | tabs | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Profil-SearchParameter.page.md:66 | tabs | </tabs> |
| implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/AnwendungsflleInformationsmodell/UML.page.md:1 | page-title | ## {{page-title}} |
| implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/HinweisTemplate.page.md:4 | render | {{render:HereBeDragons}} |
| implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/Index.page.md:19 | index-root | {{index:root}} |
| implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/Release-notes.page.md:1 | page-title | ## {{page-title}} |
| implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/TechnischeImplementierung/CapabilityStatement.page.md:1 | page-title | ## {{page-title}} |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Index.page.md:3 | UNBEKANNT | {{index:current}} |

</div>

## QC-Regeln (definiert; Quelle: qc/custom.rules.yaml)

_Die im Projekt hinterlegten Qualitätsregeln; ihre Einhaltung wird erst beim Qualitätslauf des Builds geprüft._

<div align="center">

| Name | Aktion | Prüfzweck (status) |
|---|---|---|
| parse-fhir-resources | parse | Checking if all FHIR Resource files can be parsed |
| resource-validation | validate | Validating resources against the FHIR standard and their profiles |
| unique-canonicals | unique | Checking if all StructureDefinitions have a unique canonical |
| — |  |  |
| no-snapshot |  | Checking that structure definitions do not have a pre-generated snapshot |
| valid-ids |  | Check for valid ids |
| valid-names |  |  |
| unique-names |  |  |
| version-filled |  | Checking if all resources have version filled |
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
- FSH-Translation-Extensions: nein

## Dopplungen & ungenutzte Dateien

_Konkrete Fundstellen doppelter Inhaltsblöcke sowie Listen nicht referenzierter Bilder und nicht eingebundener Beispiele._

<div align="center">

| Doppelter Inhaltsblock (gekürzt) | IG-Ordner | Vorkommen |
|---|---|---|
| copyright hinweis, nutzungshinweise © 2019+ tmf e. v., charlottenstraße 42, 10117 berlin.  | ⚠ ImplementationGuide-2025 / MedizininformatikInitiative-ImplementationGuide-Template | implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Index.page.md · implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/Index.page.md |
| zu den nutzungsrechten der zugrunde liegenden fhir technologie siehe die fhir basis spezif | ⚠ ImplementationGuide-2025 / MedizininformatikInitiative-ImplementationGuide-Template | implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Index.page.md · implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/Index.page.md |
| einige verwendete codesysteme werden von anderen organisationen herausgegeben und gepflegt | ⚠ ImplementationGuide-2025 / MedizininformatikInitiative-ImplementationGuide-Template | implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Index.page.md · implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/Index.page.md |

</div>

> ⚠ 3 Inhaltsblock/-blöcke kommen **ordnerübergreifend** (in mehreren IG-Ordnern) vor — Kandidat für Konsolidierung bzw. ausgelagerte Übersetzung.

**Beispiele nicht in Narrativen eingebunden (5):** `mii-exa-meta-searchparam-transaction-bundle`, `mii-exa-meta-searchparam-collection-bundle`, `mii-sp-meta-dokument-documentreference-attachment-creation`, `mii-sp-meta-dokument-documentreference-doc-status`, `mii-sp-meta-dokument-documentreference-nlp-processing-status`

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
