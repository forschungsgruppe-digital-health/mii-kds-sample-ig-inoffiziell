---
name: ig-translate
description: >-
  Übersetzt einen deutsch geführten MII-KDS-IG ins Englische und legt die
  Übersetzungen an den vom IG Publisher vorgesehenen Stellen ab — entweder als
  Neu-Übersetzung (LLM, de→en) oder durch Übernahme bereits vorhandener
  Übersetzungen aus der Quelle (paralleles EN-Guide und/oder FSH-Translation-
  Extensions). Deutsch bleibt führend/verbindlich; jede maschinelle Übersetzung
  ist menschlich zu prüfen. Optional, auf Nachfrage/Bestätigung aktivieren.
license: CC-BY-4.0
---

# ig-translate

## Wann aktivieren
Nach einer validierten Migration (Build/QA grün), wenn zusätzlich zur deutschen
eine **englische** Sprachausgabe gewünscht ist. Zwei Modi:
- **translate** — Neu-Übersetzung de→en (LLM), für Module ohne vorhandene EN-Fassung.
- **harvest** — Übernahme bereits vorhandener EN-Texte aus der Quelle (z. B. MII
  KDS Person, das neben der deutschen auch eine englische Fassung publiziert),
  ohne erneutes Übersetzen. Konfiguration: `references/harvest-config.yaml`.

## WICHTIG: Was die aktuelle Toolchain rendert (verifiziert)
Empirisch geprüft mit IG Publisher 2.2.7 **und** 2.2.8 + `fhir2.base.template`:

| Inhalt | Übersetzbar heute? | Mechanismus |
|--------|--------------------|-------------|
| Ressourcen-Texte von **StructureDefinition, CodeSystem, Questionnaire** (Element-`definition`, `description`, Designations) | **Ja, rendert** | Translation-Supplement `input/translations/<lang>/<Typ>-<id>.{po\|xliff\|json}` |
| **ValueSet**, **ImplementationGuide**-Titel/-Beschreibung, **Menü** | **Nein** | Vom Publisher nicht als Supplement unterstützt (ignoriert) |
| **Narrative-Seiten** (`input/pagecontent/*.md`) | **Noch nicht** | Konvention `*-<lang>.md` ist dokumentiert, wird aber vom Publisher/Template noch nicht eingelesen (HL7: „ToDo, depends on template") |

Konsequenz: Der `/en/`-Seitenbaum zeigt Narrative weiterhin auf Deutsch mit dem
Hinweis „There is no translation page available …" — das ist **erwartet**
(deutsch führend). Übersetzte Element-Texte erscheinen jedoch auf den
Artefakt-Seiten unter `/en/`. Die Seiten-Übersetzungen werden trotzdem im
korrekten Schema erzeugt (**zukunftssicher**), damit sie automatisch rendern,
sobald die Toolchain die Funktion implementiert.

## Verbindliche Leitplanken
- **Deutsch bleibt führend/verbindlich.** Englisch ist eine Übersetzungshilfe,
  keine normative Fassung.
- **Quelltext nie ändern.** Übersetzungen werden additiv in `input/translations/`
  bzw. als `*-en.md` abgelegt; deutsche `pagecontent`/FSH bleiben unverändert.
- **FHIR-Bezeichner bleiben englisch** (`name`/`id`/Codes) — nicht „übersetzen".
- **Keine Fakten-Erfindung.** Jede maschinelle Übersetzung mit `TODO:REVIEW`
  markieren; fachliche/zweisprachige Prüfung ist verpflichtend (Review-Gate C der
  `mii-ig-migration`-Spec).
- **Nur auf Bestätigung**; Default ist ein Dry-Run/Plan (`tools/ig-translate.sh`).

## Ablauf — Modus „translate"
1. **Scan:** `tools/ig-translate.sh --scan en` → listet Seiten und unterstützte
   Ressourcen samt Ziel-Dateipfaden.
2. **Ressourcen-Supplements:** je StructureDefinition/CodeSystem/Questionnaire eine
   Datei `input/translations/en/<Typ>-<id>.po` (`msgid` = deutscher Quelltext aus
   der generierten Ressource, `msgstr` = englische Übersetzung). Diese rendern.
3. **Narrative-Seiten:** je `input/pagecontent/<name>.md` eine Übersetzung
   `input/pagecontent/<name>-en.md` (gleiche Struktur/Links; FHIR-Bezeichner
   unverändert). Zukunftssicher abgelegt.
4. **Validieren:** `tools/ig-translate.sh --validate en` (Namens-/Ablage-Konvention).
5. **Build & QA:** `./_genonce.sh`; prüfen, dass `/en/`-Artefaktseiten die
   übersetzten Element-Texte zeigen; `Errors: 0`.
6. **Review-Gate C** (Sprachführung) menschlich abzeichnen.

## Ablauf — Modus „harvest" (vorhandene EN-Fassung übernehmen)
1. `references/harvest-config.yaml` ausfüllen (Quelle der EN-Texte: paralleles
   gerendertes EN-Guide für Narrative, FSH-`translation`-Extensions/`designation`
   für Ressourcen-Texte; Seiten-/Artefakt-Mapping).
2. **Ressourcen:** vorhandene EN-Designations/Translation-Extensions aus der
   Quelle in `input/translations/en/<Typ>-<id>.po` überführen (statt neu zu
   übersetzen).
3. **Narrative:** EN-Seiteninhalte aus dem parallelen EN-Guide nach
   `input/pagecontent/<name>-en.md` übernehmen (Quellpfad je Seite belegen,
   keine Erfindung; Unklarheiten `TODO:REVIEW`).
4. Validieren / Build / Review wie oben.

## Referenzen
- `references/translate-spec.md` — vollständige Mechanik, Datei-Konventionen, Formate.
- `references/harvest-config.yaml` — Konfigurationsschema für vorhandene EN-Quellen.
- `tools/ig-translate.sh` — Scan/Validate (Dry-Run-Default).
- `../mii-ig-migration/references/migration-agent-spec.md` §5 (Mehrsprachigkeit), Review-Gate C.
