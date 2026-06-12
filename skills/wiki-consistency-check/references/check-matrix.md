# Prüfmatrix: Repo-Artefakt ↔ Wiki-Seite

| Bereich | Repo-Artefakt | Wiki-Seite | Prüfpunkt |
|--------|----------------|-----------|-----------|
| Namenskonvention (Präfixe) | `qc/custom.rules.yaml` (`naming-convention-id`-Regex) | Namenskonventionen für FHIR‐Ressourcen | Enthält der Regex alle Präfixe der Wiki-Liste (PR, EX, LM, VS, CS, CM, SM, NS, SP, CPS, OD, IG, QST, OBSDEF, MSR, EXA)? |
| Namenskonvention (name) | `input/fsh/*.fsh` | Namenskonventionen → Element name | `name` in Upper_Snake_Case mit Präfix? |
| Namenskonvention (id) | `input/fsh/*.fsh` | Namenskonventionen → Element id | `id` kebab-case, ≤64, korrespondiert zu name? |
| Namenskonvention (title) | `input/fsh/*.fsh` | Namenskonventionen → Element title | Muster `MII <Präfix> <ModulAbk> <Beschreibung>`? |
| Namenskonvention (url) | `sushi-config.yaml` canonical | Namenskonventionen → Element url | `<canonical>/<Ressourcentyp>/<id>`-Struktur? Bestandsschutz beachtet? |
| Sprache | `sushi-config.yaml` (`i18n-default-lang`), `input/fsh` | Namenskonventionen → Sprache | Deutsch führend; Translation-Extension auf description/name/title bei dt. Inhalt? |
| Terminologie (SNOMED) | `TERMINOLOGY.md`, `sushi-config.yaml` | Terminology Version Policy | Datierte INTERNATIONAL-Version je CalVer? |
| Terminologie (Instanz) | Profile/Doku | Terminology Version Policy | `Coding.version` für ICD-10-GM/OPS/ATC gefordert? |
| CI (Validation) | `.github/workflows/main.yml` | GitHub Reusable Validation Workflows | Nutzung von `ci_dotnet_validation.yml` + `ci_java_validation.yml`? |
| CI (Dateien) | `qc/custom.rules.yaml`, `advisor.json` | GitHub Reusable Validation Workflows | Beide Dateien vorhanden? Pfade gemäß Struktur? |
| Release | `.github/workflows/main.yml` (RELEASE) | Module Release Workflow | Tag-Format `v[major].[minor].[patch][-suffix]`, Draft-Release? |
| Benachrichtigung | `.github/workflows/main.yml` (NOTIFY_ZULIP), `NOTIFICATIONS.md` | GitHub Reusable Validation Workflows | Zulip „MII-Kerndatensatz > Releases"? |
| Dev Container | `.devcontainer/devcontainer.json` | Dev Container ‐ IG Publisher | MII-Image `cybernop/vscode-ig-publisher`, `.fhir`-Mount? |
| Ordnerstruktur | Repo-Wurzel | Übersicht Ordnerstruktur / Reusable Workflows | `input/fsh`, `fsh-generated/resources`, `qc/`, `advisor.json`, `sushi-config.yaml`? |

## Wiki-Seiten (URLs)
- Namenskonventionen: …/wiki/Namenskonventionen-für-FHIR‐Ressourcen-in-der-MII
- Terminology Version Policy: …/wiki/Terminology-Version-Policy
- GitHub Reusable Validation Workflows: …/wiki/GitHub-Reusable-Validation-Workflows
- Dev Container ‐ IG Publisher: …/wiki/Dev-Container-‐-IG-Publisher
- Module Release Workflow: …/wiki/Module-Release-Workflow
- Conformance: …/wiki/Conformance
- Übersicht Ordnerstruktur: …/wiki/Übersicht-Ordnerstruktur-‐-Forge-basiertes-KDS-Modul

(Basis: `https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki`)
