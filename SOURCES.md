# SOURCES.md — Angewandte Quellen, Spezifikationen & Konventionen

Transparente Dokumentation aller Standards, Spezifikationen und Konventionen, die
in dieses Vorlagen-Repo eingeflossen sind, mit Quell-URL, Anwendungsort im Repo und
Status. Abgerufen: Juni 2026.

**Status-Legende:** `[V]` online verifiziert (diese Sitzung) · `[D]` aus
hochgeladenem MII-Dokument · `[S]` etablierter Standard/Konvention · `[O]`
offen / Entscheidung ausstehend (Annahme).

## 1. FHIR-Kern & IG-Toolchain
| Quelle | URL | Angewendet in | Status |
|--------|-----|---------------|--------|
| HL7 FHIR R4 (4.0.1) | https://hl7.org/fhir/R4/ | [`sushi-config.yaml`](sushi-config.yaml) (fhirVersion) | [S] |
| FHIR ImplementationGuide-Ressource | https://hl7.org/fhir/implementationguide.html | [`ig.ini`](ig.ini), IG-Resource | [S] |
| FHIR IG Publisher | https://github.com/HL7/fhir-ig-publisher | [`_genonce.sh`](_genonce.sh), [`_updatePublisher.sh`](_updatePublisher.sh), Workflows | [V] |
| FSH / SUSHI | https://github.com/FHIR/sushi · https://fshschool.org | [`input/fsh/*`](input/fsh), Build | [V] |
| GoFSH (FHIR→FSH) | https://github.com/FHIR/GoFSH | [`MIGRATION.md`](MIGRATION.md) (A2/Phase 2) | [S] |

## 2. IG-Struktur & Best Practices (HL7 International)
| Quelle | URL | Angewendet in | Status |
|--------|-----|---------------|--------|
| Guidance for FHIR IG Creation | https://build.fhir.org/ig/FHIR/ig-guidance/ | Seitenraster, Parameter, Best Practices | [V] |
| FHIR/sample-ig (Skelett) | https://github.com/FHIR/sample-ig | Gesamtskelett (analog) | [V] |
| HL7 ig-template-base | https://github.com/HL7/ig-template-base | `ig.ini` (Template-Wahl) | [V] |
| HL7 ig-template-fhir | https://github.com/HL7/ig-template-fhir | `ig.ini` (Template-Wahl) | [V] |
| US Core IG (Struktur-Exemplar) | https://hl7.org/fhir/us/core/ | Seitenraster/Menü | [V] |
| WHO SMART IG Starter Kit (QA) | https://smart.who.int/ig-starter-kit/ | Best-Practice-Checkliste | [V] |

## 3. HL7 Europe
| Quelle | URL | Angewendet in | Status |
|--------|-----|---------------|--------|
| HL7 Europe Base/Core IG v2.0.0 | https://hl7.eu/fhir/base · https://build.fhir.org/ig/hl7-eu/base/ | optionale Dependency, [`context.md`](input/pagecontent/context.md) | [V]/[O] |
| HL7 Europe (Org/Repos) | https://github.com/hl7-eu | Schichtenmodell, Beispiele | [V] |
| International Patient Summary (IPS) | https://hl7.org/fhir/uv/ips/ | optionale Dependency, `context.md` | [S]/[O] |

## 4. HL7 Deutschland
| Quelle | URL | Angewendet in | Status |
|--------|-----|---------------|--------|
| Basisprofile DE (`de.basisprofil.r4` 1.5.4) | https://ig.fhir.de/basisprofile-de/ | [`sushi-config.yaml`](sushi-config.yaml) Dependency | [V] |
| HL7 Deutschland (GitHub) | https://github.com/hl7germany | Profil-Dependency, Beispiele | [V] |
| HL7 DE Ballotportal / Kommentierung | https://ballots.hl7.de · https://hl7.de | [`CONTRIBUTING.md`](CONTRIBUTING.md) | [D] |
| HL7 DE Abstimmungs-/Kommentierungsregeln (PDF) | https://hl7.de/wp-content/uploads/Abstimmungsregeln-20221213.pdf | [`COMMENT_RESOLUTION.md`](COMMENT_RESOLUTION.md), Issue-Templates | [V] |
| HL7 DE Ballotierungsportal (Service Desk) | https://portal.hl7.de · https://hl7germany.atlassian.net/servicedesk | [`.github/ISSUE_TEMPLATE/config.yml`](.github/ISSUE_TEMPLATE/config.yml) | [V] |

