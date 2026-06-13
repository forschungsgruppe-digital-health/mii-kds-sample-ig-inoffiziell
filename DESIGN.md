# DESIGN.md — Logo, Layout/Design & Versionierung

## 1. Logo & Branding
- Das Repo enthält einen **Platzhalter** `input/images/mii-logo-PLATZHALTER.svg`
  (ausdrücklich NICHT das offizielle Logo).
- **Einbau des offiziellen MII-Logos** (Marke der MII; separat von der MII zu
  beziehen, Nutzungsrechte beachten):
  1. Offizielle Logodatei als `input/images/mii-logo.png` (o. ä.) ablegen.
  2. Verweise in `input/pagecontent/index.md` auf die echte Datei umstellen.
  3. Für ein durchgängiges Header-/Template-Branding ein **Custom-Template als
     Erweiterung** des HL7-Basis-Templates anlegen (HL7 „Extending the HL7 IG
     Templates"): lokales Template mit `package.json` (`base: hl7.fhir.template`)
     und `content/assets/images/<logo>`; in `ig.ini` referenzieren.

## 2. Layout / Design (Template)
- Template in `ig.ini`: **`fhir2.base.template`** (gewählt; neuere Generation, vom
  MII-Basis-IG genutzt). `fhir.base.template` wird **nicht** verwendet — Grund:
  gemeldete Security-Issues über NPM/SUSHI-Abhängigkeiten.
- Seitenraster/Menü folgen HL7-Best-Practice (Home/Guidance/Conformance/Artifacts/
  Downloads/Versioning); Navigation ist deutsch geführt, EN über `.po`.
- MII-spezifische Farben/Typografie ggf. über das Custom-Template (s. o.).

## 3. Versionierung (gemäß KDS-Governance)
- **Schema:** Calendar Versioning `YYYY.MINOR.PATCH` (Beispiel `2026.0.0`). Die
  Version bezieht sich auf das **Modul**, nicht auf einzelne Ressourcen.
- **Conformance-Ressourcen:** `.version` auf die Modulversion setzen.
- **MAJOR (Jahresversion):** Anwendungsjahr; Jahreswechsel impliziert nicht
  automatisch Breaking Changes (anders als SemVer).
- **MINOR (Arbeitsversion):** neue Funktionen/substanzielle Änderungen; keine
  NSG-Freigabe erforderlich.
- **PATCH:** Bugfixes/textuelle Korrekturen; ohne Partizipation anderer Teams.
- **Breaking Changes** sind in den Release Notes (`changes.md`) zu vermerken.
- **Release-Rhythmus (Richtwert):** NSG-Freigabe bis Jahresende; ggf.
  Kommentierung bis Ende November; Auslieferung neuer Jahresversion bis Ende Januar;
  DIZ-Umstellung bis Ende Mai. Altversionen werden eingefroren/archiviert.

## 4. Sprache
Deutsch führend/verbindlich (gemäß KDS-Governance); FHIR-Bezeichner englisch; EN-Übersetzung optional.

## 5. Dateinamen-Konventionen
Einheitliche, an die jeweilige Kategorie angepasste Schreibweise:

- **Top-Level-Dokumente** (Großschreibung, im Repo-Wurzelverzeichnis): mehrteilige
  Namen mit **Underscore** — `AI_USAGE.md`, `CODE_OF_CONDUCT.md`, `COMMENT_RESOLUTION.md`.
  Begründung: Konsistenz mit den von GitHub erkannten Community-Dateien
  (`CODE_OF_CONDUCT.md`, `ISSUE_TEMPLATE`, `PULL_REQUEST_TEMPLATE.md`), die Underscores
  verwenden. **Keine** Mischung mit Bindestrichen auf dieser Ebene.
- **IG-Seiteninhalte** (`input/pagecontent/`) und **Assets** (`input/images/`):
  **lowercase-kebab-case** — `use-cases.md`, `data-sets.md`, `security-privacy.md`.
  Begründung: stabile, kleingeschriebene URL-/Dateipfade. **Bewusste Ausnahme:**
  `mii-logo-PLATZHALTER.svg` — das großgeschriebene `PLATZHALTER` ist ein
  Warnsignal und entfällt mit dem Einbau des offiziellen Logos (§1).
- **FSH-Quelldateien** (`input/fsh/`): kebab-case nach Artefaktgruppe (`profile.fsh`,
  `valueset.fsh` …).
- **FHIR-Artefakt-Bezeichner** (in den FSH-Dateien, nicht Dateinamen): `name` =
  Upper_Snake_Case mit Präfix, `id` = kebab-case. Maßgeblich und maschinell geprüft:
  `qc/custom.rules.yaml` (Single Source of Truth) + MII-Meta-Wiki.
