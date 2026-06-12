Logical: MII_LM_Beispiel_Modell
Id: mii-lm-beispiel-modell
Title: "MII LM Beispiel Modell"
Description: "Fachliches Informationsmodell des Beispielmoduls (entspricht dem Abschnitt 'Datensätze / Informationsmodell' des Manteldokuments)."
Characteristics: #can-be-target
* identifier 0..1 Identifier "Geschäftsidentifikator des Datensatzes"
* status 1..1 code "Status des Datensatzes"
* recordedDate 0..1 dateTime "Dokumentationszeitpunkt"
* note 0..* string "Freitextliche Anmerkung"
