# IG-Statistik — MII KDS Labor 2026.0.3

_Modus: `static` · Stand: 2026-06-26T21:58:49Z · Commit: `fa7c64e`_

## Executive Summary: Migration des FHIR-Leitfadens "MII IG Laborbefund"

> **Worum geht es?** Ein FHIR Implementation Guide (kurz „IG“) ist die technische Spezifikation eines Datenstandards im Gesundheitswesen – das Regelwerk plus die zugehörige Online-Dokumentation. Dieser IG soll von einer herstellergebundenen Plattform auf das herstellerneutrale Standard-Werkzeug der FHIR-Community (den „IG Publisher“) umgezogen werden. Inhaltlich ändert sich nichts – nur die technische Bauweise der Veröffentlichung. _Fachbegriffe sind im Glossar am Dokumentende erklärt._

### Das Wichtigste in einem Satz

Der Umzug ist **umfangreich** (geschätzt **47–76 Personenstunden**, also rund **5,9–9,5 Personentage**), **ohne erkennbare Blocker** – die fachliche Substanz liegt bereits in maschinenlesbarer, sauberer Form vor. Mit KI-Unterstützung lässt sich der Aufwand voraussichtlich spürbar senken (modellierte ~29–48 h, ≈ 37 % weniger; Annahmen und Vorbehalte siehe „Aufwand“).

### Inhaltlicher Umfang (was migriert wird)

- **Identität:** `None`, Version 2026.0.3, Herausgeber None, Lizenz CC-BY-4.0, Status „active“.
- **20 fachliche Bausteine:** 3 Profile (Kernregelwerk), 2 Erweiterungen, 7 Werte-Listen, 1 logisches Datenmodell, 1 Fähigkeitsbeschreibung, 6 Beispiele.
- **Dokumentation:** 37 inhaltliche Textseiten (~10875 Wörter, Ø 294 Wörter/Seite) und 7 Bilder.

### Aufwand und was das Band bedeutet

- **Aufwandsband: L (groß)** – auf einer Skala S (klein, <1 Tag) / M (mittel, einige Tage) / L (groß, 1–2 Wochen) / XL (sehr groß) liegt dieses Vorhaben **im oberen Bereich**.
- **Manuell: rund 47–76 Stunden.** Das ist eine **Größenordnungsschätzung zur Budgetplanung** (Faustregel: Menge der Arbeitsschritte × Erfahrungswert) – **kein verbindliches Angebot**.
- **KI-gestützt teilautomatisiert: rund 29–48 Stunden** (≈ 37 % weniger). Das heißt: eine KI erledigt die wiederkehrenden Umbauten, Menschen prüfen und geben an Kontrollpunkten frei (Human-in-the-Loop / Review-Gates). Die Schätzung gilt **unabhängig davon, welches KI-Produkt eingesetzt wird** – sie ist eine _modellierte_ Annahme mit noch nicht kalibrierten Faktoren, **keine garantierte Einsparung**.
- **Größte Aufwandstreiber:** 201 plattformspezifische Platzhalter in den Textseiten (sog. „Direktiven“ – das neue Standard-Werkzeug kennt sie nicht, sie werden einzeln umgebaut; ~40 h) und 37 Inhaltsseiten (~18 h).
- **Reife & Strategie:** Reifegrad **74/100 (fortgeschritten)** · Hersteller-Lock-in hoch. (Details in den Abschnitten Reife & Freigabe und Strategie.)

### Wie sauber ist die Quelle?

- **Regeln liegen bereits in der bearbeitbaren Textform (FSH) vor – kein aufwändiger Rückbau nötig (Effizienzvorteil).**
- **2 externe Abhängigkeiten, davon 2 fest verankert, 0 beweglich.** Feste Versionen bedeuten reproduzierbare, stabile Builds – kein wackeliges Fundament.
- **Versionsnummer aus dem Kalenderjahr (CalVer)** – wird unverändert übernommen, kein Anpassungsbedarf.
- **Mehrsprachigkeit bereits technisch vorbereitet** – Übersetzungen können automatisch mitgenommen werden.
- **8 Qualitätsregeln** bereits definiert und 1:1 übernehmbar.

### Risiken und Blocker

- **Keine harten Blocker.**
- **18 der 201 Platzhalter/„Direktiven“ sind „unbekannt“** – ohne automatisches Umsetzungsmuster, daher **von Hand** zu übertragen. Überwiegend eingebettete Ansichten; Mehraufwand begrenzt, aber einzuplanen.
- **Schätzungs-Vorbehalt:** beruht auf einer rein **statischen** Analyse der Quelldateien (ohne Test-Build); ein vollständiger Validierungslauf kann zusätzliche Detailkorrekturen aufdecken. Die Erfahrungswerte sind noch nicht final kalibriert – daher die bewusst breite Spanne.
- **Risikomindernd:** Der Umzug erfolgt isoliert auf einem separaten Arbeitszweig, ohne Eingriff in den produktiven Stand; ein menschliches Abschluss-Review ist vorgesehen.

### Bottom Line / Empfehlung

**Durchführbar – mit Ressourcen- und Zeitplanung.** Der Aufwand ist groß und kalkulierbar (manuell ~5,9–9,5 Personentage, KI-gestützt voraussichtlich spürbar weniger), die Quelle ist reif. Konkret einzuplanen: die 18 von Hand zu übertragenden Platzhalter sowie ein abschließender Validierungslauf mit fachlichem Review.

## Kennzahlen-Überblick

### Artefakte (Σ 20 publiziert)

_Hier wird gezählt, wie viele FHIR-Bausteine (Profile, Extensions, ValueSets usw.) der IG je Typ definiert._

<div align="center">

```mermaid
%%{init: {'theme':'base','themeVariables':{"pie1": "#4E79A7", "pie2": "#F28E2B", "pie3": "#59A14F", "pie4": "#E15759", "pie5": "#76B7B2", "pie6": "#EDC948", "pieOpacity": "1", "pieSectionTextColor": "#1A1A1A", "pieTitleTextSize": "18px"}}}%%
pie showData title Artefakte
    "valuesets" : 7
    "examples" : 6
    "profiles" : 3
    "extensions" : 2
    "logicals" : 1
    "capabilitystatements" : 1
```

</div>

<div align="center">

| Typ | Anzahl |
|---|---|
| valuesets | 7 |
| examples | 6 |
| profiles | 3 |
| extensions | 2 |
| logicals | 1 |
| capabilitystatements | 1 |

</div>

_Interne FSH-Konstrukte (nicht in Σ): 13 rulesets, 2 invariants, 1 mappings._

### Plattform-Direktiven — Σ 201 (unbekannt: 18)

_Dieser Abschnitt listet die plattformspezifischen Platzhalter in den Erklärseiten, die ein generischer IG Publisher nicht versteht und die daher umgesetzt werden müssen._

