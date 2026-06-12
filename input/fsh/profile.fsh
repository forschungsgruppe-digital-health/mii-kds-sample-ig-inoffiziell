Profile: MII_PR_Beispiel_Patient
Parent: Patient
Id: mii-pr-beispiel-patient
Title: "MII PR Beispiel Patient"
Description: "Beispielprofil des MII-KDS-Sample-Moduls. In produktiven Modulen sollte das Profil von einem Profil aus de.basisprofil.r4 (z. B. ProfilePatient) abgeleitet werden."
* ^status = #draft
* extension contains MII_EX_Beispiel_Zusatzinfo named zusatzinfo 0..1 MS
* name 1..* MS
* name.family 1..1 MS
* birthDate 1..1 MS

// Translation-Extension (MII-Konvention): deutsche title/description führen die
// englische Entsprechung mit; der EN-IG zeigt den Extension-Inhalt an.
* ^title.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^title.extension[=].extension[+].url = "lang"
* ^title.extension[=].extension[=].valueCode = #en
* ^title.extension[=].extension[+].url = "content"
* ^title.extension[=].extension[=].valueString = "MII PR Sample Patient"
* ^description.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^description.extension[=].extension[+].url = "lang"
* ^description.extension[=].extension[=].valueCode = #en
* ^description.extension[=].extension[+].url = "content"
* ^description.extension[=].extension[=].valueString = "Sample profile of the MII CDS sample module. In productive modules, derive the profile from a de.basisprofil.r4 profile (e.g. ProfilePatient)."
