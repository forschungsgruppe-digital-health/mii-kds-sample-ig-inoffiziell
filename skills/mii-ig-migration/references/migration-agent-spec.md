# Herstelleragnostische KI-Agenten-Spezifikation
## Migration eines Simplifier-basierten MII-KDS-IG → HL7 FHIR IG (mehrsprachig)

**Version:** 1.0 · **Stand:** 2026 · **Lizenz:** CC-BY-4.0

Diese Spezifikation beschreibt einen **herstelleragnostischen** KI-Agenten, der die
Migration eines bestehenden, auf Simplifier publizierten MII-KDS-Moduls in einen
IG-Publisher-basierten, mehrsprachigen HL7 FHIR IG **unterstützt und
teilautomatisiert** — mit verpflichtender **abschließender menschlicher
Begutachtung**. Sie ist als Task-/System-Spezifikation formuliert und auf
beliebige tool-fähige Sprachmodelle/Agenten anwendbar (z. B. Anthropic Claude,
OpenAI GPT/Codex, weitere). Vendorspezifische Hinweise stehen in Anhang A.

---

### 1. Zielsetzung
Überführung eines Quell-IG in das Zielformat dieses Repos (Sample-IG), strukturell
konform zum MII-KDS-Meta-Manteldokument (jeweils aktuelle Fassung) und zu den
HL7-IG-Best-Practices, deutsch geführt (KDS-Governance), englisch optional.

### 2. Eingaben (vom Menschen bereitzustellen)
- `SOURCE_RENDERED_IG_URL` — URL des gerenderten Simplifier-IG. *(Platzhalter: [URL])*
- `SOURCE_REPO_URL` — URL des zugehörigen Quell-GitHub-Repos. *(Platzhalter: [URL])*
- `TARGET_TEMPLATE_REPO` — dieses Sample-IG-Repo als Zielvorlage.
- `MODULE_METADATA` — modul-identifizierende Parameter (präzise: §2.1).

### 2.1 `MODULE_METADATA` — präzise Definition
Der **Satz modul-identifizierender Parameter**, den der Agent in `sushi-config.yaml`
(und `package.json`) schreibt. **Bestandsschutz/Quelle bevorzugen:** soweit im Quell-Repo
oder gerenderten IG bereits vorhanden, werden die Werte **von dort übernommen** und
nicht neu erfunden; der Mensch liefert/bestätigt v. a. die **Zielversion**.

| Feld | Bedeutung | Beispiel (offiziell · inoffizielle Vorlage) | Zielort |
|------|-----------|---------------------------------------------|---------|
| `module_name` | Klartext-Modulname | „Diagnose" · „Beispiel" | `title`, Menü, README |
| `module_abbr` | Modul-Kürzel als Bestandteil des Artefakt-`name` (Upper_Snake_Case) | `Diagnose` → `MII_PR_Diagnose_…` | FSH `name`/`title` |
| `package_id` | FHIR-Package-/IG-`id` (Reverse-Domain) | `de.medizininformatikinitiative.kerndatensatz.diagnose` · `example.fhir.kds.sample` | `sushi-config.yaml: id`, `package.json: name` |
| `canonical` | Canonical-Basis-URL | `https://www.medizininformatik-initiative.de/fhir/diagnose` · `https://example.org/fhir/kds-sample` | `sushi-config.yaml: canonical` — **nicht ändern (Bestandsschutz)** |
| `version` | CalVer `YYYY.MINOR.PATCH[-suffix]` | `2026.0.0` · `2026.0.0-ballot` | `sushi-config.yaml: version`, `package.json: version`, Release-Tag |
| `status` / `releaseLabel` | IG-Status / Release-Label | `draft`/`ballot` · `active`/`release` | `sushi-config.yaml: status`, `releaseLabel` |
| `dependencies` | **exakt gepinnte** Abhängigkeiten | `de.basisprofil.r4: 1.5.4` | `sushi-config.yaml: dependencies` |
| `publisher` / `contact` | Herausgeber/Kontakt (in der Vorlage neutral) | „Inoffizielle Vorlage (Beispiel-Publisher)" | `sushi-config.yaml: publisher` |

