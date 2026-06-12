Instance: mii-cps-beispiel-server
InstanceOf: CapabilityStatement
Usage: #definition
* name = "MII_CPS_Beispiel_Server"
* title = "MII CPS Beispiel Server"
* status = #draft
* date = "2026-01-01"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #json
* format[1] = #xml
* description = "Pflichtinteraktionen eines konformen Servers fuer das Beispielmodul."
* rest.mode = #server
* rest.resource.type = #Patient
* rest.resource.supportedProfile = "https://example.org/fhir/kds-sample/StructureDefinition/mii-pr-beispiel-patient"
* rest.resource.interaction[0].code = #read
* rest.resource.interaction[1].code = #search-type
