# TERMINOLOGY.md — Terminologie, Versionen & Lizenzen

Leitfaden für die Terminologie-Anbindung. Maßgeblich ist die **„Terminology Version
Policy"** im MII-Meta-Wiki; dieses Dokument fasst sie für die Vorlage zusammen. Das
mitgelieferte Beispiel bindet bewusst nur ein lokales CodeSystem und benötigt daher
noch keinen externen Terminologieserver.

## 1. Terminologieserver
- **MII (Java-Validierung):** SU-TermServ (`https://www.ontoserver.mii-termserv.de/`)
  — wird vom offiziellen Reusable-Validation-Workflow genutzt.
- **Generischer Default (IG Publisher / Firely):** `tx.fhir.org`.

## 2. SNOMED-CT-Versionspolitik (Reproduzierbarkeit)
Je MII-Release (CalVer) wird SNOMED CT an eine **datierte INTERNATIONAL-Version**
gebunden, damit ValueSet-Expansions reproduzierbar sind:

| MII-Release (CalVer) | SNOMED CT International Version |
|----------------------|--------------------------------|
| v2025.*              | `http://snomed.info/sct/900000000000207008/version/20240701` |
| v2026.*              | `http://snomed.info/sct/900000000000207008/version/20250701` |

Bindung im ValueSet (empfohlenes FHIR-Muster): `system = http://snomed.info/sct`,
`version = <datierte Version oben>`, plus `filter` (z. B. `descendent-of`). So bleibt
die Expansion über Terminologieserver hinweg stabil.

## 3. Versionierung auf Instanzebene
- **SNOMED CT:** `Coding.version` auf Instanzebene **nicht** erforderlich (Stand der
  aktuellen Regeln; Versionspflicht gilt für ValueSets).
- **ICD-10-GM, OPS, ATC:** `Coding.version` auf Instanzebene **erforderlich**
  (MII-Profile erzwingen dies).

## 4. Lizenzen
- **SNOMED CT:** lizenzpflichtig; in Deutschland über die nationale Lizenz
  (BfArM/nationales Release-Center). Nutzende müssen lizenzkonform sein.
- **LOINC:** kostenfrei unter dem LOINC-Lizenzvertrag (Regenstrief); Copyright nennen.
- **ICD-10-GM / OPS / Alpha-ID:** über das BfArM; Nutzungsbedingungen beachten.
- Verwendete Terminologien und Lizenzen im IG (`references.md`/`security-privacy.md`)
  ausweisen.

## 5. Checkliste vor Bindung an externe Terminologien
- [ ] Terminologieserver erreichbar (CI: SU-TermServ; lokal ggf. tx.fhir.org)
- [ ] SNOMED-CT-Lizenz geklärt; datierte INTERNATIONAL-Version je CalVer gepinnt
- [ ] `Coding.version` für ICD-10-GM/OPS/ATC auf Instanzebene gesetzt
- [ ] Lizenz-/Copyright-Hinweise im IG ergänzt

*Maßgeblich bleibt die jeweils aktuelle Fassung im MII-Meta-Wiki.*
