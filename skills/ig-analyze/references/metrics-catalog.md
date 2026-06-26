# ig-analyze — Metrik-Katalog (erweiterbare SSOT)

Parameter für die IG-Statistik. **Nutzen:** V = objektiver Vergleich · A = Migrations-
Aufwand/Risiko. **Quelle:** woraus die Metrik gelesen wird. **Modus:** *static*
(ohne Build) oder *build* (braucht IG-Publisher-`qa.json`/`_data`).

> **Per Hand erweiterbar:** Neue Zeile mit eindeutiger `metric_id` ergänzen; wenn
> die Metrik im Tool erhoben werden soll, in `tools/ig-stats.py` ein Feld mit dem
> gleichen `metric_id` befüllen und im JSON-Schema ergänzen. Nicht implementierte
> Metriken bleiben dokumentiert (Roadmap), liefern aber `null`.

## A. Identität & Scope
| metric_id | Misst | Quelle | Modus | Nutzen |
|---|---|---|---|---|
| `id`,`canonical`,`packageId`,`version` | Identität | sushi-config/package.json | static | V |
| `calver` | Version folgt CalVer `YYYY.MINOR.PATCH`? | version-Regex | static | V |
| `status`,`fhirVersion`,`license`,`publisher` | Reifegrad/Recht/Basis | sushi-config | static | V |

## B. Artefakt-Umfang & -Komplexität
| metric_id | Misst | Quelle | Modus | Nutzen |
|---|---|---|---|---|
| `profiles`,`extensions`,`valuesets`,`codesystems`,`logicals`,`capabilitystatements`,`questionnaires`,`searchparameters`,`operations`,`examples`,`mappings`,`invariants`,`rulesets`,`artifacts_total` | Größe/Scope | FSH-Zählung + `fsh-generated/*.json` | static | V·A |
| `diff_elements_avg`/`_max`,`slices`,`must_support`,`constraints` | Profil-Komplexität | `fsh-generated` (Differential/Snapshot) | static* | V·A |
| `extensions_defined_vs_used` | Modellierungstiefe | FSH | static* | V |
| `cardinality_restrictions` | Restriktivität (`0..0`/`1..1`) | FSH | static* | A |

\* in der ersten Tool-Ausbaustufe als Roadmap (`null`), sobald differential-Parsing aktiv.

## C. Terminologie
| metric_id | Misst | Quelle | Modus | Nutzen |
|---|---|---|---|---|
| `local_codesystems`,`local_valuesets` | eigene Terminologie | FSH | static | V·A |
| `external_bindings`,`binding_strengths` | Bindungs-Last & -Stärke (required/extensible/preferred/example) | `fsh-generated` | build/static* | V·A |
| `terminology_systems` | SNOMED/LOINC/ICD/eigene | FSH/Bindings | static* | V·A |
| `unresolvable_valuesets` | nicht auflösbare VS | `qa.json` | build | A |

## D. Abhängigkeiten & Konformität
| metric_id | Misst | Quelle | Modus | Nutzen |
|---|---|---|---|---|
| `dependencies_count`,`deps_pinned`,`deps_floating`,`deps_items` | Abhängigkeiten, **gepinnt vs. floating (`.x`)** | sushi-config | static | V·A |
| `base_profiles` | de.basisprofil/IPS/EU-Schichtung | dependencies | static | V |

## E. Narrative & Doku
| metric_id | Misst | Quelle | Modus | Nutzen |
|---|---|---|---|---|
| `narrative_pages`,`narrative_words`,`images` | Doku-Umfang | `input/pagecontent/**`, `implementation-guides/**`, `input/images` | static | V·A |
| `mandatory_pages_present`/`_missing` | Pflichtabschnitte | Seitenliste vs. Soll-Set | static | V·A |
| `simplifier_directives_total`,`_by_label`,`_unknown` | Simplifier-/FQL-Direktiven (Narrativ-Nacharbeit) | `tools/fql-scan.sh` bzw. eingebaute Muster | static | A |

## F. Mehrsprachigkeit
| metric_id | Misst | Quelle | Modus | Nutzen |
|---|---|---|---|---|
| `i18n_default_lang`,`languages` | Sprachkonfiguration | sushi-config | static | V·A |
| `translation_supplements`,`translated_pages`,`fsh_translation_ext` | Übersetzungs-Abdeckung / Harvest-Potenzial | `input/translations`, `*-<lang>.md`, FSH | static | A |

## G. Qualität & Gesundheit (Build)
| metric_id | Misst | Quelle | Modus | Nutzen |
|---|---|---|---|---|
| `qa_errors`,`qa_warnings`,`qa_hints`,`broken_links` | Build-Gesundheit | `qa.json`/`qa.txt` | build | V·A |
| `qa_categories` | Fehler je Kategorie (Terminologie, Referenz, **id/url-Mismatch**, …) | `qa.json` | build | A |
| `examples_valid_ratio` | Beispiel-Validierungsquote | `qa.json` | build | V·A |
| `qc_rules_defined`,`qc_violations` | formalisierte QC-Regeln (`qc/custom.rules.yaml`) | QC-Lauf (Firely Terminal) | static/build | V·A |
| `suppressed_messages` | unterdrückte Meldungen | `ignoreWarnings.txt`/`advisor.json` | static | A |

## H. Prozess / Tooling / Governance
| metric_id | Misst | Quelle | Modus | Nutzen |
|---|---|---|---|---|
| `build_toolchain`,`ci_workflows`,`devcontainer`,`template_based` | Reife der Toolchain | Repo-Dateien | static | V |
| `fsh_present` | FSH-Quelle vorhanden (sonst GoFSH nötig) | `input/fsh` | static | A |

## I. Migrations-Aufwand & Risiko (Aufwandstreiber, Ziel A)
| metric_id | Misst | Quelle | Modus | Nutzen |
|---|---|---|---|---|
| `driver_gofsh` | GoFSH nötig? (keine FSH) | `fsh_present` | static | A |
| `driver_directives` | # Simplifier-/FQL-Direktiven | E | static | A |
| `driver_pages` | # zu migrierende Narrative-Seiten | E | static | A |
| `driver_idurl_mismatch` | # id/url-Mismatch (`special-url`) | `qa.json` | build | A |
| `driver_floating_pins` | # floating Dependencies | D | static | A |
| `driver_qc_violations` | # QC-/Naming-Verletzungen | G | static/build | A |
| `driver_source_errors` | quell-intrinsische Validierungsfehler | `qa.json` (Diff Quelle↔migriert) | build | A |
| `heterogeneity` | Naming-Varianz, gemischte Sprachen, Strukturabweichung | abgeleitet | static* | A |
| `effort_hours_low/high`,`effort_band` | Aufwands-Spanne + Band S/M/L/XL | Modell (Tool `EFFORT_FACTORS`) | static | A |
