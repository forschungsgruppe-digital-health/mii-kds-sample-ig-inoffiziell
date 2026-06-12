### Bezüge zu anderen Modulen / Kontext im Gesamtprojekt

*Relevant für: Informationsmodell (Modellierung), Technische Umsetzung (FHIR) — Lesepfade siehe `ROLES.md` (im Repository).*

Darstellung der Abhängigkeiten und Abgrenzungen zu anderen KDS-Modulen sowie zu
nationalen/internationalen Spezifikationen. *(Pflichtabschnitt aus dem
Manteldokument; im konsolidierten Basis-IG ohne dediziertes Pendant.)*

- **Abhängigkeit:** `de.basisprofil.r4` (HL7 Deutschland Basisprofile).
- **Abgrenzung:** keine Überschneidung mit Modul X in Bezug auf Element Y.
- **Optionaler EU-Bezug:** Ausrichtung an `hl7.fhir.eu.base` / IPS / EHDS.

### Europäisches Schichtenmodell (optional, Entscheidung offen)

HL7 Europe empfiehlt ein Schichtenmodell. Bei gewünschtem EU-/EHDS-Anschluss baut
das Modul wie folgt auf:

```
IPS (hl7.fhir.uv.ips)
        ▼
HL7 Europe Base/Core (hl7.fhir.eu.base)
        ▼
MII-KDS-Modul (dieses IG)
```

Die entsprechenden Dependencies sind in `sushi-config.yaml` als optionale,
auskommentierte Einträge vorbereitet und vor Aktivierung in der TF KDS zu
entscheiden. Model-to-Profile-Mapping-Tabellen (siehe Datensätze) unterstützen die
Ausrichtung an IPS/EHDS.
