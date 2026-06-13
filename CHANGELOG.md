# Changelog

Wird **abschließend beim Finalisieren** der Vorlage erstellt.
Format: [Keep a Changelog](https://keepachangelog.com/de/1.1.0/); Versionierung CalVer
(`JJJJ.MINOR.PATCH`).

> Inhaltliche Release Notes des IG-Moduls stehen separat unter
> `input/pagecontent/changes.md`.

## [Unreleased]
_(in Arbeit — Einträge werden zum Abschluss zusammengeführt)_

### Fixed (Befunde aus Migrations-Dry-Run am Modul Dokument, 2026-06-12)
- `sushi-config.yaml`: ungültigen IG-Parameter `show-inherited-extensions` entfernt
  (nicht in `ig-parameters|1.1.2`; verursachte 4 Publisher-Validierungsfehler).
- Skill-Discovery-Symlinks ergänzt: `.claude/skills` und `.agents/skills` → `skills/`,
  `CLAUDE.md` → `AGENTS.md` (in `AGENTS.md` dokumentiert, fehlten aber).
- `_genonce.sh` **und** `_genonce.bat`: Preflight-Prüfung auf Jekyll (Build schlug
  sonst erst nach Minuten am letzten Schritt fehl); Ruby/Jekyll als Voraussetzung
  in `MIGRATION.md` §1 und im README-Schnellstart ergänzt.
- `_genonce.bat`: `call` vor `npm`/`sushi` ergänzt (`.cmd`-Wrapper — ohne `call`
  kehrte das Skript nach `sushi .` nie zurück, der Publisher lief nie) sowie
  Fehlerabbruch (`|| exit /b 1`) analog `set -euo pipefail`; `_updatePublisher.bat`:
  curl-Fehlschlag bricht jetzt mit Fehlermeldung ab.
- Spec §4.2: Umgang mit i18n-bedingten Sprach-Mismatch-Warnungen definiert
  (Quell-FSH `^language = #de-DE` vs. XHTML `de`): kosmetisch, wird mit
  Begründung in `input/ignoreWarnings.txt` des Moduls unterdrückt.
- `tools/verify-template.sh`: neuer Modus `--migrated` (nur IG-relevante
  Prüfungen für migrierte Modul-Repos); CapabilityStatement-Prüfung
  pfadunabhängig (`InstanceOf:`-Suche statt festem Dateinamen).
- `ig-publish-pages.yml`: Hinweis auf Branch-Filter `hl7-ig-build` bei Anwendung
  auf ein bestehendes Modul-Repo (Spec §5a.3).
- Migrations-Spec §5a.2: präzise Übernahme-/Ausschlussliste der Template-Dateien
  (u. a. Modul-`README`/-CI/`ignoreWarnings.txt` nicht überschreiben).
- `input/pagecontent/*`: defekte Relativlinks `../../ROLES.md` (brachen im
  gerenderten IG) durch Klartext-Verweis ersetzt.

### Fixed (Stabilitäts-Audit des Templates, 2026-06-13)
- `publication-request.json`: ungültigen `status: ci-build` → `draft`; veraltetes
  `milestone: false` → `mode: working`; `category: National Base` ergänzt;
  `ci-build`-URL von fremder MII-Org auf das tatsächliche Repo umgestellt.
- `input/translations/en/`: EN-Katalog von alter Package-Id-Benennung auf
  `ImplementationGuide-example.fhir.kds.sample.po` umbenannt (sonst nie angewendet);
  veraltete `msgid` (Publisher, Description) mit `sushi-config.yaml` synchronisiert.
- `translationinfo.md`: war Orphan (in `pages`, aber nicht im Menü) — Menüeintrag
  „Mehrsprachigkeit" (+ `menu.po`-Übersetzung) und Link aus `index.md` ergänzt.
- `sushi-config.yaml`: irreführende Kommentare korrigiert — SNOMED/LOINC-Pinning
  via `path-expansion-params` (nicht als IG-Parameter); nicht existierenden
  `suppressed-ig-version`-Hinweis entfernt.
- `.github/workflows/main.yml`: `RELEASE`-Job um `permissions: contents: write`
  ergänzt (Release-Erstellung schlug sonst in frischen Repos fehl).
- `.github/workflows/ig-validate.yml`: Push-Trigger von `"**"` auf `main`/
  `hl7-ig-build` eingegrenzt (keine Doppel-Builds je PR-Commit); minimalen
  `permissions: contents: read`-Block ergänzt.
- `.github/workflows/dependency-check.yml`: Label `dependencies` wird idempotent
  angelegt (sonst scheiterte `gh issue create` in frischen Repos).
- `tools/check-updates.py`: Branch-Refs (`@master` etc.) und major-gepinnte
  Actions (`v4`) erzeugen keine False-Positive-Update-Issues mehr.
- `_updatePublisher.bat`: curl-Fehlschlag bricht ab (Parität zu `.sh`).
- `README.md`: CI/CD-Setup-Tabelle (benötigte Secrets/Variablen für `main.yml`);
  Devcontainer-Aussage zur `publisher.jar` präzisiert.
- `skills/mii-ig-migration/SKILL.md`: Schritt 1 erzeugt `source-inventory`
  (nicht `migration-report`); `MIGRATION.md` §11 verweist auf die Spec-§5a.2-Liste.
- `input/includes/.gitkeep` ergänzt (Verzeichnis war in README gelistet, fehlte
  aber in frischen Clones); `DESIGN.md`: Logo-Platzhalter als bewusste
  kebab-case-Ausnahme dokumentiert.

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