## 5. MII-Kerndatensatz (Governance & Vorgaben)
| Quelle | URL/Beleg | Angewendet in | Status |
|--------|-----------|---------------|--------|
| KDS-Governance (jeweils gültige Fassung) | MII-intern / MII-Meta-Wiki | Sprache, Versionierung, [`CONTRIBUTING.md`](CONTRIBUTING.md), Review-Gates | [D] |
| KDS Best Practices / Werkzeugunterstützung | hochgeladene Dokumente | Toolchain, Aufbau | [D] |
| Checkliste Bereitstellung IG | hochgeladenes Dokument | Veröffentlichungsangaben | [D] |
| Meta-Manteldokument (jeweils aktuelle Fassung) | https://simplifier.net/guide/mii-ig-modul-template-2025?version=current | Crosswalk, [`input/pagecontent/*`](input/pagecontent) | [V] |
| **MII-Meta-Wiki (Konventionen, SSOT)** | https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki | Namenskonventionen, Terminologie, CI, Dev Container, Release | [V] |
| Wiki: Namenskonventionen FHIR-Ressourcen | …/wiki/Namenskonventionen-für-FHIR‐Ressourcen-in-der-MII | [`qc/custom.rules.yaml`](qc/custom.rules.yaml), [`AGENTS.md`](AGENTS.md) | [V] |
| Wiki: Terminology Version Policy | …/wiki/Terminology-Version-Policy | [`TERMINOLOGY.md`](TERMINOLOGY.md), `sushi-config.yaml` | [V] |
| Wiki: GitHub Reusable Validation Workflows | …/wiki/GitHub-Reusable-Validation-Workflows | [`.github/workflows/main.yml`](.github/workflows/main.yml), [`advisor.json`](advisor.json) | [V] |
| Wiki: Dev Container ‐ IG Publisher | …/wiki/Dev-Container-‐-IG-Publisher | [`.devcontainer/devcontainer.json`](.devcontainer/devcontainer.json) | [V] |
| Wiki: Module Release Workflow | …/wiki/Module-Release-Workflow | `main.yml` (RELEASE), Versionierung | [V] |
| MII Zulip (Releases) | https://mii.zulipchat.com | [`NOTIFICATIONS.md`](NOTIFICATIONS.md), `main.yml` (NOTIFY_ZULIP) | [V] |
| SU-TermServ (MII-Terminologieserver) | https://www.ontoserver.mii-termserv.de/ | `TERMINOLOGY.md`, Java-Validierung | [V] |
| cybernop vscode-ig-publisher (Dev-Container-Image) | https://github.com/cybernop/vscode-ig-publisher | `.devcontainer/devcontainer.json` | [V] |
| MII-Referenz-IGs (Ist-Stand) | https://github.com/medizininformatik-initiative/kerndatensatz-basis · …/kerndatensatz-meta | i18n/.po, Struktur, Template-Befund | [V] |
| MII-Kerndatensatz (Website) | https://www.medizininformatik-initiative.de/de/der-kerndatensatz-der-medizininformatik-initiative | [`references.md`](input/pagecontent/references.md) | [S] |

## 6. Agenten- & Skills-Konventionen
| Quelle | URL | Angewendet in | Status |
|--------|-----|---------------|--------|
| AGENTS.md (offenes Format) | https://agents.md · https://github.com/agentsmd/agents.md | `AGENTS.md`, `CLAUDE.md`-Symlink | [V] |
| Agentic AI Foundation (Steward) | https://aaif.io | Provenienz AGENTS.md/Skills | [V] |
| Agent Skills Standard (SKILL.md) | https://agentskills.io · https://agentskills.io/specification | `skills/mii-ig-migration/SKILL.md` (+ references/) | [V] |
| Agent Skills (Spec-Repo) | https://github.com/agentskills/agentskills | Ordnerschema SKILL.md/references | [V] |
| Anthropic Skills (Referenzimpl.) | https://github.com/anthropics/skills | SKILL.md-Format | [V] |
| Vendor-Verzeichnisse | Claude Code `.claude/skills/`; Codex/Standard `.agents/skills/`; Codex user-level `~/.codex/skills` | Symlinks auf `skills/` | [V] |

## 7. Sonstige Konventionen
| Quelle | URL | Angewendet in | Status |
|--------|-----|---------------|--------|
| Calendar Versioning (CalVer) | https://calver.org/ | Versionsschema `YYYY.MINOR.PATCH` | [D]/[S] |
| gettext PO (i18n) | https://www.gnu.org/software/gettext/ | `input/translations/en/*.po` | [S] |
| Creative Commons BY 4.0 | https://creativecommons.org/licenses/by/4.0/ | `license`-Felder | [S] |
| GitHub Actions / Pages | https://docs.github.com/actions · https://docs.github.com/pages | `.github/workflows/*` | [S] |

