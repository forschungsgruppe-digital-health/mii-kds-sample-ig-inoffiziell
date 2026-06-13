# Changelog

Wird **abschließend beim Finalisieren** der Vorlage erstellt.
Format: [Keep a Changelog](https://keepachangelog.com/de/1.1.0/); Versionierung CalVer
(`JJJJ.MINOR.PATCH`).

> Inhaltliche Release Notes des IG-Moduls stehen separat unter
> [`input/pagecontent/changes.md`](input/pagecontent/changes.md).

## [Unreleased]
_(in Arbeit — Einträge werden zum Abschluss zusammengeführt)_

### Fixed (Befunde aus Migrations-Dry-Run am Modul Dokument, 2026-06-12)
- [`sushi-config.yaml`](sushi-config.yaml): ungültigen IG-Parameter `show-inherited-extensions` entfernt
  (nicht in `ig-parameters|1.1.2`; verursachte 4 Publisher-Validierungsfehler).
- Skill-Discovery-Symlinks ergänzt: `.claude/skills` und `.agents/skills` → `skills/`,
  `CLAUDE.md` → `AGENTS.md` (in `AGENTS.md` dokumentiert, fehlten aber).
- [`_genonce.sh`](_genonce.sh) **und** [`_genonce.bat`](_genonce.bat): Preflight-Prüfung auf Jekyll (Build schlug
  sonst erst nach Minuten am letzten Schritt fehl); Ruby/Jekyll als Voraussetzung
  in [`MIGRATION.md`](MIGRATION.md) §1 und im README-Schnellstart ergänzt.
- `_genonce.bat`: `call` vor `npm`/`sushi` ergänzt (`.cmd`-Wrapper — ohne `call`
  kehrte das Skript nach `sushi .` nie zurück, der Publisher lief nie) sowie
  Fehlerabbruch (`|| exit /b 1`) analog `set -euo pipefail`; [`_updatePublisher.bat`](_updatePublisher.bat):
  curl-Fehlschlag bricht jetzt mit Fehlermeldung ab.
- Spec §4.2: Umgang mit i18n-bedingten Sprach-Mismatch-Warnungen definiert
  (Quell-FSH `^language = #de-DE` vs. XHTML `de`): kosmetisch, wird mit
  Begründung in `input/ignoreWarnings.txt` des Moduls unterdrückt.
- [`tools/verify-template.sh`](tools/verify-template.sh): neuer Modus `--migrated` (nur IG-relevante
  Prüfungen für migrierte Modul-Repos); CapabilityStatement-Prüfung
  pfadunabhängig (`InstanceOf:`-Suche statt festem Dateinamen).
- [`ig-publish-pages.yml`](.github/workflows/ig-publish-pages.yml): Hinweis auf Branch-Filter `hl7-ig-build` bei Anwendung
  auf ein bestehendes Modul-Repo (Spec §5a.3).
- Migrations-Spec §5a.2: präzise Übernahme-/Ausschlussliste der Template-Dateien
  (u. a. Modul-`README`/-CI/`ignoreWarnings.txt` nicht überschreiben).
- `input/pagecontent/*`: defekte Relativlinks `../../ROLES.md` (brachen im
  gerenderten IG) durch Klartext-Verweis ersetzt.

### Fixed (Stabilitäts-Audit des Templates, 2026-06-13)
- [`publication-request.json`](publication-request.json): ungültigen `status: ci-build` → `draft`; veraltetes
  `milestone: false` → `mode: working`; `category: National Base` ergänzt;
  `ci-build`-URL von fremder MII-Org auf das tatsächliche Repo umgestellt.
- [`input/translations/en/`](input/translations/en/): EN-Katalog von alter Package-Id-Benennung auf
  `ImplementationGuide-example.fhir.kds.sample.po` umbenannt (sonst nie angewendet);
  veraltete `msgid` (Publisher, Description) mit [`sushi-config.yaml`](sushi-config.yaml) synchronisiert.
- [`translationinfo.md`](input/pagecontent/translationinfo.md): war Orphan (in `pages`, aber nicht im Menü) — Menüeintrag
  „Mehrsprachigkeit" (+ `menu.po`-Übersetzung) und Link aus [`index.md`](input/pagecontent/index.md) ergänzt.
- `sushi-config.yaml`: irreführende Kommentare korrigiert — SNOMED/LOINC-Pinning
  via `path-expansion-params` (nicht als IG-Parameter); nicht existierenden
  `suppressed-ig-version`-Hinweis entfernt.
- [`.github/workflows/main.yml`](.github/workflows/main.yml): `RELEASE`-Job um `permissions: contents: write`
  ergänzt (Release-Erstellung schlug sonst in frischen Repos fehl).
- [`.github/workflows/ig-validate.yml`](.github/workflows/ig-validate.yml): Push-Trigger von `"**"` auf `main`/
  `hl7-ig-build` eingegrenzt (keine Doppel-Builds je PR-Commit); minimalen
  `permissions: contents: read`-Block ergänzt.
- [`.github/workflows/dependency-check.yml`](.github/workflows/dependency-check.yml): Label `dependencies` wird idempotent
  angelegt (sonst scheiterte `gh issue create` in frischen Repos).
- [`tools/check-updates.py`](tools/check-updates.py): Branch-Refs (`@master` etc.) und major-gepinnte
  Actions (`v4`) erzeugen keine False-Positive-Update-Issues mehr.
- [`_updatePublisher.bat`](_updatePublisher.bat): curl-Fehlschlag bricht ab (Parität zu `.sh`).
- [`README.md`](README.md): CI/CD-Setup-Tabelle (benötigte Secrets/Variablen für `main.yml`);
  Devcontainer-Aussage zur `publisher.jar` präzisiert.
- [`skills/mii-ig-migration/SKILL.md`](skills/mii-ig-migration/SKILL.md): Schritt 1 erzeugt `source-inventory`
  (nicht `migration-report`); [`MIGRATION.md`](MIGRATION.md) §11 verweist auf die Spec-§5a.2-Liste.
- [`input/includes/.gitkeep`](input/includes/.gitkeep) ergänzt (Verzeichnis war in README gelistet, fehlte
  aber in frischen Clones); [`DESIGN.md`](DESIGN.md): Logo-Platzhalter als bewusste
  kebab-case-Ausnahme dokumentiert.

### Fixed (Korrektur Übersetzungs-Mechanik, 2026-06-13)
- **Korrektur einer früheren Fehlannahme:** Commit `f2ca4bc` hatte
  `ImplementationGuide-<IG-id>.po` als „zwingend" und Menü-Übersetzung via
  `menu.po` dokumentiert — beides ist FALSCH (Publisher ignoriert IG- und
  Menü-`.po`). [`migration-agent-spec.md`](skills/mii-ig-migration/references/migration-agent-spec.md) §5, [`README.md`](README.md) und [`translationinfo.md`](input/pagecontent/translationinfo.md)
  auf die verifizierte Mechanik korrigiert (nur SD/CS/Questionnaire-Supplements
  rendern).
- Ignorierte `.po` aus dem Template entfernt: `input/translations/en/menu.po` und
  `ImplementationGuide-example.fhir.kds.sample.po`. Stattdessen funktionierendes
  Beispiel [`CodeSystem-mii-cs-beispiel-status.po`](input/translations/en/CodeSystem-mii-cs-beispiel-status.po). [`verify-template.sh`](tools/verify-template.sh) prüft jetzt
  auf ein Supplement eines unterstützten Typs und das Fehlen ignorierter `.po`.

### Added (2026-06-13, Übersetzung)
- Neuer Skill [`skills/ig-translate/`](skills/ig-translate/) (+ [`references/translate-spec.md`](skills/ig-translate/references/translate-spec.md),
  [`references/harvest-config.yaml`](skills/ig-translate/references/harvest-config.yaml)) und Tool [`tools/ig-translate.sh`](tools/ig-translate.sh) (scan/validate,
  kein Auto-Schreiben): übersetzt den IG ins Englische und legt Übersetzungen an die
  vom Publisher vorgesehenen Stellen. Modi **translate** (LLM de→en) und **harvest**
  (vorhandene EN-Fassung der Quelle übernehmen, z. B. MII KDS Person). In
  [`MIGRATION.md`](MIGRATION.md) als A4 (manuell) / B5 (KI) verankert.
- **Empirisch verifizierte Übersetzungs-Mechanik** (IG Publisher 2.2.7 + 2.2.8):
  Translation-Supplements `input/translations/<lang>/<Typ>-<id>.{po|xliff|json}`
  rendern NUR für StructureDefinition/CodeSystem/Questionnaire (Konstante
  `TRANSLATION_SUPPLEMENT_RESOURCE_TYPES`); ValueSet/ImplementationGuide/`menu.po`
  werden ignoriert; Narrative-Seiten (`<name>-<lang>.md`) werden noch nicht
  gerendert (HL7 „ToDo"). Beweis-Builds: CodeSystem-Supplement erscheint übersetzt
  unter `/en/`, Seitenübersetzung nicht.

### Added (2026-06-13)
- Neuer Skill [`skills/template-sanitize/`](skills/template-sanitize/) + Tool [`tools/template-sanitize.sh`](tools/template-sanitize.sh):
  entfernt nach validierter Migration die reinen Vorlage-/Migrations-Dateien aus
  einem migrierten Modul-Repo — Dry-Run-Default, `--apply` via `git rm`, nur im
  Branch `hl7-ig-build`, NEVER-Schutzliste für Modul-Inhalt/Build-Eingang. In
  [`MIGRATION.md`](MIGRATION.md) als Schritt A6b (manuell) / B4 (KI-gestützt) verankert, in
  Migrations-Spec §5a.2 als Alternative bei Komplett-Übernahme referenziert.

### Changed (2026-06-13)
- Migrations-Spec §5 Schritt 5: Abgrenzung ergänzt — `.po`-Kataloge übersetzen nur
  Metadaten/Menü, NICHT die Narrative-Seiteninhalte; der `/en/`-Hinweis „There is
  no translation page available …" ist bei „deutsch führend" erwartet (nicht ein
  Fehler). [`translationinfo.md`](input/pagecontent/translationinfo.md) um denselben Hinweis ergänzt.

### Fixed (Folge-Erkenntnis aus Dry-Run #3, 2026-06-13)
- Migrations-Spec §5 Schritt 5: zwingende `.po`-Benennung `ImplementationGuide-<IG-id>.po`
  (IG-`id`, nicht `packageId`) + msgid==dt. Quelltext dokumentiert. Ohne diese Regel
  wird die EN-Übersetzung still nie angewendet (in Dry-Run #1/#2 unbemerkt; erst
  Dry-Run #3 mit korrektem Dateinamen rendert den EN-Titel).

### Fixed (Re-Audit nach Dry-Run #3, 2026-06-13)
- `input/translations/en/menu.po`: fehlendes Submenü-Label `Szenarien` ergänzt
  (blieb sonst im EN-Output unübersetzt; alle anderen 12 Labels waren abgedeckt).
- `tools/verify-template.sh`: `--migrated`-Branchfilter-Check prüft jetzt die
  AKTIVE `branches:`-Zeile (Kommentare entfernt) statt eines beliebigen
  String-Vorkommens — der bisherige Check war ein No-Op (matchte den
  Hinweis-Kommentar) und konnte False-PASS liefern; main-Guard robuster
  (Inline- und Listenform).
- Migrations-Spec §4.2: korrigiert — `ignoreWarnings.txt` nutzt **kein Regex**,
  sondern Glob-Matching mit `%`-Wildcards; de-DE-Sprachwarnung daher per
  `%(de-DE)%` (contains, locale-stabil) unterdrücken statt per Regex.