<div align="center">

```mermaid
%%{init: {'theme':'base','themeVariables':{"pie1": "#4E79A7", "pie2": "#F28E2B", "pie3": "#59A14F", "pie4": "#E15759", "pie5": "#76B7B2", "pie6": "#EDC948", "pie7": "#B07AA1", "pie8": "#FF9DA7", "pie9": "#9C755F", "pie10": "#BAB0AC", "pieOpacity": "1", "pieSectionTextColor": "#1A1A1A", "pieTitleTextSize": "18px"}}}%%
pie showData title Direktiven
    "tabs" : 102
    "render" : 25
    "fql-tag" : 22
    "link" : 18
    "json" : 12
    "tree" : 10
    "xml" : 6
    "pagelink" : 2
    "index-root" : 2
    "page-title" : 2
```

</div>

<div align="center">

| Direktive | Anzahl |
|---|---|
| tabs | 102 |
| render | 25 |
| fql-tag | 22 |
| link | 18 |
| json | 12 |
| tree | 10 |
| xml | 6 |
| pagelink | 2 |
| index-root | 2 |
| page-title | 2 |

</div>

## Inhaltsumfang & Repo-Hygiene

_Linguistische Kennzahlen zum Textumfang (Wörter je Seite, Durchschnitt) sowie Hinweise auf inhaltliche Dopplungen und nicht referenzierte Dateien (Dead-Code-Analogie) - hilft, Umfang und Aufräumpotenzial einzuschätzen._

<div align="center">

| Kennzahl | Wert |
|---|---|
| Enthaltene IG-Ordner | 2 |
| Inhalts-Seiten | 37 |
| Wörter gesamt | 10875 |
| Ø Wörter / Seite | 293,9 |
| Median Wörter / Seite | 164 |
| kürzeste / längste Seite | 23 / 1435 Wörter |
| doppelte Inhaltsblöcke | 73 (davon 73 ordnerübergreifend) |
| identische Seiten (Gruppen) | 17 |
| Bilder nicht referenziert | 0 von 7 |
| Beispiele nicht in Narrativen | 3 von 6 |

</div>

**Enthaltene IG-Ordner (2) — Aufschlüsselung je IG (Spalten: aktuell → ältest):**

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

> ⚠ Das Repo enthält **2 IG-Ordner** (Versions-/Sprachvarianten). Aggregat-Kennzahlen (Direktiven, Wörter, **Aufwand**) summieren über **alle** Ordner — für die Migration **einer** Version entsprechend nach unten zu korrigieren; die 73 ordnerübergreifenden Dopplungen zeigen das Ausmaß.

_Heuristik: 'nicht referenziert' = Dateiname/Artefaktname kommt in keiner Erklärseite vor. Kein Beweis für Ungenutztheit (Referenz kann über Konfiguration/Build erfolgen)._

## Aufwand: manuell vs. KI-gestützt

_Dieser Abschnitt schätzt den Arbeitsaufwand der Überführung als Spanne - manuell und KI-gestützt teilautomatisiert - abgeleitet aus zählbaren Treibern und Stundenfaktoren._

<div align="center">

| Treiber | Menge | manuell [h] | KI-gestützt [h] |
|---|---|---|---|
| Direktiven (bekannt) | 183 | 36,6 | 14,6 |
| Inhalts-Seiten | 37 | 18,5 | 7,4 |
| Direktiven (unbekannt → manuell) | 18 | 3,6 | 3,6 |
| GoFSH-Vorlauf (Regel-Rückgewinnung) | nein | 0 | 0 |
| Floating Pins (Versionen fixieren) | 0 | 0 | 0 |
| Einarbeitung/Setup (einmalig) | — | 0 | 3 |
| Review-Gates (Pauschale) | — | 0 | 3 |
| Validierungs-/Iterationsaufschlag (20 %) | — | 0 | 5,1 |

</div>

**Manuell:** Band L · **47–76,3 h**  |  **KI-gestützt (HITL, Review-Gates, anbieter-/modellunabhängig):** Band L · **29,4–47,8 h** · **≈ 37 % weniger**

_Annahmen:_ • Nur statisch berechenbare Treiber; id/url-Mismatch, QC-Verletzungen und quell-intrinsische Validierungsfehler erfordern einen Build und sind hier nicht enthalten. • Faktoren sind Erfahrungswerte, noch nicht final kalibriert; Spanne = Basis × 0,8…1,3. • pages = Inhalts-Seiten (Stubs/Navigation < 20 Wörter ausgeschlossen). • Personentage = Aufwand in 8-h-Arbeitstagen (1 PT = 8 Personenstunden); beide Schätzungen messen MENSCHLICHE Arbeitszeit — manuell die Migration von Hand, KI-gestützt die Bedien-/Review-Zeit der KI (Prompts, Review-Gates, Korrekturen), NICHT die Rechen-/Laufzeit oder Wartezeit der KI. • KI-Schätzung: anbieter-/modellunabhängig (Human-in-the-Loop, Review-Gates). Enthält feste Pauschalen für Einarbeitung/Setup (3 h) und Review-Gates (3 h) sowie einen Validierungs-/Iterationsaufschlag (20 %); unbekannte Direktiven werden wie manuell gerechnet. Bewusst konservativ – keine garantierte Einsparung.

## Reife & Freigabe

_Verdichteter Reifegrad als Freigabe-Indikator: Status, Vollständigkeit der Dokumentation, Beispiel-Abdeckung der Profile und Governance-Reife._

<div align="center">

| Komponente | Wert |
|---|---|
| **Reifegrad-Score** | **74/100 (fortgeschritten)** |
| Status | active |
| Doku-Vollständigkeit (Inhalt vs. Stubs) | 88 % |
| Beispiel-Abdeckung Profile | 100 % (3/3) |
| Governance (CI · ig.ini · publication · devcontainer) | 25/100 |

</div>

## Strategie: Wiederverwendung, Lock-in & Zukunftssicherheit

_Strategische Kennzahlen: Bindung an die Quellplattform (Lock-in), Anteil standardisierter Terminologie, Wiederverwendung externer Bausteine und Zukunftssicherheit (FHIR-Version, Pflege-Aktivität)._

<div align="center">

| Kennzahl | Wert |
|---|---|
| Hersteller-Lock-in | 65/100 (hoch) · 5,4 Direktiven/Seite |
| Standard-Terminologie-Anteil | 100 % (SNOMED CT, LOINC, UCUM) |
| Wiederverwendung externer Profile (Parents) | 100 % (3 von 3 Profil-Parents extern; abstrakte LM-Basistypen ausgeschlossen) |
| FHIR-Version | R4 — aktuell verbreitet |
| Dependency-Veraltung | 0 veraltet (Heuristik) |
| Pflege-Kadenz | 49.2 Commits/Jahr · letzter Commit vor 15 Tagen |

</div>

