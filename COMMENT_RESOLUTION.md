# COMMENT_RESOLUTION.md — Kommentierung & Auflösung (praxisnah)

Ein MII-KDS-Modul durchläuft **eine** Abfolge von Phasen. **Du musst das Verfahren
nicht selbst auswählen** — es ergibt sich aus der **aktuell angekündigten Phase**.
Diese Anleitung sagt dir je nach Rolle, was konkret zu tun ist; die ausführlichen
Regeln je Phase stehen darunter als Referenz.

## Schnellstart

### Du möchtest kommentieren (kommentierende Person)
1. **Ein Issue je Fundstelle** anlegen — Template „Kommentar / Ballot-Eintrag".
2. Fundstelle, konkreten **Änderungsvorschlag** und **Begründung** angeben (bei
   negativen Kommentaren ist die Begründung Pflicht).
3. Das Feld **„Phase / Verfahren" ist optional** — bist du unsicher, wähle „Unsicher
   — bitte zuordnen" oder lass es leer. Das **Modulteam ordnet die Phase zu**.
4. Absenden. Du erhältst eine begründete Antwort und eine Disposition.

> Die **verbindliche** Einreichung im offiziellen Verfahren erfolgt zusätzlich über
> `https://portal.hl7.de` bzw. `ballot@hl7.de`. Das Repo-Issue ersetzt das nicht.

### Du spezifizierst / leitest das Modul (spezifizierende Person / Modulteam)
Führe die Phasen der Reihe nach durch (Timeline unten). **Welche Regeln gelten, ergibt
sich aus der Phase, die du gerade ankündigst und durchführst** — du sagst der
Community, welche Phase offen ist; Kommentierende müssen das nicht wissen.
In **jeder** Phase gilt: zu **allen** Kommentaren Stellung nehmen, Kommentare und
Antworten veröffentlichen (Identität auf Wunsch pseudonymisieren).

## Der Ablauf in einer Linie

```
[1] Interne Kommentierung  →  [2] AG-IOP-Freigabe  →  [3] Öffentliche Kommentierung  →  [4] NSG
    (MII / KDS-Governance)       (Konsens, kein Nein)     (HL7 Deutschland)               (finale Freigabe)
    2 Wo Ank. + 6 Wo
```

| Phase | Wer kommentiert / stimmt | Geltende Regeln | Entscheidung |
|-------|--------------------------|-----------------|--------------|
| **1 Interne Kommentierung** | Personen/Organisationen außerhalb des Modulteams | KDS-Governance | Modulteam nimmt zu allen Stellung |
| **2 AG-IOP-Freigabe** | je Konsortium **eine** Stimme | KDS-Governance | AG-Votum **ohne** Ablehnung → Empfehlung ans NSG |
| **3 Öffentliche Kommentierung** | nach Verfahrenstyp (s. Phase 3) | **HL7 Deutschland** | Reconciliation negativer Kommentare |
| **4 Finale Freigabe** | — | KDS-Governance | **NSG** |

---

## Phase 1 — Interne Kommentierung (KDS-Governance)
- Ankündigung i. d. R. **2 Wochen** vorab; Frist i. d. R. **6 Wochen** ab Versand;
  Kommentierung **modulweise**.
- Das verantwortliche Team / die TF Kerndatensatz **müssen zu allen** Kommentaren
  Stellung nehmen: **angenommen** (in welcher Form) bzw. **abgelehnt** (mit Begründung).
- Kommentare und Antworten werden grundsätzlich **veröffentlicht**; Identität auf
  Wunsch **pseudonymisiert**.

## Phase 2 — AG-IOP-Freigabe (KDS-Governance)
- Abstimmung über die Freigabe (Moduleinrichtung und Informationsmodell) in der **AG
  Interoperabilität**; **jedes Konsortium hat eine Stimme** (zustimmend/ablehnend/
  enthaltend). Nicht vertretene Konsortien ohne schriftliche Rückmeldung = **Enthaltung**.
- Das **AG-Votum darf keine Ablehnungen enthalten**, damit es dem NSG empfohlen wird.
- Richtwerte: Freigaben i. d. R. **2 Wochen** (Umlauf oder vor AG-Sitzung).

## Phase 3 — Öffentliche Kommentierung über die MII hinaus (HL7 Deutschland)
Maßgeblich: „Regeln für HL7 Abstimmungs- und Kommentierungsverfahren" (HL7 Deutschland
e. V.). Quelle: https://hl7.de/wp-content/uploads/Abstimmungsregeln-20221213.pdf

