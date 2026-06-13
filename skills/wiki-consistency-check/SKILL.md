---
name: wiki-consistency-check
description: >-
  Prüft dieses Template-Repo auf Konsistenz und Vollständigkeit gegenüber den
  Vorgaben im MII-Meta-Wiki (kerndatensatz-meta/wiki) — Namenskonventionen,
  Terminologie-Policy, Reusable-Validation-Workflows, Dev Container, Release/
  Versionierung, Sprache und Ordnerstruktur. Aktivieren, wenn der Stand der Vorlage
  gegen die jeweils aktuelle Fassung des Wikis abgeglichen werden soll.
license: CC-BY-4.0
---

# Wiki-Konsistenzprüfung (Template ↔ MII-Meta-Wiki)

## Wann aktivieren
Vor einem Release der Vorlage oder periodisch, um Drift gegenüber dem maßgeblichen
MII-Meta-Wiki frühzeitig zu erkennen.

## Quelle (SSOT)
[MII-Meta-Wiki](https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki)
Lokal klonen: `git clone https://github.com/medizininformatik-initiative/kerndatensatz-meta.wiki.git`

## Ablauf
1. **Wiki beziehen.** Wiki klonen (oder Seiten abrufen); relevante Seiten lesen
   (siehe `references/check-matrix.md`).
2. **Vergleichen.** Je Prüfbereich Repo-Artefakt gegen Wiki-Vorgabe abgleichen
   (Liste in `references/check-matrix.md`).
3. **Berichten.** Ergebnis als Tabelle: Bereich · Repo-Stand · Wiki-Vorgabe ·
   `OK`/`ABWEICHUNG`/`UNKLAR` · Empfehlung. Ausgabe nach `.ai-log/wiki-consistency-report.md`.
4. **Nicht eigenmächtig ändern.** Nur berichten/Vorschläge machen; Korrekturen
   erfolgen durch Menschen bzw. nach Freigabe (kein Auto-Merge).

## Prüfbereiche (Kurzform; Details: references/check-matrix.md)
- **Namenskonventionen** — Präfix-Liste & Regex in `qc/custom.rules.yaml` vs. Wiki
  „Namenskonventionen"; `name`=Upper_Snake_Case, `id`=kebab, `title`-Muster.
- **Terminologie** — `TERMINOLOGY.md`/`sushi-config.yaml` vs. „Terminology Version
  Policy" (SNOMED-Version je CalVer, Instanz-`Coding.version` ICD-10-GM/OPS/ATC).
- **CI** — `.github/workflows/main.yml` vs. „GitHub Reusable Validation Workflows"
  (ci_dotnet/ci_java/RELEASE/NOTIFY_ZULIP, `advisor.json`, `qc/custom.rules.yaml`).
- **Dev Container** — `.devcontainer/devcontainer.json` vs. „Dev Container ‐ IG
  Publisher".
- **Release/Versionierung** — Tag-Format & Ablauf vs. „Module Release Workflow".
- **Sprache** — `i18n-default-lang: de`, Translation-Extension auf Conformance-
  Ressourcen vs. „Namenskonventionen → Sprache".
- **Ordnerstruktur** — vs. „Übersicht Ordnerstruktur" / „Reusable Workflows".

## Grenzen
Wiki-Inhalte können sich ändern; maßgeblich ist stets die aktuelle Online-Fassung.
Der Skill prüft Struktur/Konventionen, nicht fachliche Modellinhalte.

## Referenzen
- `references/check-matrix.md` — konkrete Prüfpunkte (Repo-Datei ↔ Wiki-Seite)
