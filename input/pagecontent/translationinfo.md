### Hinweise zur Mehrsprachigkeit

*Relevant für: alle Rollen — Lesepfade siehe [ROLES.md](../../ROLES.md).*

Dieser IG wird **deutsch geführt** publiziert (verbindliche Fassung). Eine
**englische Übersetzung** ist optional und wird über gettext-`.po`-Kataloge unter
`input/translations/en` gepflegt. Die Ausgabe erfolgt je Sprache unter `/de/`
bzw. `/en/`. FHIR-Artefakt-Bezeichner bleiben gemäß KDS-Governance englisch.

#### Übersetzung von Conformance-Ressourcen
Gemäß MII-Namenskonvention ist Deutsch die bevorzugte Sprache für `description`,
`name` und `title` von Conformance-Ressourcen. Wird Deutsch verwendet, ist auf diesen
Elementen eine **Translation-Extension**
(`http://hl7.org/fhir/extensions/StructureDefinition-translation.html`) mit der
englischen Entsprechung zu führen; deren Inhalt wird im englischsprachigen IG
angezeigt. Narrative Seiten werden weiterhin über `.po` übersetzt.