**Verfahrenstypen**
| Typ | Kommentierung | Abstimmung | Mind.-Teilnehmende | Quorum | Verbindlichkeit |
|-----|---------------|-----------|--------------------|--------|-----------------|
| Informativ / zur Kommentierung | ja | nein | keine | keins | optional |
| Standard zur Probe (STU) | ja | ja | 5 | 60 % | optional |
| Normativ | ja | ja | 5 | 80 % | verpflichtend |

Normatives Material setzt eine vorherige STU-Annahme voraus (STU: mind. zwei Jahre
stabil zur Erprobung).

**Stimmabgabe (zwei Teile):** (1) **Kommentare** mit konkreter Begründung; (2) **Vote**
(Zustimmung/Ablehnung/Enthaltung) zur Spezifikation als Ganzes. Stimmberechtigt
(STU/Normativ) sind nur HL7-Deutschland-Mitglieder und die Autor:innen; informelle
Kommentare sind von allen willkommen.

**Auflösung negativer Kommentare (Reconciliation):** jeder negative Kommentar wird als
**„angenommen"**, **„abgelehnt"** oder **„nicht überzeugend"** gekennzeichnet und
beantwortet; eine einvernehmliche Auflösung ist anzustreben. **Rückzug** negativer
Stimmen ist bei Einigung schriftlich möglich. **Eskalation:** bei fehlender Einigung
entscheidet der **Vorstand von HL7 Deutschland**; ein ungelöster negativer Kommentar
wird mit der Spezifikation veröffentlicht. **Quorum** = Ja/(Ja+Nein). **Re-Ballot** bei
substanziellen Änderungen (nur bisherige Voter:innen; nur neue Kommentare zu den
geänderten Stellen).

**Fristen (HL7-DE):** Ankündigung **≥ 30 Tage**; Phase **≥ 4 Wochen**.

## Phase 4 — Finale Freigabe (NSG)
Nach Aufarbeitung der Kommentare wird das Modul dem **NSG zur finalen Freigabe**
vorgelegt (ohne erneute AG-Abstimmung). Erst danach greift der Publikations-/
Pages-Workflow.

---

## Abbildung auf den GitHub-Workflow (dieses Repo)
- **Erfassung:** je Fundstelle ein Issue über das Template „Kommentar / Ballot-Eintrag";
  das Feld **„Phase / Verfahren" ist optional** (Default „Unsicher — bitte zuordnen").
- **Disposition-Labels:** `disp:angenommen`, `disp:abgelehnt`,
  `disp:nicht-ueberzeugend` — wobei `nicht-ueberzeugend` **nur Phase 3** betrifft
  (Phasen 1/4 kennen nur angenommen/abgelehnt mit Begründung).
- **Typ-Labels:** `negative-major`, `negative-minor`, `question`, `editorial`,
  `affirmative`.
- **Antwortpflicht:** jedes (negative) Issue erhält vor dem Schließen eine begründete
  Antwort und ein Disposition-Label.
- **Eskalation:** ungelöste negative Kommentare kennzeichnen — Phase 1/2 `eskalation:nsg`,
  Phase 3 `eskalation:hl7de-vorstand` — und mit der Spezifikation veröffentlichen.
- **Verbindlichkeit:** Dieses Repo-Verfahren ersetzt **weder** das MII-interne
  Governance-Verfahren **noch** das HL7-DE-Verfahren (portal.hl7.de / ballot@hl7.de).

## Fristen im Vergleich
| Phase | Ankündigung | Dauer | Quelle |
|-------|-------------|-------|--------|
| 1 Interne Kommentierung | i. d. R. 2 Wochen | i. d. R. **6 Wochen** | KDS-Governance |
| 3 Öffentliche Kommentierung | ≥ 30 Tage | ≥ 4 Wochen | HL7-DE-Abstimmungsregeln |

> Die HL7-DE-Mindestfrist (≥ 4 Wochen) **nicht** auf die interne Phase übertragen —
> dort gilt i. d. R. die **längere** 6-Wochen-Frist der KDS-Governance.

*Hinweis: Inoffizielle Vorlage. Maßgeblich sind die jeweils gültige KDS-Governance
sowie die Originalfassung der HL7-Deutschland-Abstimmungsregeln.*