## 8. CI-Build, Veröffentlichung, Registry & Entwicklungsumgebung
| Quelle | URL | Angewendet in | Status |
|--------|-----|---------------|--------|
| qligier/fhir-ig-action (Community) | https://github.com/marketplace/actions/fhir-ig-action | `.github/workflows/*` | [V] |
| GitHub Pages (Actions-Deployment) | https://docs.github.com/pages | `ig-publish-pages.yml`, `PUBLISHING.md` §1 | [S] |
| HL7 auto-ig-builder (CI-Build) | https://fhir.github.io/auto-ig-builder/builds.html | `PUBLISHING.md` §3 | [V] |
| FHIR/ig-registry + package-feeds.json | https://github.com/FHIR/ig-registry | `PUBLISHING.md` §2 | [V] |
| FHIR Registry – Submit | https://registry.fhir.org/submit | `PUBLISHING.md` §2 | [V] |
| package-feed.xml (Vorlage) | http://hl7.org/fhir/package-feed.xml | `PUBLISHING.md` §2 | [V] |
| HL7 Process for Publishing a FHIR IG | https://confluence.hl7.org/display/FHIR/HL7+Process+for+Publishing+a+FHIR+IG | `PUBLISHING.md` §3 | [V] |
| IG Publisher Documentation | https://confluence.hl7.org/spaces/FHIR/pages/35718627/IG+Publisher+Documentation | `PUBLISHING.md`, Build | [V] |
| VS Code Dev Containers | https://code.visualstudio.com/docs/devcontainers/containers | `.devcontainer/devcontainer.json` | [S] |
| Dev Container Features (java/node) | https://github.com/devcontainers/features | `.devcontainer/devcontainer.json` | [S] |
| bonFHIR IG Toolbox (alt. Image) | https://bonfhir.dev/docs/guides/ig-toolbox · `ghcr.io/bonfhir/ig-toolbox` | `.devcontainer` (Alternative) | [V] |
| FSH VS Code Extension | `MITRE-Health.vscode-language-fsh` (VS Code Marketplace) | `.vscode/extensions.json` | [S] |
| Firely Quality Control (*.rules.yaml) | https://docs.fire.ly/projects/Firely-Terminal/Quality-Control.html | `qc/custom.rules.yaml` | [V] |
| FirelyTeam/firely-terminal-pipeline (Action) | https://github.com/marketplace/actions/firely-terminal-github-actions | via MII-Reusable-DOTNET in `main.yml` | [V] |
| MII QC-Referenz (kerndatensatz-meta) | https://github.com/medizininformatik-initiative/kerndatensatz-meta/tree/master/qc | `qc/custom.rules.yaml` | [V] |
| GitHub Atom-Feeds (releases/tags/commits) | https://docs.github.com/rest/releases (.atom-Endpunkte) | `NOTIFICATIONS.md` | [S] |
| Keep a Changelog 1.1.0 | https://keepachangelog.com/de/1.1.0/ | `CHANGELOG.md` | [V] |
| RFC 2606 (reservierte Beispiel-Domains) | https://www.rfc-editor.org/rfc/rfc2606 | `sushi-config.yaml`, `NOTICE` | [V] |
| Contributor Covenant v2.1 | https://www.contributor-covenant.org/de/version/2/1/code_of_conduct/ | `CODE_OF_CONDUCT.md` | [V] |
| SNOMED CT (DE: BfArM/NRC) | https://www.bfarm.de/DE/Kodiersysteme/Terminologien/SNOMED-CT/ | `TERMINOLOGY.md` | [V] |
| LOINC (Regenstrief, Lizenz) | https://loinc.org/license/ | `TERMINOLOGY.md` | [V] |
| FHIR Terminologieserver tx.fhir.org | https://tx.fhir.org | `TERMINOLOGY.md` | [V] |
| GitHub Dependabot (Actions-Updates) | https://docs.github.com/code-security/dependabot | `.github/dependabot.yml` | [S] |
| FHIR Package Registry (API) | https://packages.fhir.org | `tools/check-updates.py` | [V] |
| npm Registry (fsh-sushi) | https://registry.npmjs.org/fsh-sushi | `tools/check-updates.py` | [V] |
| HL7 fhir-ig-publisher Releases | https://github.com/HL7/fhir-ig-publisher/releases | `tools/check-updates.py`, Build | [V] |

## 9. Verifizierungshinweis
- **Verifiziert in dieser Sitzung:** alle `[V]`-URLs (per Web-Abruf/Registry); das
  Sample-IG baut mit SUSHI fehlerfrei (`0 Errors, 0 Warnings`); `de.basisprofil.r4`
  auf existierende stabile Version `1.5.4` gepinnt (FHIR-Package-Registry).
- **Nicht in dieser Sitzung ausgeführt:** der vollständige IG-Publisher-Build
  (HTML-Rendering, `/de//en/`-Ausgabe, GitHub-Pages-Deployment) — dies erfolgt in
  CI bzw. lokal über `_genonce.sh`; die Workflows sind dafür vorbereitet.
- Strukturelle Selbstprüfung: `tools/verify-template.sh`.