_Lock-in und Standard-Terminologie-Anteil sind grobe Heuristiken aus Textvorkommen. Heuristik aus CalVer-Jahr; exakt nur via Package-Registry (extern)._

## Planung & Terminierung

_Planungsgrößen jenseits reiner Personenstunden: Kalenderzeit, Szenarien (Min/Erwartet/Max), Schätz-Konfidenz, Startbereitschaft und grober Rollen-Mix._

<div align="center">

| Planungsgröße | Wert |
|---|---|
| Kalenderzeit | 10–16 Arbeitstage |
| Szenario Min / Erwartet / Max | 47 / 61,6 / 76,3 h |
| Schätz-Konfidenz | niedrig |
| Startbereitschaft | 90/100 |
| Cross-Modul-Abhängigkeit | gering |
| KI-Fixaufwandsanteil | 13 % |

</div>

**Rollen-Mix (grob):** FSH-Rückgewinnung/Pins 0 % · Template/Tooling (Direktiven) 68 % · Redaktion/Doku (Seiten) 32 %. Direktiven & Seiten gut parallelisierbar; Setup/QA seriell.

_Hinweis: FHIR-/FSH-Fachwissen ist für Review, Validierung und QC-Übernahme generell erforderlich; ein 0-%-Wert bei FSH bedeutet nur, dass **kein FSH-Rückbau (GoFSH)** anfällt. Annahmen Kalenderzeit: 8 h/Tag · Team 1 · Auslastung 60 %._

## Risiko & Compliance

_Entscheidungsrelevante Risiken für die Freigabe: Terminologie-Lizenzen, unterdrückte Warnungen, Datenschutz-Substanz, Wissenskonzentration (Bus-Faktor) und Kompatibilitätsbruch zur Vorversion._

<div align="center">

| Risiko | Bewertung |
|---|---|
| Terminologie-Lizenz | Lizenzbedarf möglich — SNOMED CT: lizenzpflichtig (Affiliate/Land), LOINC: frei (Registrierung), UCUM: frei |
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
| Artefakte (FSH) | 20 publiziert, FSH vorhanden | Liegen die Artefakte bereits als FSH vor, können sie unverändert nach input/fsh/ übernommen werden; ein Rückwandeln aus fertigen FHIR-Dateien entfällt. Wichtig: ids und Canonical-URLs bleiben gleich, damit bestehende Verweise weiter funktionieren (Bestandsschutz). |
| Narrative | 37 Inhalts-Seiten, Format source | Die frei geschriebenen Erklärseiten gehören als Markdown-Dateien nach input/pagecontent/. Reine Platzhalter-/Navigationsseiten werden nicht übernommen, da Navigation und Inhaltsverzeichnis automatisch entstehen. |
| Direktiven | 201 (18 unbekannt) | Plattformspezifische Platzhalter/Tags werden durch die passenden Mechanismen des IG Publishers ersetzt (meist Vorlagen-Includes oder normale Markdown-Konstrukte). Direktiven ohne bekanntes Gegenstück werden einzeln von Hand geprüft und sinnvoll übersetzt. |
| Dependencies | 2 (0 floating) | Alle deklarierten Paket-Abhängigkeiten werden mit fester Version in die sushi-config.yaml übernommen. Feste Versionen (Pinning) sind reproduzierbaren Builds vorzuziehen; bewegliche Einträge werden auf eine konkrete Version festgelegt. |
| Mehrsprachigkeit | FSH-Übersetzung ja, Supplements 0 | In Ressourcen eingebettete Übersetzungen werden vom Build automatisch in die jeweilige Sprachausgabe übernommen. Für übersetzte Erklärseiten legt man pro Sprache eigene Seiten an; eine Sprache bleibt führend, jede maschinelle Übersetzung ist menschlich zu prüfen. |
| Pflichtseiten | 0/11 im Zielformat | Das Standard-Seitenraster sollte vollständig vorhanden sein (z.B. Startseite, Anwendungsfälle, Datensätze, Konformität, Kontext, Referenzen, Änderungen, Downloads, Datenschutz, Übersetzungshinweis). Fehlende Zielseiten werden ergänzt und in die Seiten-/Menükonfiguration aufgenommen. |
| QC-Regeln | 8 definiert | Die im Quellprojekt definierten Qualitätsregeln (qc/custom.rules.yaml) werden übernommen und in der CI-Pipeline regelmäßig ausgeführt, damit Validierung und Namenskonventionen automatisch geprüft werden. |
| Metadaten/Config | id None, v2026.0.3 | Die Kerndaten des IG (id, Version, Status, Publisher, Lizenz) werden in sushi-config.yaml und ig.ini ins Zielformat überführt, inklusive Seiten-, Menü- und Sprachkonfiguration; die gewünschte Zielversion wird gesetzt. |
| Arbeitsweise | — | Die Migration findet isoliert auf einem eigenen Arbeitszweig statt, getrennt vom Hauptstand. Änderungen werden über einen Pull Request eingebracht und vor dem Zusammenführen menschlich geprüft, statt direkt auf den Hauptzweig zu schreiben. |

</div>

## Direktiven-Mapping (Detail)

_Dieser Abschnitt ordnet jedem Direktiven-Typ sein Gegenstück im IG-Publisher-Format zu, sortiert nach Häufigkeit._

<div align="center">

| Direktive | Anzahl | Was es tut | Empfehlung (→ IG Publisher) |
|---|---|---|---|
| tabs | 102 | Gruppiert mehrere Inhalte (z.B. Darstellung, XML, JSON) in umschaltbare Reiter. | Die einzelnen Reiterinhalte durch die jeweils passenden generierten Anzeige-Fragmente (Struktur, XML, JSON) ersetzen; eine eigene Reiter-Mechanik ist meist nicht nötig. |
| render | 25 | Bindet generierten Inhalt ein - ein Bild/Grafik oder eine vollständige FHIR-Ressource (z.B. CapabilityStatement). | Bild: nach input/images/ kopieren und als Markdown-/HTML-Bild einbinden. Ressource/Artefakt: meist entfernen (der IG Publisher erzeugt je Artefakt automatisch eine Seite) ODER das passende vorgefertigte Anzeige-Fragment einbinden. |
| fql-tag | 22 | Öffnet einen Abfrageblock, der eine Tabelle aus FHIR-Inhalten erzeugt. | Bei Elementtabellen eines Profils durch das vorgefertigte Element-Wörterbuch-Fragment ersetzen; reine Metadaten (URL, Status, Version) entfallen (im generierten Kopfbereich vorhanden); sonst statische oder vorlagenbasierte Tabelle. |
| link | 18 | Erzeugt einen Verweis auf ein einzelnes Artefakt (z.B. dessen Übersichtsseite). | Durch einen normalen Markdown-Link auf die generierte Artefaktseite ersetzen (Form Typ-id.html). |
| json | 12 | Zeigt eine Ressource oder ein Beispiel in JSON-Darstellung an. | Durch das vom IG Publisher erzeugte JSON-Anzeige-Fragment ersetzen. |
| tree | 10 | Zeigt die Struktur eines Profils/einer Extension als aufklappbaren Strukturbaum an. | Durch das vom IG Publisher erzeugte Struktur-Fragment ersetzen (Snapshot- oder Differential-Ansicht bzw. Element-Wörterbuch). |
| xml | 6 | Zeigt eine Ressource oder ein Beispiel in XML-Darstellung an. | Durch das vom IG Publisher erzeugte XML-Anzeige-Fragment ersetzen. |
| pagelink | 2 | Erzeugt einen Verweis auf eine andere Seite oder ein Artefakt anhand eines Namens-Hinweises. | Durch einen normalen Markdown-Link auf die generierte Artefaktseite ersetzen (Form Typ-id.html); der Artefaktname wird in die kleingeschriebene id umgesetzt. |
| index-root | 2 | Erzeugt an dieser Stelle ein automatisches Inhaltsverzeichnis bzw. die Wurzel der Navigationsstruktur. | Entfällt - Navigation und Inhaltsverzeichnis erzeugt der IG Publisher selbst aus der konfigurierten Seitenstruktur. |
| page-title | 2 | Setzt an dieser Stelle den Titel der Seite, der aus den Seiteneinstellungen gezogen wird. | Entfällt ersatzlos - Seitentitel und Überschrift steuert man zentral über die Seiten- und Menükonfiguration. |