**Offiziell vs. inoffiziell:** In dieser inoffiziellen Vorlage sind `package_id`,
`canonical` und `publisher` bewusst neutral (`example.*`). Bei einer realen Migration die
**bestehenden offiziellen Werte aus der Quelle** verwenden.

### 3. Benötigte Fähigkeiten/Werkzeuge (abstrakt, nicht herstellerspezifisch)
- **Web-Abruf/Extraktion:** Lesen und strukturierte Extraktion des gerenderten IG.
- **Repository-Zugriff:** Klonen/Lesen des Quell-Repos (read-only).
- **Datei-IO:** Schreiben in einen Arbeits-Branch des Ziel-Repos.
- **Shell-Ausführung:** `sushi`, IG Publisher, optional `gofsh` (JSON/XML → FSH).
- **Terminologie-Validierung:** optional gegen einen FHIR-Terminologieserver.
- **Versionskontrolle:** Branch + Pull Request; **kein** direkter Push auf `main`.

### 4. Verbindliche Leitplanken (Guardrails)
1. **URL-/ID-Bestandsschutz:** Canonical URLs und IDs bestehender
   Conformance-Ressourcen werden **nicht** verändert.
2. **Sprachführung:** Deutsch ist Quell-/Default-Sprache (`i18n-default-lang: de`);
   Englisch optional. FHIR-Artefakt-Bezeichner bleiben englisch.
   In `sushi-config.yaml` `language: de` setzen (nicht `de-DE`), passend zur
   i18n-Mechanik. Hinweis: Setzt das Quell-FSH auf Ressourcen explizit
   `^language = #de-DE`, meldet der IG Publisher pro betroffener Ressource eine
   Sprach-Mismatch-Warnung (Ressource `de-DE` vs. XHTML `de`). Diese ist
   kosmetisch (BCP 47: `de-DE` ist Subtag von `de`) und durch das i18n-Feature
   bedingt — sie wird **mit Begründungskommentar** in
   `input/ignoreWarnings.txt` des Moduls ergänzt (FSH bleibt unverändert,
   Guardrail 1). `ignoreWarnings.txt` nutzt **kein Regex**, sondern Glob-Matching
   mit `%`-Wildcards (`%text%` = enthält, case-insensitiv). Da der IG Publisher
   die Meldung je nach JVM-Locale deutsch oder englisch ausgibt, auf das
   locale-stabile Token matchen: `%(de-DE)%`.
3. **FHIR-Version:** R4 (4.0.1).
4. **Keine Fakten-Erfindung:** Jedes migrierte Artefakt und jeder Narrativ-Abschnitt
   wird auf eine Quellstelle (URL/Repo-Pfad) zurückgeführt; Unklarheiten werden
   markiert (`TODO:REVIEW`), nicht geraten.
