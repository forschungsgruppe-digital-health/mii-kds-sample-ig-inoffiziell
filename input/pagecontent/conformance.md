### Konformität (Technische Implementierung)

*Relevant für: Technische Umsetzung (FHIR), DIZ-Pilot (Implementierung) — Lesepfade siehe [ROLES.md](../../ROLES.md).*

#### Konformitätsverben
Es gelten die FHIR-Konformitätsverben (SHALL/SHOULD/MAY). Verpflichtende Elemente
sind in den Profilen entsprechend gekennzeichnet.

#### Must Support
Die Bedeutung von *Must Support* wird modulspezifisch festgelegt: Ein konformes
System muss als Must Support markierte Elemente verarbeiten und bereitstellen
können, sofern Daten vorliegen.

#### Umgang mit fehlenden Daten
Fehlende Daten werden gemäß den MII-Festlegungen abgebildet (z. B. über
`dataAbsentReason`), nicht durch Weglassen verpflichtender Strukturen.

#### Such-API
Die unterstützten Interaktionen und Suchparameter sind im
[CapabilityStatement](CapabilityStatement-mii-cps-beispiel-server.html)
beschrieben.
