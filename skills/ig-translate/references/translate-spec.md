# ig-translate — Mechanik, Datei-Konventionen, Formate

Stand 2026; empirisch verifiziert mit IG Publisher 2.2.7/2.2.8 + `fhir2.base.template`.
Maßgeblich für die Tool-Logik ist `tools/ig-translate.sh`.

## 1. Ressourcen-Texte (rendert heute)

**Unterstützte Ressourcentypen** (Publisher-Konstante
`TRANSLATION_SUPPLEMENT_RESOURCE_TYPES`): **StructureDefinition, CodeSystem,
Questionnaire**. Nicht unterstützt: ValueSet, ImplementationGuide, CapabilityStatement.

**Ablage & Benennung:** ein Translation-Supplement je Ressource unter dem
Übersetzungsquellen-Ordner (`translation-sources: input/translations/<lang>`):

```
input/translations/en/<ResourceType>-<id>.<ext>     # ext ∈ {po, xliff, json}
```

Beispiele (Modul Dokument):
- `input/translations/en/StructureDefinition-mii-pr-dokument-dokument.po`
- `input/translations/en/StructureDefinition-mii-ex-dokument-nlp-processing-status.po`
- `input/translations/en/StructureDefinition-mii-lm-dokument.po`  (Logical Model = StructureDefinition)
- `input/translations/en/CodeSystem-mii-cs-dokument-nlp-processing-status.po`

> Falscher Name (z. B. `ImplementationGuide-…po`, `menu.po` oder beliebige
> Nicht-`{type}-{id}`-Namen) wird vom Publisher **ignoriert** (Log:
> „name is not {type}-{id}.xxx" / „resource type … is not supported").

**`.po`-Format** (bevorzugt; case-insensitives Matching, Pluralformen):

```po
#: StructureDefinition.description
msgid "<exakter deutscher Quelltext aus der generierten Ressource>"
msgstr "<englische Übersetzung>"
```

`msgid` MUSS exakt dem deutschen Quelltext der generierten Ressource entsprechen
(aus `fsh-generated/resources/<Typ>-<id>.json`). Übersetzbare Felder u. a.:
`description`, Element-`definition`/`comment`/`requirements`, Binding-Beschreibungen,
CodeSystem-`concept.display`/`definition`/`designation`.

## 2. ValueSet / IG-Titel / Menü (rendert NICHT)
Kein Supplement-Mechanismus im aktuellen Publisher. Bewusst auslassen; nicht durch
falsch benannte `.po` „simulieren" (würden nur ignoriert). Bei künftigem
Publisher-Support hier ergänzen.

## 3. Narrative-Seiten (zukunftssicher, rendert noch nicht)

**Konvention** (HL7 ig-guidance, „depends on template / ToDo"): je Quellseite eine
Sprachvariante als Geschwisterdatei:

```
input/pagecontent/<name>.md        # deutsch (führend)
input/pagecontent/<name>-en.md     # englische Übersetzung (zukunftssicher)
```

Inhaltliche Regeln:
- Struktur/Überschriften/Links 1:1 übernehmen; interne Artefakt-Links
  (`StructureDefinition-…html` usw.) **unverändert** lassen.
- FHIR-Bezeichner, Code-Werte, kanonische URLs nicht übersetzen.
- Eingebettete HTML/Bild-Verweise unverändert.
- Kopfzeile `TODO:REVIEW` bei maschineller Übersetzung.

> Verhalten heute: Der Publisher liest `*-en.md` (noch) nicht ein; `/en/`-Seiten
> bleiben deutsch + Standardhinweis. Die Dateien sind vorbereitet und rendern
> automatisch, sobald Publisher/Template die Seiten-Übersetzung aktivieren.

## 4. Konfigurationsparameter (`sushi-config.yaml`)
```yaml
parameters:
  i18n-default-lang: de          # führende Sprache
  i18n-lang:
    - en                         # zusätzliche Sprachausgabe(n)
  translation-sources:
    - input/translations/en      # Ordner der Supplements
```

## 5. Guardrails (Zusammenfassung)
Deutsch führend · Quelltext additiv ergänzen, nie ändern · FHIR-Bezeichner
englisch belassen · keine Erfindung, `TODO:REVIEW` · Review-Gate C verpflichtend ·
nur auf Bestätigung, Dry-Run-Default.