5. **Vollständigkeit der Pflichtabschnitte:** Die im Manteldokument verbindlichen
   Abschnitte (inkl. „Bezüge zu anderen Modulen", „Referenzen",
   „Anwendungsfälle/Szenarien") müssen vorhanden sein.
6. **Mensch-im-Loop:** Definierte Review-Gates (Abschnitt 6) sind verpflichtend;
   der Agent führt keine Veröffentlichung durch.
7. **Nachvollziehbarkeit:** Alle Schritte, Annahmen und offenen Punkte werden in
   `.ai-log/migration-report.md` protokolliert.
8. **Vorlagen-Beispiele entfernen:** Die Beispiel-Ressourcen der Vorlage
   (`input/fsh/examples.fsh` und zugehörige Beispiel-Instanzen) werden **vor** der
   Migration **gelöscht** und **nicht** übernommen/gemergt — zur Vermeidung von
   Konflikten mit den realen Modul-Beispielen.
9. **Default-Branch-Schutz:** `dev`/`master`/`main` werden **nicht** verändert. Die
   Migration erfolgt in einem **isolierten Branch** (Standard: `hl7-ig-build`); ein
   PR geht ausschließlich in diesen Branch, nicht in den Default-Branch.

### 5. Arbeitsablauf (Schritte → Ausgaben → Akzeptanzkriterien)
1. **Inventarisierung Quelle.** Extrahiere aus `SOURCE_RENDERED_IG_URL` und
   `SOURCE_REPO_URL` die Artefaktliste (Profile, Extensions, ValueSets,
   CodeSystems, CapabilityStatements, Beispiele) und die Narrativ-Struktur.
   → Ausgabe: `.ai-log/source-inventory.json`. → Kriterium: Inventar vollständig,
   jede Position mit Quellpfad.
2. **Skelett anlegen.** Kopiere die Zielvorlage; setze `ig.ini`/`sushi-config.yaml`
   (id, canonical, version, dependencies, Menü, i18n=de/en). **Lösche die
   Vorlagen-Beispiele** (`input/fsh/examples.fsh`, Beispiel-Instanzen). → Kriterium:
   `sushi .` läuft fehlerfrei; keine Vorlagen-Beispiele mehr vorhanden.
3. **Artefakte überführen.** Übernimm FSH-Quellen aus dem Quell-Repo; liegen nur
   JSON/XML vor, konvertiere mit `gofsh`. IDs/URLs unverändert. → Kriterium:
   SUSHI-Build erzeugt alle Artefakte; Diff der Canonical URLs = leer.
4. **Narrative migrieren (Crosswalk).** Überführe Manteldokument-Inhalte in
   `input/pagecontent/*.md` (deutsch). Ergänze fehlende Pflichtabschnitte.
   **Simplifier-/FQL-Direktiven** (`{{render}}`, `{{pagelink}}`, `{{tree}}`,
   `<fql>`, ``@``` ``, `<tabs>` …) gemäß `references/fql-crosswalk.md` in
   IG-Publisher-Äquivalente überführen (Artefakt-Links, `{% include %}`-Fragmente,
   lokale Bilder). Vorgehen: `tools/fql-scan.sh` ausführen → je Fund die Empfehlung
   anwenden; mehrdeutige Fälle mit fachlichem Urteil, im Zweifel `TODO:REVIEW`
   (Guardrail 4). Maßgebliche, **erweiterbare** Regeln: `references/fql-rules.tsv`.
   → Kriterium: alle Pflichtseiten vorhanden, keine leeren Pflichtabschnitte;
   `fql-scan` meldet keine `[UNBEKANNT]` und keine ungewollt verbliebenen Direktiven.
5. **Mehrsprachigkeit (optional, Deutsch führend).** Verifizierte Mechanik des IG
   Publishers (2.2.x) — Details/Skill: `skills/ig-translate/`:
   - **Ressourcen-Texte (rendern):** je StructureDefinition/CodeSystem/Questionnaire
     ein Translation-Supplement `input/translations/<lang>/<ResourceType>-<id>.po`
     (`msgid` = exakter dt. Quelltext aus `fsh-generated/resources/<Typ>-<id>.json`,
     `msgstr` = englisch). Nur diese drei Typen sind unterstützt
     (`TRANSLATION_SUPPLEMENT_RESOURCE_TYPES`).
   - **Nicht unterstützt:** **ValueSet**, **ImplementationGuide**-Titel/-Beschreibung
     und **Menü** — entsprechende `.po` (`ImplementationGuide-*.po`, `menu.po`)
     werden vom Publisher **ignoriert**; nicht anlegen.
   - **Narrative-Seiten:** Übersetzung als Geschwisterdatei
     `input/pagecontent/<name>-<lang>.md`. Wird vom aktuellen Publisher/Template
     **noch nicht** gerendert (HL7 „ToDo"); zukunftssicher anlegen. `/en/`-Seiten
     zeigen bis dahin Deutsch + Standardhinweis „There is no translation page
     available …" — bei „deutsch führend, Englisch optional" **erwartet**.
   → Kriterium: IG baut `/de/` und `/en/`; übersetzte Element-Texte erscheinen auf
   den `/en/`-Artefaktseiten; keine ignorierten Falsch-`.po` (`tools/ig-translate.sh
   --validate <lang>`).
6. **Build & QA.** IG Publisher ausführen. → Kriterium: `qa.txt` „Errors: 0";
   alle Beispiele valide.
7. **Bericht.** Schreibe `.ai-log/migration-report.md` (Mapping-Tabelle, Annahmen,
   `TODO:REVIEW`-Liste, QA-Zusammenfassung). → Kriterium: jeder offene Punkt
   adressiert oder markiert.
8. **Pull Request.** Öffne PR **in den isolierten Branch `hl7-ig-build`** (nicht
   `main`) mit dem Bericht als Beschreibung. **Keine** Veröffentlichung; der
   Default-Branch bleibt unverändert.

### 5a. Anwendung auf ein bestehendes MII-KDS-Modul-Repo (isolierter Branch & Pages)
Das Template wird so auf ein bestehendes Modul-Repo angewendet, dass **dev/master/
main unangetastet** bleiben:
1. **Branch anlegen:** ausgehend vom Default-Branch einen separaten Branch
   `hl7-ig-build` erstellen (nur für den IG-Publisher-Build; wird **nie** in den
   Default-Branch gemergt).
2. **Template einbringen** — präzise Dateiliste:
   - **Übernehmen:** `ig.ini` und `sushi-config.yaml` (mit `MODULE_METADATA`
     befüllt, §2.1), Seitengerüst `input/pagecontent/`, `input/translations/`,
     `input/images/`, `tools/verify-template.sh` (Abnahme: `--migrated`-Modus),
     Workflows `ig-validate.yml` und `ig-publish-pages.yml` (Branch-Filter auf
     `hl7-ig-build` umstellen, Schritt 3), `_genonce.*`/`_updatePublisher.*`
     nur, falls im Modul nicht vorhanden.
   - **Nicht übernehmen/überschreiben:** `README.md` und bestehende CI des Moduls
     (z. B. `main.yml` mit MII-Reusable-Workflows), kuratierte
     `input/ignoreWarnings.txt` und `qc/` des Moduls, `input/fsh/` der Vorlage
     (**Vorlagen-Beispiele löschen**, Guardrail 8) sowie die Governance-/
     Template-Doku (`CONTRIBUTING.md`, `ROLES.md`, `COMMENT_RESOLUTION.md`,
     `DESIGN.md`, `SOURCES.md`, …) — diese gehört zum Template-Repo, nicht in
     ein migriertes Modul.
   - Die **realen FSH-Artefakte** des Moduls (`input/fsh/…`) bleiben unverändert.
   - **Alternative bei Komplett-Übernahme:** Wurde die Vorlage doch als Ganzes
     übernommen, statt selektiv, kann der Skill `skills/template-sanitize/` die
     reinen Vorlage-/Migrations-Dateien nach validierter Migration deterministisch
     und auf Bestätigung entfernen (Dry-Run-Default; dieselbe Übernehmen-/
     Nicht-übernehmen-Logik wie hier).
3. **Bauen via Pages:** GitHub Pages für das Repo auf **Source = GitHub Actions**
   stellen und in `ig-publish-pages.yml` den Branch-Filter von `main` auf
   **`hl7-ig-build`** umstellen, sodass der Workflow **nur auf `hl7-ig-build`**
   läuft. Der gerenderte IG wird veröffentlicht, ohne den Default-Branch zu
   berühren.
4. **Einbinden:** die Pages-URL (bzw. den IG) im Modul-README/Wiki **verlinken**.
5. **PR-Disziplin:** Arbeits-/Feature-Branches werden **in `hl7-ig-build`**
   gemergt (PR-Ziel = `hl7-ig-build`), niemals in `dev`/`master`/`main`.

So entsteht eine vollständig **additive**, rückbaubare IG-Publikation parallel zum
bestehenden (Forge-/Simplifier-)Workflow des Moduls.

### 6. Verpflichtende menschliche Review-Gates
- **Gate A (nach Schritt 3):** Fachprüfung URL-/ID-Bestandsschutz und
  Artefaktvollständigkeit.
- **Gate B (nach Schritt 4):** Inhaltliche Prüfung der Narrative, insbesondere der
  ergänzten Pflichtabschnitte.
- **Gate C (nach Schritt 5):** Prüfung der Sprachführung/Übersetzung.
- **Gate D (vor Merge/Publikation):** Freigabe gemäß KDS-Governance
  (TF KDS / AG IOP / NSG). Erst danach greift der Pages-Workflow.

### 7. Definition of Done
`sushi .` und IG-Publisher-Build fehlerfrei (`Errors: 0`); Manteldokument-Crosswalk
vollständig; Canonical-URL-Diff leer; Sprachkonfiguration de-führend;
**Vorlagen-Beispiele entfernt**; Arbeit ausschließlich im Branch `hl7-ig-build`
(Default-Branch unverändert); PR (Ziel `hl7-ig-build`) mit `migration-report.md`;
alle Review-Gates abgezeichnet.

### 8. Nicht-Ziele
Keine inhaltlich-fachliche Neumodellierung; keine Änderung normativer Festlegungen;
keine eigenständige Veröffentlichung; keine Erfindung fehlender fachlicher Inhalte.

---

## Anhang A — Herstellerspezifische Instanziierung (informativ)
Die Spezifikation ist capability-basiert; jeder Agent mit den Fähigkeiten aus
Abschnitt 3 ist geeignet. Beispiele:

- **Anthropic Claude:** Ausführung z. B. via Claude Code / agentische Umgebung;
  Web-Abruf, Datei- und Shell-Werkzeuge, MCP-Server für Git/FHIR-Tools; diese
  Datei als Task-/System-Spezifikation.
- **OpenAI GPT/Codex:** Coding-Agent bzw. Assistants/Function-Calling mit
  Werkzeugen für Web-Abruf, Dateisystem und Shell; diese Datei als Entwickler-/
  System-Anweisung.
- **Sonstige tool-fähige Agenten:** Mapping der Fähigkeiten aus Abschnitt 3 auf die
  jeweilige Tool-/Permission-Schnittstelle; `references/agent-manifest.yaml` deklariert die
  benötigten Berechtigungen herstellerneutral.

## Anhang B — Vendor-neutrales Prompt-Gerüst
> **Rolle:** Du bist ein Migrations-Assistent für FHIR Implementation Guides.
> **Aufgabe:** Überführe den Quell-IG (`SOURCE_RENDERED_IG_URL`, `SOURCE_REPO_URL`)
> in das Zielformat (`TARGET_TEMPLATE_REPO`) gemäß dieser Spezifikation.
> **Beachte:** Leitplanken (Abschnitt 4) sind verbindlich. Arbeite die Schritte
> (Abschnitt 5) der Reihe nach ab, protokolliere in `.ai-log/migration-report.md`, halte
> an jedem Review-Gate (Abschnitt 6) an und übergib an den Menschen. Verändere keine
> bestehenden Canonical URLs/IDs. Erfinde keine fachlichen Inhalte; markiere
> Unklarheiten mit `TODO:REVIEW`. Veröffentliche nicht. Entferne die Vorlagen-Beispiele vor der Migration. Arbeite ausschließlich im Branch `hl7-ig-build` und öffne PRs nur in diesen Branch — niemals in `dev`/`master`/`main`.