</div>

> **18 unbekannte Treffer** ohne bekanntes Standard-Gegenstück – einzeln manuell prüfen (Fundorte im Anhang).

# Anhang: Detailaufschlüsselung

_Im Anhang steht jeder Einzelwert mit seiner Quelle, damit man die Kennzahlen nachvollziehen kann, ohne im Projekt suchen zu müssen._

## Identität & Herkunft

_Kerndaten des IG (Kennungen, Version, Status, Herausgeber) und woher sie stammen._

<div align="center">

| Feld | Wert | Quelle |
|---|---|---|
| id |  | sushi-config.yaml / package.json |
| canonical | https://www.medizininformatik-initiative.de/fhir/core/modul-labor | sushi-config.yaml / package.json |
| packageId | de.medizininformatikinitiative.kerndatensatz.labor | sushi-config.yaml / package.json |
| name | de.medizininformatikinitiative.kerndatensatz.labor | sushi-config.yaml / package.json |
| title | MII IG Laborbefund | sushi-config.yaml / package.json |
| version | 2026.0.3 | sushi-config.yaml / package.json |
| status | active | sushi-config.yaml / package.json |
| fhirVersion | 4.0.1 | sushi-config.yaml / package.json |
| license | CC-BY-4.0 | sushi-config.yaml / package.json |
| publisher |  | sushi-config.yaml / package.json |
| calver | True | version-Regex |

</div>

## Dependencies

_Die FHIR-Pakete, auf denen der IG aufbaut, samt Version und ob diese fest oder offen angegeben ist._

<div align="center">

| Package | Version | Pin |
|---|---|---|
| hl7.fhir.uv.ips | 2.0.0 | gepinnt |
| de.medizininformatikinitiative.kerndatensatz.meta | 2026.0.0 | gepinnt |

</div>

## Artefakte (Quelle: input/fsh (FSH-Deklarationen))

_Jedes definierte Artefakt mit Typ, Name und Fundort in den Quelldateien._

<div align="center">

| Typ | Name | InstanceOf | Quelle |
|---|---|---|---|
| RuleSet | SupportResource |  | input/fsh/capabilitystatements/mii-cps-labor-capabilitystatement.fsh:3 |
| RuleSet | SupportProfile |  | input/fsh/capabilitystatements/mii-cps-labor-capabilitystatement.fsh:8 |
| RuleSet | SupportInteraction |  | input/fsh/capabilitystatements/mii-cps-labor-capabilitystatement.fsh:13 |
| RuleSet | SupportSearchParam |  | input/fsh/capabilitystatements/mii-cps-labor-capabilitystatement.fsh:19 |
| Instance | mii-cps-labor-capabilitystatement | CapabilityStatement | input/fsh/capabilitystatements/mii-cps-labor-capabilitystatement.fsh:27 |
| Extension | MII_EX_Labor_Interpretationsbeeinflussende_Eigenschaft |  | input/fsh/extensions/MII_EX_Labor_Interpretationsbeeinflussende_Probeneigenschaft.fsh:1 |
| Extension | MII_EX_Labor_Quelle_Klinisches_Bezugsdatum |  | input/fsh/extensions/MII_EX_Labor_Quelle_Klinisches_Bezugsdatum.fsh:1 |
| Instance | mii-exa-labor-laboranforderung | MII_PR_Labor_Laboranforderung | input/fsh/instances/mii-exa-labor-laboranforderung.fsh:1 |
| Instance | mii-exa-labor-laborbefund | MII_PR_Labor_Laborbefund | input/fsh/instances/mii-exa-labor-laborbefund.fsh:1 |
| Instance | mii-exa-labor-laborwert-data-absent-reason | MII_PR_Labor_Laboruntersuchung | input/fsh/instances/mii-exa-labor-laborwert-data-absent-reason.fsh:1 |
| Instance | mii-exa-labor-laborwert | MII_PR_Labor_Laboruntersuchung | input/fsh/instances/mii-exa-labor-laborwert.fsh:1 |
| Instance | mii-exa-labor-laborwert-ratio | MII_PR_Labor_Laboruntersuchung | input/fsh/instances/mii-exa-labor-laborwert.fsh:34 |
| Instance | mii-exa-labor-laborwert-range | MII_PR_Labor_Laboruntersuchung | input/fsh/instances/mii-exa-labor-laborwert.fsh:58 |
| Invariant | mii-lab-1 |  | input/fsh/invariants/mii-lab-1.fsh:1 |
| Invariant | mii-lab-2 |  | input/fsh/invariants/mii-lab-2.fsh:1 |
| Logical | MII_LM_Labor |  | input/fsh/logicals/MII_LM_Labor.fsh:1 |
| Mapping | Labor-LogicalModel |  | input/fsh/logicals/MII_LM_Labor.fsh:68 |
| Profile | MII_PR_Labor_Laboranforderung |  | input/fsh/profiles/MII_PR_Labor_Laboranforderung.fsh:1 |
| Profile | MII_PR_Labor_Laborbefund |  | input/fsh/profiles/MII_PR_Labor_Laborbefund.fsh:1 |
| Profile | MII_PR_Labor_Laboruntersuchung |  | input/fsh/profiles/MII_PR_Labor_Laboruntersuchung.fsh:1 |
| RuleSet | LicenseCodeableCCBY40 |  | input/fsh/rulesets/license-term.fsh:3 |
| RuleSet | LicenseCodeableCCBY40Instance |  | input/fsh/rulesets/license-term.fsh:7 |
| RuleSet | MetaProfile |  | input/fsh/rulesets/meta-profile.fsh:1 |
| RuleSet | Publisher |  | input/fsh/rulesets/publisher.fsh:1 |
| RuleSet | SP_Publisher |  | input/fsh/rulesets/publisher.fsh:6 |
| RuleSet | TestDataLabel |  | input/fsh/rulesets/test-data-label.fsh:3 |
| RuleSet | Translation |  | input/fsh/rulesets/translation.fsh:1 |
| RuleSet | Version |  | input/fsh/rulesets/version.fsh:2 |
| RuleSet | PR_CS_VS_Version |  | input/fsh/rulesets/version.fsh:5 |
| ValueSet | MII_VS_Labor_Identifier_Type_Codes |  | input/fsh/valuesets/MII_VS_Labor_IdentifierTypes.fsh:1 |
| ValueSet | MII_VS_Labor_InterpretationsbeeinflussendeEigenschaft_SNOMEDCT |  | input/fsh/valuesets/MII_VS_Labor_InterpretationsbeeinflussendeProbeneigenschaften.fsh:1 |
| ValueSet | MII_VS_Labor_Laborbereich |  | input/fsh/valuesets/MII_VS_Labor_Laborbereich.fsh:1 |
| ValueSet | MII_VS_Labor_Laborergebnis_Qualitativ |  | input/fsh/valuesets/MII_VS_Labor_Laborergebnis_Qualitativ.fsh:1 |
| ValueSet | MII_VS_Labor_Laborergbenis_Semiquantitativ |  | input/fsh/valuesets/MII_VS_Labor_Laborergebnis_Semiquantitativ.fsh:1 |
| ValueSet | MII_VS_Labor_Order_Codes |  | input/fsh/valuesets/MII_VS_Labor_Order_Codes.fsh:1 |
| ValueSet | MII_VS_Labor_Quelle_Klinisches_Bezugsdatum |  | input/fsh/valuesets/MII_VS_Labor_Quelle_Klinisches_Bezugsdatum.fsh:1 |

