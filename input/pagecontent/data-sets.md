### Datensätze und Beschreibungen

*Relevant für: Fachvertretung (inhaltlich), Informationsmodell (Modellierung), Technische Umsetzung (FHIR) — Lesepfade siehe [ROLES.md](../../ROLES.md).*

Tabellarische Beschreibung der fachlichen Datenelemente des Moduls. Das formale
Informationsmodell ist als [Logical Model](StructureDefinition-mii-lm-beispiel-modell.html)
hinterlegt.

| Datenelement | Kardinalität | Beschreibung |
|--------------|--------------|--------------|
| identifier   | 0..1         | Geschäftsidentifikator des Datensatzes |
| status       | 1..1         | Status des Datensatzes |
| recordedDate | 0..1         | Dokumentationszeitpunkt |
| note         | 0..*         | Freitextliche Anmerkung |

### Model-to-Profile-Mapping

Gemäß HL7-Europe-Best-Practice wird die Rückverfolgbarkeit vom Informationsmodell
zu den FHIR-Profilen über eine Mapping-Tabelle hergestellt.

| Logical-Model-Element | FHIR-Profil / -Element | Anmerkung |
|-----------------------|------------------------|-----------|
| MIIBeispielModell.identifier | mii-pr-beispiel-patient.identifier | optional |
| MIIBeispielModell.status     | (Beispiel) Coding aus mii-vs-beispiel-status | Must Support |
| MIIBeispielModell.recordedDate | (Beispiel) – modulspezifisch zuzuordnen | TODO:REVIEW |
| MIIBeispielModell.note       | mii-pr-beispiel-patient.extension[zusatzinfo] | optional |
