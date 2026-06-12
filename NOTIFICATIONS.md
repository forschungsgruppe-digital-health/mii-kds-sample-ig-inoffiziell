# NOTIFICATIONS.md — Benachrichtigung von DIZ über neue Entwicklungen

Vorschlag, wie Datenintegrationszentren (DIZ) und andere Implementierende über
neue Versionen/Änderungen eines Moduls informiert werden — inkl. abonnierbarer
Feeds.

## 1. Offizieller MII-Kanal: Zulip
Für MII-Module ist der maßgebliche Ankündigungskanal der **MII-Zulip-Chat**,
Stream **„MII-Kerndatensatz" → Topic „Releases"** (`https://mii.zulipchat.com/`).
Der offizielle Reusable-Release-Workflow (`NOTIFY_ZULIP`) postet neue Releases dort
automatisch. DIZ können diesen Stream/Topic abonnieren.

## 2. GitHub Releases
Jede freigegebene Modulversion (CalVer, z. B. `2026.0.0`) wird als **GitHub
Release** veröffentlicht (mit Release Notes / Changelog). Releases sind der
stabile, versionierte Ankerpunkt für Benachrichtigungen.
- Automatisierung: der `RELEASE`-Job in `.github/workflows/main.yml` erstellt bei
  einem Versions-Tag (`v[major].[minor].[patch][-suffix]`) ein (Entwurfs-)Release.

## 3. Abonnierbare Feeds (RSS/Atom) — ohne GitHub-Konto nutzbar
GitHub stellt für jedes Repo native Atom-Feeds bereit, die in jedem RSS-Reader
abonniert werden können (`<org>/<repo>` ersetzen):
- **Releases:** `https://github.com/<org>/<repo>/releases.atom`  ← empfohlen für DIZ
- **Tags:** `https://github.com/<org>/<repo>/tags.atom`
- **Commits eines Branch:** `https://github.com/<org>/<repo>/commits/main.atom`

## 4. GitHub-„Watch" (für GitHub-Nutzer)
Auf der Repo-Seite **Watch → Custom → Releases** auswählen: DIZ-Mitarbeitende mit
GitHub-Konto erhalten dann Web-/E-Mail-Benachrichtigungen ausschließlich zu neuen
Releases (ohne Issue-/PR-Rauschen).

## 5. FHIR-Package-Feed (für FHIR-Tooling)
Für werkzeuggestützte Pipelines: der in `PUBLISHING.md` §2 beschriebene
**`package-feed.xml`** (registriert in `FHIR/ig-registry`) wird von FHIR-Tools und
der FHIR-Registry ausgewertet — so erkennen Paketmanager neue Paketversionen.

## 6. Ergänzende Kanäle (optional)
- **GitHub Discussions → Announcements** als menschenlesbarer Ankündigungskanal
  (ebenfalls als `/discussions` abonnierbar).
- **CHANGELOG / `changes.md`** im IG als kanonische Änderungsdokumentation.
- **HL7-Deutschland-Newsletter/Mailingliste** für offizielle Verfahren
  (Ankündigung von Kommentierungs-/Ballotierungsphasen, vgl. `COMMENT_RESOLUTION.md`).

## Empfehlung
Für DIZ: **Releases-Atom-Feed abonnieren** (Abschnitt 2) oder **Watch → Releases**
(Abschnitt 3); für automatisierte Build-Pipelines zusätzlich den
**FHIR-Package-Feed** (Abschnitt 4). Verbindliche Verfahrensankündigungen laufen
über die HL7-DE-Kanäle.
