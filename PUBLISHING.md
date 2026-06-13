# PUBLISHING.md — Vorschau, Veröffentlichung & HL7-CI-Build

Anleitung für (1) Pages-Vorschau, (2) Release in die HL7-FHIR-Registry und (3)
die HL7-CI-Build-/Publishing-Kette. Build-Grundlagen siehe [`README.md`](README.md),
[`MIGRATION.md`](MIGRATION.md); Quellen-URLs siehe [`SOURCES.md`](SOURCES.md).

## 1. GitHub Pages: Vorschau einrichten
Der Workflow [`.github/workflows/ig-publish-pages.yml`](.github/workflows/ig-publish-pages.yml) baut das IG und deployt
`output/` über die offiziellen Actions `upload-pages-artifact` + `deploy-pages`.

**Einmalige Einstellung im Repository:**
- [ ] **Settings → Pages → Build and deployment → Source: „GitHub Actions"** (nicht „Deploy from a branch").
- [ ] Push auf `main` (oder „Run workflow"); Vorschau-URL danach unter **Settings → Pages** bzw. im Job „deploy" (`page_url`).

Die mehrsprachige Ausgabe liegt unter `/de/` und `/en/`; die Wurzel leitet sprachabhängig weiter.

**Alternative (klassisch):** Deployment aus einem `gh-pages`-Branch
(Source: „Deploy from a branch" → `gh-pages`). Dann muss ein Workflow das
`output/` dorthin schreiben (z. B. `peaceiris/actions-gh-pages`). Die
Actions-basierte Variante oben ist empfohlen.

> **Isolierter Branch:** Für ein bestehendes Modul-Repo den Pages-Build auf einen
> separaten Branch `hl7-ig-build` beschränken (Branch-Filter im Workflow); so bleibt
> der Default-Branch (`dev`/`master`/`main`) unverändert. Siehe [`MIGRATION.md`](MIGRATION.md) §11.

> Vorschau ≠ offizielle Publikation. Pages dient Review/Vorschau; die formale
> Veröffentlichung läuft über die HL7-Kette (Abschnitte 2–3).

## 2. Release in die HL7-FHIR-(Package-)Registry
Damit ein Package über `packages.fhir.org` / `registry.fhir.org` auffindbar wird,
genügt ein eigener **Package-Feed**, der in der zentralen `ig-registry`
registriert wird — eine HL7-Mitgliedschaft ist dafür nicht erforderlich.

**Schritte:**
- [ ] **Package erzeugen:** IG-Publisher-Build legt `output/package.tgz` (`example.fhir.kds.sample`) und `output/full-ig.zip` an.
- [ ] **Publikation hosten:** gebautes IG auf der kanonischen Website/Pages bereitstellen, inkl. versionsspezifischem Pfad (vgl. [`publication-request.json`](publication-request.json)).
- [ ] **Package-Feed erstellen:** RSS-`package-feed.xml` mit je einem Eintrag pro veröffentlichter Version (Verweis auf `package.tgz`). Vorlage: [`http://hl7.org/fhir/package-feed.xml`](http://hl7.org/fhir/package-feed.xml); generierbar mit `java -jar publisher.jar -generate-package-registry <webroot>`.
- [ ] **Feed registrieren:** Feed per Pull Request in [`https://github.com/FHIR/ig-registry/blob/master/package-feeds.json`](https://github.com/FHIR/ig-registry/blob/master/package-feeds.json) eintragen.
- [ ] **IG registrieren:** Eintrag in der `ig-registry` (npm-name, category, description, authority, country=`DE`, history, ci-build) per PR. Anleitung: [`https://registry.fhir.org/submit`](https://registry.fhir.org/submit).

`publication-request.json` (im Repo vorhanden) liefert die technischen
Publikationsangaben (package-id, version, path, status, realm).

> Hinweis Simplifier-Ablösung: Bislang wurden MII-Packages teils über den
> Simplifier-Feed ([`packages.simplifier.net/rssfeed`](https://packages.simplifier.net/rssfeed)) verteilt. Ohne Simplifier
> ist ein **eigener MII-Package-Feed** + Registrierung in `ig-registry`
> erforderlich (offener Punkt für die TF KDS).

## 3. HL7-CI-Build / Auto-Builder (verstehen & finden)
HL7 betreibt eine **automatische Build-Infrastruktur** (auto-ig-builder), die ein
registriertes öffentliches GitHub-IG-Repo bei jedem Push baut und unter
`build.fhir.org/ig/<org>/<repo>` rendert (CI-Build, keine formale Publikation).

- **Build-Status & Liste aller CI-IGs:** [`https://fhir.github.io/auto-ig-builder/builds.html`](https://fhir.github.io/auto-ig-builder/builds.html)
  (Klick auf `gh` führt zum jeweiligen Repo; QA-Page von dort erreichbar).
- **Aktivierung:** öffentliches Repo; Aufnahme in den Auto-Builder (Webhook bzw.
  Registrierung). **Nicht-öffentliche** IGs können den IG Publisher lokal nutzen,
  aber **nicht** die CI-Build-Infrastruktur.
- **Abgrenzung der drei Ebenen:**
  1. **CI-Build** (auto-ig-builder, `build.fhir.org`) — fortlaufende Vorschau.
  2. **GitHub-Pages** (dieses Repo) — eigene projektgesteuerte Vorschau.
  3. **Formale Publikation** — `publisher.jar -go-publish …` gegen `ig-registry`,
     `fhir-ig-history-template`, Web-Templates; für HL7-IGs zusätzlich der
     HL7-Publikationsprozess (FMG-Freigabe). Für nationale/Eigen-IGs erfolgt die
     Publikation auf der eigenen kanonischen Website + Feed-Registrierung (Abschnitt 2).

**Referenzen (URLs in `SOURCES.md`):** IG Publisher Documentation, HL7 Process for
Publishing a FHIR IG, „How to Publish a FHIR IG", FHIR/ig-registry, registry.fhir.org/submit.
