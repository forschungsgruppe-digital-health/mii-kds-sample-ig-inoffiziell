# MIGRATION.md — Überführung eines MII-KDS-Moduls in diesen HL7 FHIR IG

Überführung eines bestehenden, bisher auf **Simplifier** publizierten MII-KDS-Moduls
in das **IG-Publisher-basierte** Zielformat. Zwei Wege: **(A) manuell** und
**(B) KI-gestützt** — beide mit verpflichtender abschließender menschlicher Begutachtung.

Sprache: **Deutsch ist Standard/verbindlich**, Englisch optional.

## 1. Voraussetzungen
- Java 17+, Node 20+
- Ruby + Jekyll (HTML-Build des IG Publishers; [Installation](https://jekyllrb.com/docs/installation/)) —
  bei Ruby-Versionsmanagern (chruby/rbenv/rvm) `GEM_HOME`/`PATH` der Build-Shell beachten
- `npm install -g fsh-sushi`
- `npm install -g gofsh` **nur**, falls Quellen ausschließlich als FHIR-JSON/XML vorliegen (siehe §2)
- Git; Arbeits-Branch (kein direkter Push auf `main`)
- IG Publisher: `./_updatePublisher.sh` bzw. `_updatePublisher.bat`

## 2. GoFSH — nur bedingt nötig
FSH ist das Quellformat dieses IG. Ob GoFSH (FHIR→FSH) als Migrationsschritt nötig
ist, hängt von der Quelle ab:
- **Quelle enthält bereits FSH** (z. B. `kerndatensatz-meta`): GoFSH **entfällt** — FSH direkt übernehmen.
- **Quelle enthält nur generierte JSON/XML-Ressourcen** (Simplifier-/Forge-Export ohne FSH): GoFSH einmalig zur Erzeugung editierbarer FSH nutzen.

## 3. Teil A — Manuelle Migration
- [ ] **A0 Vorbereitung:** Modulname, Canonical-Basis, CalVer-Version festlegen; EU-Schichtung (optionale Dependencies in `sushi-config.yaml`) wählen. Bei Anwendung auf ein bestehendes Modul-Repo: isolierten Branch `hl7-ig-build` anlegen (siehe §11) — `dev`/`master`/`main` bleiben unberührt.
- [ ] **A1 Skelett:** dieses Repo klonen; `ig.ini` und `sushi-config.yaml` anpassen (id, canonical, version, title, dependencies, Menü).
- [ ] **A1b Vorlagen-Beispiele löschen:** `input/fsh/examples.fsh` und alle Beispiel-Instanzen der Vorlage **händisch entfernen** (nicht übernehmen), um Konflikte mit den realen Modul-Beispielen zu vermeiden.
- [ ] **A2 Artefakte:** FSH aus dem Quell-Repo nach `input/fsh/` übernehmen; falls nur JSON/XML: `gofsh ./quelle -o input/fsh`. IDs/URLs unverändert lassen; MII-Namenskonvention beibehalten (maßgeblich: [`qc/custom.rules.yaml`](qc/custom.rules.yaml) + [Meta-Wiki](https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki)).
- [ ] **A3 Narrative:** Manteldokument-Inhalte gemäß Crosswalk (§6) nach `input/pagecontent/*.md` (deutsch) überführen; `context.md`, `references.md`, `use-cases.md` befüllen; Model-to-Profile-Mapping in `data-sets.md` pflegen.
- [ ] **A4 Mehrsprachigkeit (optional):** Standard ist Deutsch. Für optionales
  Englisch (verifizierte Mechanik, IG Publisher 2.2.x):
  - **Ressourcen-Texte (rendern heute):** je StructureDefinition/CodeSystem/
    Questionnaire ein Translation-Supplement `input/translations/en/<Typ>-<id>.po`
    (`msgid` = exakter dt. Quelltext aus `fsh-generated/resources/<Typ>-<id>.json`,
    `msgstr` = englisch). **Nicht** unterstützt: ValueSet, ImplementationGuide,
    Menü — entsprechende `.po` werden vom Publisher ignoriert.
  - **Narrative-Seiten (zukunftssicher):** je `input/pagecontent/<name>.md` eine
    Übersetzung `input/pagecontent/<name>-en.md`. Wird aktuell noch nicht gerendert
    (HL7 „ToDo"), aber korrekt vorbereitet; `/en/`-Seiten zeigen bis dahin Deutsch
    mit Standardhinweis (erwartet).
  - **Vorhandene EN-Fassung übernehmen (Harvest):** Hat die Quelle bereits Englisch
    (z. B. MII KDS Person), die EN-Texte übernehmen statt neu zu übersetzen —
    Ressourcen aus FSH-`translation`-Extensions/Designations, Narrative aus dem
    parallelen EN-Guide.
  - Konfig/Datei-Konventionen: [`skills/ig-translate/references/translate-spec.md`](skills/ig-translate/references/translate-spec.md);
    Zielpfade prüfen mit [`tools/ig-translate.sh`](tools/ig-translate.sh) `--scan en` / `--validate en`.
- [ ] **A5 Build & QA:** `./_genonce.sh` (bzw. `.bat`); `output/qa.html`/`qa.txt` → „Errors: 0"; `output/index.html` sichten.
- [ ] **A6 Benutzerdefinierte Seiten:** §7 anwenden (Review-Gate).
- [ ] **A6b Vorlage-Bereinigung (nach validierter Migration):** Reine Vorlage-/
  Migrations-Dateien entfernen, sofern die Vorlage als Ganzes übernommen wurde.
  **Erst nach** grünem Build/QA (A5) und bestätigten Narrativen (A6). Liste:
  - **Immer entfernen:** `MIGRATION.md`, `DESIGN.md`, `ROLES.md`, `SOURCES.md`,
    `AI_USAGE.md`, `skills/`, `tools/verify-template.sh`, `.ai-log/`,
    `input/images/mii-logo-PLATZHALTER.svg`.
  - **Abwägen (behalten oder entfernen):** Governance-/Community-Doku
    (`CONTRIBUTING.md`, `COMMENT_RESOLUTION.md`, `PUBLISHING.md`,
    `NOTIFICATIONS.md`, `TERMINOLOGY.md`, `CODE_OF_CONDUCT.md`, `SECURITY.md`,
    `NOTICE`, `CHANGELOG.md`), `AGENTS.md`/`CLAUDE.md` + Skill-Symlinks
    (`.claude/`, `.agents/`), `.devcontainer/`, `.vscode/`, `advisor.json`,
    `tools/check-updates.py`.
  - **Niemals entfernen:** `input/fsh`, `input/pagecontent`, `input/translations`,
    `input/ignoreWarnings.txt`, `input/includes`, `sushi-config.yaml`, `ig.ini`,
    `package.json`, `publication-request.json`, `qc/`, `.gitignore`, `LICENSE`.
  - Anschließend verbleibende Verweise auf entfernte Dateien (README/AGENTS/
    Workflows) bereinigen und Build erneut grün stellen.
- [ ] **A7 PR & Review:** Branch pushen, Pull Request öffnen; Review-Gates (§8) durchlaufen.

## 4. Teil B — KI-gestützte Migration
Nutzt die herstelleragnostische Spezifikation in [`skills/mii-ig-migration/`](skills/mii-ig-migration/).
- [ ] **B0 Eingaben:** `SOURCE_RENDERED_IG_URL`, `SOURCE_REPO_URL`, `TARGET_TEMPLATE_REPO`, `MODULE_METADATA`
  (Modul-`id`/Canonical/CalVer-`version`/Dependencies/Publisher — Felder & Zielorte:
  [`skills/mii-ig-migration/references/migration-agent-spec.md`](skills/mii-ig-migration/references/migration-agent-spec.md) §2.1).
- [ ] **B1 Agent instanziieren:** Spezifikation laden; Fähigkeiten gemäß Manifest aktivieren (Web-Abruf, Repo-Read, Datei-IO, Shell, PR).
- [ ] **B2 Automatisierte Schritte:** Inventarisierung → Skelett → Artefakte (ggf. `gofsh`) → Narrative → optionale Mehrsprachigkeit → Build/QA → `migration-report` → PR. Leitplanken: URL-/ID-Bestandsschutz, Deutsch als Standard, keine Fakten-Erfindung, keine eigenständige Veröffentlichung.
- [ ] **B3 Übergabe:** Agent stoppt an den Review-Gates (§8); Freigabe/Merge nur durch Menschen.
- [ ] **B4 Vorlage-Bereinigung (optional, auf Bestätigung):** Nach validierter
  Migration den Skill [`skills/template-sanitize/`](skills/template-sanitize/) aktivieren — er entfernt auf
  ausdrückliche Nutzerbestätigung die reinen Vorlage-/Migrations-Dateien
  (Pendant zu A6b) via [`tools/template-sanitize.sh`](tools/template-sanitize.sh) (Dry-Run-Default, `--apply`).
- [ ] **B5 Übersetzung (optional, auf Bestätigung):** Für eine englische
  Sprachausgabe den Skill [`skills/ig-translate/`](skills/ig-translate/) aktivieren — Modus **translate**
  (LLM, de→en) oder **harvest** (vorhandene EN-Fassung der Quelle übernehmen, z. B.
  MII KDS Person). Erzeugt Ressourcen-Supplements (rendern) und zukunftssichere
  `*-en.md`-Seiten; Deutsch bleibt führend, jede Übersetzung mit `TODO:REVIEW`,
  Review-Gate C (§8) verpflichtend. Pendant zu A4.

## 5. Wahl des Weges
- **Manuell:** kleine Module, viele neue fachliche Entscheidungen oder fehlende Agenten-Infrastruktur.
- **KI-gestützt:** strukturgleiche Module mit großem Artefaktbestand.

Identische Akzeptanzkriterien (§10) und Review-Gates (§8) in beiden Fällen.

## 6. Crosswalk Manteldokument → IG
| Manteldokument | Ziel im IG |
|----------------|------------|
| Beschreibung Modul | `index.md` |
| Release Notes | `changes.md` |
| Kontext / Bezüge zu anderen Modulen | `context.md` |
| Referenzen | `references.md` |
| Anwendungsfälle / Szenarien | `use-cases.md` |
| Datensätze inkl. Beschreibungen (+ Model-to-Profile-Mapping) | `data-sets.md` |
| Informationsmodell / UML | `uml.md` + Logical Model |
| Conformance (Must Support, fehlende Daten, Such-API) | `conformance.md` |
| FHIR Profile / CapabilityStatement / Terminologien | `input/fsh/` → Artifacts |
| Impressum/Autoren/Copyright/Disclaimer | `index.md` (Fuß) + `sushi-config.yaml` |

## 7. Benutzerdefinierte Seiten & Review-Gate
Handgeschriebene Narrative-Seiten in `input/pagecontent/` werden **nicht** aus
FHIR-Artefakten generiert und müssen bewusst migriert werden.
- [ ] **Bestand erfassen:** alle Seiten des Quell-IG auflisten; je Seite generiert vs. handgeschrieben markieren.
- [ ] **Übernehmen:** handgeschriebene Inhalte deutsch nach `input/pagecontent/` überführen; Links/Anker auf neue Artefakt-IDs aktualisieren.
- [ ] **Kennzeichnen:** bei KI-gestützter Migration jede KI-entworfene/-migrierte Seite markieren (PR-Label `ai-authored`, Vermerk im PR).

**Review-Gate (verpflichtend):** kein Merge benutzerdefinierter Seiten ohne
menschliche Freigabe. Bei KI-Migration zusätzlich der folgende Ablauf:

```mermaid
flowchart LR
  A[KI-Entwurf der Seite] --> B{Fachliche Pruefung}
  B -- nein --> A
  B -- korrekt --> C{Quellen-/Faktencheck}
  C -- nein --> A
  C -- belegt --> D{Sprache: Deutsch fuehrend}
  D -- nein --> A
  D -- ok --> E[Menschliche Freigabe -> Merge]
```

Kriterien: inhaltliche Korrektheit (Fachvertretung), Quellenbelege ohne erfundene
Fakten, Deutsch als Standard. Erst nach Freigabe erfolgt der Merge.

## 8. Review-Gates & Governance-Freigabe
- [ ] **Gate A:** URL-/ID-Bestandsschutz + Artefaktvollständigkeit
- [ ] **Gate B:** Narrative inkl. Pflichtabschnitte; benutzerdefinierte Seiten freigegeben (§7)
- [ ] **Gate C:** Sprachführung (Deutsch Standard; optionales Englisch konsistent)
- [ ] **Gate D:** Governance-Freigabe (TF KDS / AG IOP / NSG) — erst danach greift der Pages-Workflow

## 9. Best-Practice-Checkliste
- [ ] HL7-Seitenraster (Home/Guidance/Conformance/Artifacts/Downloads/Versioning)
- [ ] Zielgruppen (Intended Audience) benannt
- [ ] Model-to-Profile-Mapping-Tabelle gepflegt
- [ ] Must Support, Konformitätsverben, fehlende Daten, Such-API beschrieben
- [ ] CapabilityStatement vorhanden
- [ ] Beispiele validieren; `qa.txt` „Errors: 0"
- [ ] Stabile Canonical URLs / Versionierung (CalVer); Bestandsschutz gewahrt
- [ ] Sicherheit & Datenschutz adressiert

## 10. Definition of Done
- [ ] `sushi .` und IG-Publisher-Build fehlerfrei (`Errors: 0`)
- [ ] Crosswalk vollständig; Canonical-URL-Diff leer (Bestandsschutz)
- [ ] `i18n-default-lang: de` gesetzt
- [ ] Vorlagen-Beispiele entfernt (`input/fsh/examples.fsh`)
- [ ] (bei bestehendem Modul-Repo) Arbeit nur im Branch `hl7-ig-build`; Default-Branch unverändert
- [ ] Benutzerdefinierte Seiten via Review-Gate (§7) freigegeben
- [ ] PR mit Migrationsbericht; alle Review-Gates (§8) abgezeichnet

## 11. Anwendung auf ein bestehendes Modul-Repo (isolierter Branch & Pages)
Additiv und rückbaubar, **ohne** `dev`/`master`/`main` zu verändern:
- [ ] Branch `hl7-ig-build` vom Default-Branch anlegen (wird nie dorthin gemergt).
- [ ] Template-Dateien gemäß der präzisen Übernehmen-/Nicht-übernehmen-Liste
  ([`skills/mii-ig-migration/references/migration-agent-spec.md`](skills/mii-ig-migration/references/migration-agent-spec.md) §5a.2) + **reale**
  Modul-FSH in den Branch übernehmen; Vorlagen-Beispiele löschen. Modul-`README`,
  Modul-CI, kuratierte `ignoreWarnings.txt`/`qc/` **nicht** überschreiben.
- [ ] GitHub Pages auf **Source = GitHub Actions** stellen; Pages-Workflow auf den Branch `hl7-ig-build` beschränken (Branch-Filter).
- [ ] Gerenderten IG (Pages-URL) im Modul-README/Wiki verlinken.
- [ ] Feature-Branches per PR **in `hl7-ig-build`** mergen (nie in den Default-Branch).
