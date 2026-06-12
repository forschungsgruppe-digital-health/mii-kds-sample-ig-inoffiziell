<img src="mii-logo-PLATZHALTER.svg" alt="MII (Platzhalter-Logo)" style="height:56px"/>

> **⚠️ INOFFIZIELLE Vorlage / Sample — keine offizielle Veröffentlichung.**
> Dieser Implementierungsleitfaden ist eine technische **Vorlage** und ein
> **Migrationsziel**. Er ist **kein** offiziell freigegebenes oder ballotiertes
> MII-KDS-Modul. Status: `draft` / `ci-build`. Inhalte sind Platzhalter und
> ersetzen kein fachlich vollständiges, gemäß KDS-Governance freigegebenes Modul.

### Beschreibung Modul

Dieser Implementierungsleitfaden ist ein **Sample-IG des MII-Kerndatensatzes** und
dient zugleich als **Vorlage** für neue Module und als **Migrationsziel** für
bestehende, bisher auf Simplifier publizierte Module. Die Struktur folgt dem
MII-KDS-Meta-Manteldokument (jeweils aktuelle Fassung) und den HL7-IG-Best-Practices.

> Deutsch ist die führende und verbindliche Sprache (KDS-Governance). Eine
> englische Übersetzung ist optional und wird über Übersetzungskataloge bereitgestellt.

### Hintergrund und Geltungsbereich (Scope)

Das Beispielmodul demonstriert die verbindlichen Inhaltsbestandteile eines
MII-KDS-Moduls: Informationsmodell, Anwendungsfälle, Konformitätsfestlegungen,
FHIR-Profile, Terminologien und ein CapabilityStatement. Es ist bewusst minimal
gehalten und ersetzt kein fachlich vollständiges Modul.

### Zielgruppen (Intended Audience)

Gemäß HL7-Europe-Best-Practice werden die Zielgruppen explizit benannt:
Forschende, Health Data Provider / Datenintegrationszentren, technische
Implementierende sowie Behörden.

### Inhalt dieses Leitfadens

- [Anwendungsfälle](use-cases.html) — Szenarien der Modulnutzung
- [Datensätze und Beschreibungen](data-sets.html)
- [Informationsmodell (UML)](uml.html)
- [Konformität](conformance.html) — Must Support, fehlende Daten, Such-API
- [Bezüge zu anderen Modulen](context.html)
- [Referenzen](references.html)
- [Artefakte](artifacts.html), [Downloads](downloads.html), [Release Notes](changes.html)

### Ansprechpartner und Autoren

Ansprechpartner: Medizininformatik-Initiative (MII), Taskforce Kerndatensatz.
Autorinnen und Autoren werden alphabetisch nach Familiennamen mit Institution
geführt (hier Platzhalter).

### Urheberrecht und Lizenz

© 2026+ Medizininformatik-Initiative. Veröffentlicht unter CC-BY-4.0.

### Haftungsausschluss

Dieser Leitfaden wird ohne Gewähr bereitgestellt. Verbindlich ist die jeweils
freigegebene Version gemäß KDS-Governance.

### Rollen im Entwicklungsprozess
Die Entwicklung dieses Moduls berücksichtigt vier Perspektiven mit je eigenem
Lesepfad und Verständlichkeitsniveau:
- **Fachvertretung (inhaltlich)** — nicht-technisch: `index`, `use-cases`, `data-sets`.
- **Informationsmodell (Modellierung)** — semi-technisch: `uml`, Logical Model, Mapping in `data-sets`.
- **Technische Umsetzung (FHIR)** — technisch: `input/fsh`, `conformance`, `qc/`, `DESIGN`.
- **DIZ-Pilot (Implementierung)** — implementierend: `conformance`, CapabilityStatement, Downloads, `NOTIFICATIONS`.

Vollständige Zuordnung (Aufgaben, Ein-/Ausgaben, Übergaben, Rollen-zu-Artefakt-Matrix):
siehe **`ROLES.md` (im Repository)**.