</div>

## Narrative-Seiten (37 Inhalt / 42 gesamt)

_Die Erklärseiten des IG mit Umfang und der Angabe, ob es sich um Inhalts- oder reine Platzhalterseiten handelt._

<div align="center">

| Datei | Wörter | Format | Stub? |
|---|---|---|---|
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/BeschreibungModul.page.md | 1435 | source |  |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/BeschreibungModul.page.md | 1434 | source |  |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/ReleaseNotes.page.md | 588 | source |  |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md | 522 | source |  |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md | 522 | source |  |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/Terminologien.page.md | 514 | source |  |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/Terminologien.page.md | 499 | source |  |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/Extensions.page.md | 492 | source |  |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/AnwendungsflleInformationsmodell/Datenstzeinkl.Beschreibungen.page.md | 482 | source |  |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/AnwendungsflleInformationsmodell/Datenstzeinkl.Beschreibungen.page.md | 482 | source |  |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/Index.page.md | 394 | source |  |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/Index.page.md | 393 | source |  |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md | 363 | source |  |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md | 363 | source |  |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md | 288 | source |  |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md | 288 | source |  |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/ReleaseNotes.page.md | 236 | source |  |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/KontextimGesamtprojektBezgezuanderenModulen.page.md | 164 | source |  |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/KontextimGesamtprojektBezgezuanderenModulen.page.md | 164 | source |  |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Index.page.md | 121 | source |  |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Index.page.md | 121 | source |  |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Specimen.page.md | 109 | source |  |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Specimen.page.md | 109 | source |  |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/AnwendungsflleInformationsmodell/BeschreibungvonSzenarienfrdieAnwendungderModule.page.md | 95 | source |  |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/AnwendungsflleInformationsmodell/BeschreibungvonSzenarienfrdieAnwendungderModule.page.md | 95 | source |  |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/Referenzen.page.md | 93 | source |  |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/Referenzen.page.md | 93 | source |  |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/AnwendungsflleInformationsmodell/UML.page.md | 92 | source |  |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/AnwendungsflleInformationsmodell/UML.page.md | 92 | source |  |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/FQL-Beschreibung.page.md | 45 | source |  |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/FQL-Beschreibung.page.md | 45 | source |  |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/FQL-Capability-Search.page.md | 25 | source |  |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/FQL-Capability-Search.page.md | 25 | source |  |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/FQL-Capability-Operations.page.md | 23 | source |  |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/FQL-Capability-REST.page.md | 23 | source |  |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/FQL-Capability-Operations.page.md | 23 | source |  |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/FQL-Capability-REST.page.md | 23 | source |  |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/Conformance.page.md | 15 | source | ja |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/AnwendungsflleInformationsmodell/Index.page.md | 14 | source | ja |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/AnwendungsflleInformationsmodell/Index.page.md | 14 | source | ja |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/Index.page.md | 13 | source | ja |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/Index.page.md | 13 | source | ja |

</div>

> Format = **source**: Pflichtseiten existieren im Quell-Guide und werden bei der Migration ins Zielformat überführt; „fehlende Zielseiten" wird hier daher nicht als Lücke gewertet.

## Direktiven-Fundstellen

_Jede gefundene Direktive mit genauer Fundstelle und Originaltext zur weiteren Bearbeitung._

<div align="center">

