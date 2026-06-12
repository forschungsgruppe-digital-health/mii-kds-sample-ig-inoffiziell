# CONTRIBUTING.md — Beiträge, Kommentierung & Ballotierung

Konventionen für Beiträge zu diesem MII-KDS-IG sowie für die Kommentierung und
Abstimmung gemäß der **jeweils gültigen KDS-Governance** und den
Regeln von **HL7 Deutschland**.

## 1. Geltungsbereich & Sprache
- Deutsch ist die führende/verbindliche Sprache (KDS-Governance); Englisch optional.
- FHIR-Artefakt-Bezeichner (`name`, `id`, Element-Beschreibungen) sind englisch.
- **Beispiele nur synthetisch:** keine realen Personendaten (DSGVO).

## 2. Beitragsarten
- **GitHub-Issues:** inhaltliche/technische Kommentare, Fehler, Änderungswünsche.
- **Pull Requests:** konkrete Änderungen; Build muss grün sein (`sushi .` und IG
  Publisher `Errors: 0`). Kein direkter Push auf `main`.
- **Namens-/Versionskonventionen:** Technische Namenskonventionen sind maßgeblich in
  `qc/custom.rules.yaml` (maschinell geprüfter Single Source of Truth) und im MII-Meta-Wiki
  („Namenskonventionen für FHIR-Ressourcen") definiert — **keine Teilliste hier pflegen**.
  Versionierung: CalVer (`YYYY.MINOR.PATCH`, siehe §5.2). Bestehende Canonical URLs/IDs
  nicht ändern.

## 3. Kommentierungsphase (Konventionen)
Gemäß der KDS-Governance:
- **Ankündigung:** mindestens 2 Wochen vor Beginn über die einschlägigen Verteiler.
- **Frist:** i. d. R. 6 Wochen ab Versand an die Zielgruppe; Verlängerung möglich.
- **Granularität:** Kommentierung erfolgt modulweise.
- **Form:** schriftlich, über das HL7-DE-Ballotportal (`https://ballots.hl7.de`)
  oder durch Anlegen eines Issues im GitHub-Repository des Moduls.
- **Bearbeitung:** Die TF Kerndatensatz und das verantwortliche Team nehmen zu
  **jedem** Kommentar Stellung — angenommen (in welcher Form) bzw. abgelehnt (mit
  Begründung).
- **Veröffentlichung:** Kommentare und Antworten werden grundsätzlich
  veröffentlicht; auf Wunsch wird die Identität der Kommentierenden pseudonymisiert.

## 4. Abstimmung / Ballotierung (Konventionen)
Gemäß der KDS-Governance und den HL7-DE-Abstimmungsregeln:
- **AG Interoperabilität (AG IOP):** Abstimmung über die Freigabe; **eine Stimme je
  Konsortium**; zustimmend / ablehnend / enthaltend. Nicht vertretene Konsortien
  ohne schriftliche Rückmeldung gelten als Enthaltung.
- **Diskrepanzen** innerhalb eines Konsortiums sind innerhalb der Vorlaufzeit
  (2 Wochen) bzw. 2 Wochen nach Versand des Umlaufbeschlusses zu klären.
- **Empfehlung ans NSG:** Das AG-Votum darf **keine Ablehnungen** enthalten, damit
  das Ergebnis dem NSG zur Freigabe empfohlen werden kann.
- **Öffentliche Kommentierung** über die MII hinaus erfolgt nach den Regeln von
  HL7 Deutschland.
- **Finale Freigabe:** durch das Nationale Steuerungsgremium (NSG).

### Richtwerte für Abstimmungsschritte
| Schritt | Gremium | Richtwert |
|---------|---------|-----------|
| Freigabe Modulbeschreibung | AG IOP | 2 Wochen (Umlauf / vor Sitzung) |
| Freigabe Modulbeschreibung | NSG | 2 Wochen (Umlauf) |
| Freigabe Informationsmodell | AG IOP | 2 Wochen (Umlauf / vor Sitzung) |
| Freigabe Informationsmodell | NSG | 2 Wochen (Umlauf) |
| Kommentierung Implementation Guide | Fach-Community | i. d. R. 2 Wochen Ankündigung + 6 Wochen |
| Freigabe Implementation Guide | NSG | 2 Wochen (Umlauf) |

## 5. Branching, Release-Tagging & Packaging
Das Release eines FHIR-Packages ist zentraler Bestandteil des Modul-Lebenszyklus. Die
Konventionen orientieren sich an der jeweils gültigen KDS-Governance, den MII-Best-
Practices und dem „Module Release Workflow" des Meta-Moduls.

### 5.1 Branching
- **`main`/`master`** — stabiler Default-Branch; die offiziellen Reusable-Validierungen
  (`.github/workflows/main.yml`) laufen auf `main`/`master` und auf Pull Requests.
- **`dev`** — optionaler Integrationsbranch für laufende Arbeit (empfohlen bei mehreren
  Beitragenden); wird per PR nach `main`/`master` gemergt.
- **`feature/<kurz>`** — Themenbranches; PR nach `dev` (bzw. `main`). **Kein direkter
  Push** auf `main`/`master`/`dev`; Merge nur über reviewten PR.
- **`release/v<CalVer>`** — kurzlebiger Branch zur Release-Vorbereitung.
- **`hl7-ig-build`** — nur falls dieses Template auf ein **bestehendes** Modul-Repo
  angewendet wird: isolierter Branch für den IG-Publisher-/Pages-Build, ohne
  `dev`/`master`/`main` zu verändern (siehe `MIGRATION.md` §11).

| Branch | Zweck | Merge-Ziel |
|--------|-------|-----------|
| `feature/*` | einzelne Änderung | `dev` (bzw. `main`) via PR |
| `dev` | Integration | `main`/`master` via PR |
| `main`/`master` | stabil, CI-getriggert | — |
| `release/v*` | Release-Vorbereitung | `main`/`master`, dann Tag |
| `hl7-ig-build` | isolierter IG-Build (Bestandsmodul) | nie in den Default-Branch |

### 5.2 Release-Tagging
- **Versionsschema CalVer** `YYYY.MINOR.PATCH` gemäß KDS-Governance (z. B. `2026.0.0`).
- **Tags** annotiert mit `v`-Präfix (`v2026.0.0`). **Pre-Releases:** Kommentierungs-/
  Ballot-Fassung `…-ballot` (z. B. `2026.0.0-ballot`), ferner `-alpha.N` / `-rc.N`.
- Version vor dem Tag in `sushi-config.yaml` (und `package.json`, falls vorhanden)
  setzen; `CHANGELOG.md` pflegen.
- Der **Tag-Push triggert den `RELEASE`-Job** in `main.yml` (Entwurfs-Release; ein
  `-`-Suffix wird automatisch als Pre-Release markiert).
- **Finale (Nicht-Ballot-)Freigabe** erst nach **NSG-Freigabe** (Review-Gate D).

```bash
git checkout -b release/v2026.0.0
# Version in sushi-config.yaml -> 2026.0.0-ballot setzen, CHANGELOG pflegen, PR + Merge
git tag -a v2026.0.0-ballot -m "MII KDS <Modul> 2026.0.0-ballot"
git push origin v2026.0.0-ballot
```

### 5.3 Packaging
- Das **FHIR-Package** (`package.tgz`) wird über **Simplifier** veröffentlicht; die
  Simplifier↔GitHub-Integration wird empfohlen (Simplifier-Projekt mit dem Repo verknüpfen).
- Das Paket wird an das vom `RELEASE`-Job erzeugte **Entwurfs-Release angehängt**; danach
  wird das Release veröffentlicht (Module Release Workflow).
- **Dependencies exakt pinnen** (z. B. `de.basisprofil.r4`) in `sushi-config.yaml`/IG;
  modulübergreifend einheitliche Versionierung.
- **Modulversion und Dependencies** im Meta-Wiki „Übersicht über Versionen der
  Kerndatensatz-Module" eintragen (Best-Practice-Pflicht).
- **IG-Export ≥ 2 Tage vor** Beginn der Kommentierungsphase bereitstellen.
- **Release-Ankündigung** über den MII-Zulip-Kanal „MII-Kerndatensatz > Releases"
  (`NOTIFY_ZULIP`, siehe `NOTIFICATIONS.md`); Detailschritte in `PUBLISHING.md`.

## 6. Review-Gates (vor Merge/Publikation)
- [ ] **Gate A:** URL-/ID-Bestandsschutz + Artefaktvollständigkeit
- [ ] **Gate B:** Narrative inkl. Pflichtabschnitte
- [ ] **Gate C:** Sprachführung/Übersetzung (Deutsch Standard)
- [ ] **Gate D:** Freigabe gemäß KDS-Governance (TF KDS / AG IOP / NSG)

Erst nach Gate D greift der GitHub-Pages-Workflow.

## 7. KI-gestützte Beiträge (Transparenz & Pflicht-Review)
Dieses Repo enthält eine KI-Migrationsunterstützung (`skills/mii-ig-migration/`).
- KI-gestützt erstellte oder veränderte Beiträge sind im Pull Request **offenzulegen**
  (verwendetes Modell/Werkzeug, Umfang der Automatisierung).
- Ein **abschließendes menschliches Review** ist verpflichtend; KI-Vorschläge sind
  Entwürfe, keine Freigaben. Mit `TODO:REVIEW` markierte Stellen müssen vor Merge
  aufgelöst sein.
- Die Leitplanken aus `AGENTS.md` / `skills/mii-ig-migration/` gelten verbindlich.

## 8. Issue- & PR-Hinweise
- Ein Thema pro Issue/PR; Bezug zum betroffenen Modul/Artefakt angeben.
- PR-Beschreibung: Zusammenfassung, betroffene Artefakte, QA-Ergebnis, ggf.
  KI-Offenlegung und Verweis auf den `migration-report`.