| Fundstelle | Direktive | Text (gekürzt) |
|---|---|---|
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/AnwendungsflleInformationsmodell/Datenstzeinkl.Beschreibungen.page.md:8 | tree | {{tree:fsh-generated/resources/StructureDefinition-mii-lm-labor.json}} |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/AnwendungsflleInformationsmodell/UML.page.md:9 | render | {{render:implementation-guides/ImplementationGuide-Common/images/UML_Laborbefund |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/BeschreibungModul.page.md:6 | render | {{render:implementation-guides/ImplementationGuide-Common/images/Modul_Laborbefu |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/BeschreibungModul.page.md:12 | render | [{{render:implementation-guides/ImplementationGuide-Common/images/ART-DECOR_Labo |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/BeschreibungModul.page.md:18 | pagelink | Für eine tabellarische Übersicht samt Zuordnung zu den entsprechenden FHIR-Items |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/BeschreibungModul.page.md:79 | render | [{{render:implementation-guides/ImplementationGuide-Common/images/ART-DECOR_Labo |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/BeschreibungModul.page.md:83 | render | [{{render:implementation-guides/ImplementationGuide-Common/images/ART-DECOR_Labo |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/BeschreibungModul.page.md:95 | render | [{{render:implementation-guides/ImplementationGuide-Common/images/ART-DECOR_Prob |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/Index.page.md:8 | render | \| {{render:implementation-guides/ImplementationGuide-Common/images/Warning.jpg}} |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/Index.page.md:22 | index-root | {{index:root}} |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/ReleaseNotes.page.md:1 | page-title | ## {{page-title}} |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:7 | link | ## {{link}} |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:13 | fql-tag | <fql output="table" headers="true"> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:24 | tabs | <tabs> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:25 | tree | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:25 | tabs | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:26 | tabs | <tab title="Beschreibung">{{page:FQL-Beschreibung}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:27 | xml | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:27 | tabs | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:28 | json | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:28 | tabs | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:29 | link | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:29 | tabs | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:30 | tabs | </tabs> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:35 | fql-tag | <fql headers="true"> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:41 | tabs | <tabs> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:42 | tabs | <tab title="Interaktionen"> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:44 | tabs | </tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:45 | tabs | <tab title="Suchparameter"> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:47 | tabs | </tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:48 | tabs | <tab title="Operationen"> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:50 | tabs | </tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:51 | tabs | <tab title="Link"> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:53 | link | {{link:https://www.medizininformatik-initiative.de/fhir/core/modul-labor/Capabil |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:54 | tabs | </tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:55 | tabs | </tabs> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:91 | json | {{json:mii-exa-labor-laborbefund}} |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/FQL-Beschreibung.page.md:4 | fql-tag | <fql output="inline" headers="false"> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/FQL-Beschreibung.page.md:14 | fql-tag | <fql output = "table" headers="true"> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/FQL-Capability-Operations.page.md:4 | fql-tag | <fql> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/FQL-Capability-REST.page.md:4 | fql-tag | <fql> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/FQL-Capability-Search.page.md:4 | fql-tag | <fql> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Index.page.md:12 | render | \| {{render:implementation-guides/ImplementationGuide-Common/images/Warning.jpg}} |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:7 | link | ## {{link}} |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:13 | fql-tag | <fql output="table" headers="true"> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:24 | tabs | <tabs> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:25 | tree | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:25 | tabs | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:26 | tabs | <tab title="Beschreibung">{{page:FQL-Beschreibung}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:27 | xml | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:27 | tabs | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:28 | json | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:28 | tabs | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:29 | link | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:29 | tabs | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:30 | tabs | </tabs> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:35 | fql-tag | <fql headers="true"> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:41 | tabs | <tabs> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:42 | tabs | <tab title="Interaktionen"> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:44 | tabs | </tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:45 | tabs | <tab title="Suchparameter"> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:47 | tabs | </tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:48 | tabs | <tab title="Operationen"> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:50 | tabs | </tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:51 | tabs | <tab title="Link"> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:53 | link | {{link:https://www.medizininformatik-initiative.de/fhir/core/modul-labor/Capabil |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:54 | tabs | </tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:55 | tabs | </tabs> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:101 | json | {{json:mii-exa-labor-laborwert}} |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:7 | link | ## {{link}} |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:13 | fql-tag | <fql output="table" headers="true"> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:24 | tabs | <tabs> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:25 | tree | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:25 | tabs | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:26 | tabs | <tab title="Beschreibung">{{page:FQL-Beschreibung}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:27 | xml | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:27 | tabs | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:28 | json | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:28 | tabs | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:29 | link | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:29 | tabs | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:30 | tabs | </tabs> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:35 | fql-tag | <fql headers="true"> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:41 | tabs | <tabs> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:42 | tabs | <tab title="Interaktionen"> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:44 | tabs | </tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:45 | tabs | <tab title="Suchparameter"> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:47 | tabs | </tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:48 | tabs | <tab title="Operationen"> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:50 | tabs | </tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:51 | tabs | <tab title="Link"> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:53 | link | {{link:https://www.medizininformatik-initiative.de/fhir/core/modul-labor/Capabil |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:54 | tabs | </tab> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:55 | tabs | </tabs> |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:88 | json | {{json:fsh-generated/resources/ServiceRequest-mii-exa-labor-laboranforderung.jso |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/Terminologien.page.md:45 | render | {{render:https://www.medizininformatik-initiative.de/fhir/core/modul-labor/Value |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/Terminologien.page.md:51 | render | {{render:https://www.medizininformatik-initiative.de/fhir/core/modul-labor/Value |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/Terminologien.page.md:57 | render | {{render:https://www.medizininformatik-initiative.de/fhir/core/modul-labor/Value |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/Terminologien.page.md:63 | render | {{render:https://www.medizininformatik-initiative.de/fhir/core/modul-labor/Value |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/AnwendungsflleInformationsmodell/Datenstzeinkl.Beschreibungen.page.md:8 | tree | {{tree:fsh-generated/resources/StructureDefinition-mii-lm-labor.json}} |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/AnwendungsflleInformationsmodell/UML.page.md:9 | render | {{render:implementation-guides/ImplementationGuide-Common/images/UML_Laborbefund |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/BeschreibungModul.page.md:10 | render | [{{render:implementation-guides/ImplementationGuide-Common/images/ART-DECOR_Labo |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/BeschreibungModul.page.md:16 | pagelink | Für eine tabellarische Übersicht samt Zuordnung zu den entsprechenden FHIR-Items |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/BeschreibungModul.page.md:77 | render | [{{render:implementation-guides/ImplementationGuide-Common/images/ART-DECOR_Labo |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/BeschreibungModul.page.md:81 | render | [{{render:implementation-guides/ImplementationGuide-Common/images/ART-DECOR_Labo |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/BeschreibungModul.page.md:93 | render | [{{render:implementation-guides/ImplementationGuide-Common/images/ART-DECOR_Prob |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/Index.page.md:8 | render | \| {{render:implementation-guides/ImplementationGuide-Common/images/Warning.jpg}} |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/Index.page.md:22 | index-root | {{index:root}} |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/ReleaseNotes.page.md:1 | page-title | ## {{page-title}} |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/Extensions.page.md:27 | tree | {{tree:https://www.medizininformatik-initiative.de/fhir/core/modul-labor/Structu |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/Extensions.page.md:31 | render | {{render:https://www.medizininformatik-initiative.de/fhir/core/modul-labor/Value |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/Extensions.page.md:55 | tree | {{tree:https://www.medizininformatik-initiative.de/fhir/core/modul-labor/Structu |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/Extensions.page.md:59 | render | {{render:https://www.medizininformatik-initiative.de/fhir/core/modul-labor/Value |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:7 | link | ## {{link}} |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:13 | fql-tag | <fql output="table" headers="true"> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:24 | tabs | <tabs> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:25 | tree | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:25 | tabs | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:26 | tabs | <tab title="Beschreibung">{{page:FQL-Beschreibung}}</tab> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:27 | xml | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:27 | tabs | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:28 | json | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:28 | tabs | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:29 | link | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:29 | tabs | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:30 | tabs | </tabs> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:35 | fql-tag | <fql headers="true"> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:41 | tabs | <tabs> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:42 | tabs | <tab title="Interaktionen"> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:44 | tabs | </tab> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:45 | tabs | <tab title="Suchparameter"> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:47 | tabs | </tab> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:48 | tabs | <tab title="Operationen"> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:50 | tabs | </tab> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:51 | tabs | <tab title="Link"> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:53 | link | {{link:https://www.medizininformatik-initiative.de/fhir/core/modul-labor/Capabil |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:54 | tabs | </tab> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:55 | tabs | </tabs> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:91 | json | {{json:mii-exa-labor-laborbefund}} |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/FQL-Beschreibung.page.md:4 | fql-tag | <fql output="inline" headers="false"> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/FQL-Beschreibung.page.md:14 | fql-tag | <fql output = "table" headers="true"> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/FQL-Capability-Operations.page.md:4 | fql-tag | <fql> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/FQL-Capability-REST.page.md:4 | fql-tag | <fql> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/FQL-Capability-Search.page.md:4 | fql-tag | <fql> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Index.page.md:12 | render | \| {{render:implementation-guides/ImplementationGuide-Common/images/Warning.jpg}} |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:7 | link | ## {{link}} |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:13 | fql-tag | <fql output="table" headers="true"> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:24 | tabs | <tabs> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:25 | tree | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:25 | tabs | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:26 | tabs | <tab title="Beschreibung">{{page:FQL-Beschreibung}}</tab> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:27 | xml | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:27 | tabs | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:28 | json | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:28 | tabs | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:29 | link | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:29 | tabs | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:30 | tabs | </tabs> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:35 | fql-tag | <fql headers="true"> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:41 | tabs | <tabs> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:42 | tabs | <tab title="Interaktionen"> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:44 | tabs | </tab> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:45 | tabs | <tab title="Suchparameter"> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:47 | tabs | </tab> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:48 | tabs | <tab title="Operationen"> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:50 | tabs | </tab> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:51 | tabs | <tab title="Link"> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:53 | link | {{link:https://www.medizininformatik-initiative.de/fhir/core/modul-labor/Capabil |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:54 | tabs | </tab> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:55 | tabs | </tabs> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:101 | json | {{json:mii-exa-labor-laborwert}} |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:7 | link | ## {{link}} |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:13 | fql-tag | <fql output="table" headers="true"> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:24 | tabs | <tabs> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:25 | tree | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:25 | tabs | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:26 | tabs | <tab title="Beschreibung">{{page:FQL-Beschreibung}}</tab> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:27 | xml | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:27 | tabs | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:28 | json | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:28 | tabs | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:29 | link | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:29 | tabs | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:30 | tabs | </tabs> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:35 | fql-tag | <fql headers="true"> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:41 | tabs | <tabs> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:42 | tabs | <tab title="Interaktionen"> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:44 | tabs | </tab> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:45 | tabs | <tab title="Suchparameter"> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:47 | tabs | </tab> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:48 | tabs | <tab title="Operationen"> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:50 | tabs | </tab> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:51 | tabs | <tab title="Link"> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:53 | link | {{link:https://www.medizininformatik-initiative.de/fhir/core/modul-labor/Capabil |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:54 | tabs | </tab> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:55 | tabs | </tabs> |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:88 | json | {{json:fsh-generated/resources/ServiceRequest-mii-exa-labor-laboranforderung.jso |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/Terminologien.page.md:49 | render | {{render:https://www.medizininformatik-initiative.de/fhir/core/modul-labor/Value |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/Terminologien.page.md:55 | render | {{render:https://www.medizininformatik-initiative.de/fhir/core/modul-labor/Value |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/Terminologien.page.md:61 | render | {{render:https://www.medizininformatik-initiative.de/fhir/core/modul-labor/Value |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/Terminologien.page.md:67 | render | {{render:https://www.medizininformatik-initiative.de/fhir/core/modul-labor/Value |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:43 | UNBEKANNT | {{page:FQL-Capability-REST}} |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:46 | UNBEKANNT | {{page:FQL-Capability-Search}} |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:49 | UNBEKANNT | {{page:FQL-Capability-Operations}} |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:43 | UNBEKANNT | {{page:FQL-Capability-REST}} |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:46 | UNBEKANNT | {{page:FQL-Capability-Search}} |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:49 | UNBEKANNT | {{page:FQL-Capability-Operations}} |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:43 | UNBEKANNT | {{page:FQL-Capability-REST}} |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:46 | UNBEKANNT | {{page:FQL-Capability-Search}} |
| implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:49 | UNBEKANNT | {{page:FQL-Capability-Operations}} |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:43 | UNBEKANNT | {{page:FQL-Capability-REST}} |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:46 | UNBEKANNT | {{page:FQL-Capability-Search}} |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md:49 | UNBEKANNT | {{page:FQL-Capability-Operations}} |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:43 | UNBEKANNT | {{page:FQL-Capability-REST}} |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:46 | UNBEKANNT | {{page:FQL-Capability-Search}} |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md:49 | UNBEKANNT | {{page:FQL-Capability-Operations}} |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:43 | UNBEKANNT | {{page:FQL-Capability-REST}} |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:46 | UNBEKANNT | {{page:FQL-Capability-Search}} |
| implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md:49 | UNBEKANNT | {{page:FQL-Capability-Operations}} |

</div>

## QC-Regeln (definiert; Quelle: qc/custom.rules.yaml)

_Die im Projekt hinterlegten Qualitätsregeln; ihre Einhaltung wird erst beim Qualitätslauf des Builds geprüft._

<div align="center">

| Name | Aktion | Prüfzweck (status) |
|---|---|---|
| parse-fhir-resources | parse | Checking if all FHIR Resource files can be parsed |
| resource-validation | validate | Validating resources against the FHIR standard and their profiles |
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
- FSH-Translation-Extensions: ja

## Dopplungen & ungenutzte Dateien

_Konkrete Fundstellen doppelter Inhaltsblöcke sowie Listen nicht referenzierter Bilder und nicht eingebundener Beispiele._

<div align="center">

| Doppelter Inhaltsblock (gekürzt) | IG-Ordner | Vorkommen |
|---|---|---|
| from structuredefinition where url = %canonical select canonical: url, status: status, ver | ⚠ ImplementationGuide-2025.x-DE / ImplementationGuide-2026.x-DE | implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md · implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md · implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md · implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md · implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md · implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md |
| constraints/invarianten from structuredefinition where url = %canonical for differential.e | ⚠ ImplementationGuide-2025.x-DE / ImplementationGuide-2026.x-DE | implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md · implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md · implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md · implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md · implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md · implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md |
| laboruntersuchungen spielen bei einem großteil aller medizinischen diagnosen eine entschei | ⚠ ImplementationGuide-2025.x-DE / ImplementationGuide-2026.x-DE | implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/AnwendungsflleInformationsmodell/BeschreibungvonSzenarienfrdieAnwendungderModule.page.md · implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/AnwendungsflleInformationsmodell/BeschreibungvonSzenarienfrdieAnwendungderModule.page.md |
| die offizielle und abgenommene version des informationsmodells für das modul person findet | ⚠ ImplementationGuide-2025.x-DE / ImplementationGuide-2026.x-DE | implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/AnwendungsflleInformationsmodell/Datenstzeinkl.Beschreibungen.page.md · implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/AnwendungsflleInformationsmodell/Datenstzeinkl.Beschreibungen.page.md |
| es ist zu beachten, dass das logical model rein auf die abbildung der datenelemente und de | ⚠ ImplementationGuide-2025.x-DE / ImplementationGuide-2026.x-DE | implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/AnwendungsflleInformationsmodell/Datenstzeinkl.Beschreibungen.page.md · implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/AnwendungsflleInformationsmodell/Datenstzeinkl.Beschreibungen.page.md |
| logischer datensatz beschreibung laborbefund.identifikation identifikator des laborbefunds | ⚠ ImplementationGuide-2025.x-DE / ImplementationGuide-2026.x-DE | implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/AnwendungsflleInformationsmodell/Datenstzeinkl.Beschreibungen.page.md · implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/AnwendungsflleInformationsmodell/Datenstzeinkl.Beschreibungen.page.md |
| logischer datensatz beschreibung probenmaterial.identifikation id der probe probenmaterial | ⚠ ImplementationGuide-2025.x-DE / ImplementationGuide-2026.x-DE | implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/AnwendungsflleInformationsmodell/Datenstzeinkl.Beschreibungen.page.md · implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/AnwendungsflleInformationsmodell/Datenstzeinkl.Beschreibungen.page.md |
| logischer datensatz beschreibung laboruntersuchung.code code des laborparameters (loinc) l | ⚠ ImplementationGuide-2025.x-DE / ImplementationGuide-2026.x-DE | implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/AnwendungsflleInformationsmodell/Datenstzeinkl.Beschreibungen.page.md · implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/AnwendungsflleInformationsmodell/Datenstzeinkl.Beschreibungen.page.md |
| logischer datensatz beschreibung laboranforderung.identifikation identifikator der laboran | ⚠ ImplementationGuide-2025.x-DE / ImplementationGuide-2026.x-DE | implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/AnwendungsflleInformationsmodell/Datenstzeinkl.Beschreibungen.page.md · implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/AnwendungsflleInformationsmodell/Datenstzeinkl.Beschreibungen.page.md |
| als abstraktere version eines informationsmodells und zur besseren verdeutlichung von bezi | ⚠ ImplementationGuide-2025.x-DE / ImplementationGuide-2026.x-DE | implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/AnwendungsflleInformationsmodell/UML.page.md · implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/AnwendungsflleInformationsmodell/UML.page.md |
| laboruntersuchungen spielen bei einem großteil aller medizinischen diagnosen eine entschei | ⚠ ImplementationGuide-2025.x-DE / ImplementationGuide-2026.x-DE | implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/BeschreibungModul.page.md · implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/BeschreibungModul.page.md |
| [ ](https://art decor.org/art decor/decor datasets mide ?id=2.16.840.1.113883.3.1937.777.2 | ⚠ ImplementationGuide-2025.x-DE / ImplementationGuide-2026.x-DE | implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/BeschreibungModul.page.md · implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/BeschreibungModul.page.md |
| laborbefunde sind als dokumente zusammengefasste in einem medizinischen labor durchgeführt | ⚠ ImplementationGuide-2025.x-DE / ImplementationGuide-2026.x-DE | implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/BeschreibungModul.page.md · implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/BeschreibungModul.page.md |
| für eine tabellarische übersicht samt zuordnung zu den entsprechenden fhir items siehe inn | ⚠ ImplementationGuide-2025.x-DE / ImplementationGuide-2026.x-DE | implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/BeschreibungModul.page.md · implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/BeschreibungModul.page.md |
| im verlauf einer laboranalyse, von der abnahme der probe bis zur übermittlung des befundes | ⚠ ImplementationGuide-2025.x-DE / ImplementationGuide-2026.x-DE | implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/BeschreibungModul.page.md · implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/BeschreibungModul.page.md |

</div>

> ⚠ 73 Inhaltsblock/-blöcke kommen **ordnerübergreifend** (in mehreren IG-Ordnern) vor — Kandidat für Konsolidierung bzw. ausgelagerte Übersetzung.

**Identische Seiten:** `implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/AnwendungsflleInformationsmodell/BeschreibungvonSzenarienfrdieAnwendungderModule.page.md` = `implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/AnwendungsflleInformationsmodell/BeschreibungvonSzenarienfrdieAnwendungderModule.page.md`; `implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/AnwendungsflleInformationsmodell/Datenstzeinkl.Beschreibungen.page.md` = `implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/AnwendungsflleInformationsmodell/Datenstzeinkl.Beschreibungen.page.md`; `implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/AnwendungsflleInformationsmodell/Index.page.md` = `implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/AnwendungsflleInformationsmodell/Index.page.md`; `implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/AnwendungsflleInformationsmodell/UML.page.md` = `implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/AnwendungsflleInformationsmodell/UML.page.md`; `implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/BeschreibungModul.page.md` = `implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/BeschreibungModul.page.md`; `implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/KontextimGesamtprojektBezgezuanderenModulen.page.md` = `implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/KontextimGesamtprojektBezgezuanderenModulen.page.md`; `implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/Referenzen.page.md` = `implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/Referenzen.page.md`; `implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md` = `implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/DiagnosticReport.page.md`; `implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/FQL-Beschreibung.page.md` = `implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/FQL-Beschreibung.page.md`; `implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/FQL-Capability-Operations.page.md` = `implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/FQL-Capability-Operations.page.md`; `implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/FQL-Capability-REST.page.md` = `implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/FQL-Capability-REST.page.md`; `implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/FQL-Capability-Search.page.md` = `implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/FQL-Capability-Search.page.md`; `implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Index.page.md` = `implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Index.page.md`; `implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md` = `implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Observation.page.md`; `implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md` = `implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/ServiceRequest.page.md`; `implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Specimen.page.md` = `implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/FHIR-Profile/Specimen.page.md`; `implementation-guides/ImplementationGuide-2025.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/Index.page.md` = `implementation-guides/ImplementationGuide-2026.x-DE/MIIIGModulLaborbefund/TechnischeImplementierung/Index.page.md`

**Beispiele nicht in Narrativen eingebunden (3):** `mii-exa-labor-laborwert-data-absent-reason`, `mii-exa-labor-laborwert-ratio`, `mii-exa-labor-laborwert-range`

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
