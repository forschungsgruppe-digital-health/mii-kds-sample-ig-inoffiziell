# Security Policy

## Geltungsbereich
Diese Richtlinie betrifft **Schwachstellen im Repository und in der Tooling-Kette**
(Workflows, Skripte, Abhängigkeiten) dieser inoffiziellen Vorlage. Sie betrifft
**nicht** klinische Risiken oder Patientensicherheit — dafür sind die jeweiligen
Betreiber/Verantwortlichen zuständig.

## Melden einer Schwachstelle
- Bevorzugt über **GitHub Private Vulnerability Reporting** (Tab „Security" →
  „Report a vulnerability"), falls aktiviert.
- Alternativ per E-Mail an: `<security-kontakt@example.org>` (Platzhalter ersetzen).
- Bitte **keine** öffentlichen Issues für sicherheitsrelevante Meldungen.

## Erwartung
Wir bestätigen den Eingang zeitnah und stimmen das weitere Vorgehen (Fix,
Offenlegung) einvernehmlich ab. Da dies eine **inoffizielle Vorlage** ist, gibt es
keine zugesicherten Reaktionszeiten (kein SLA).

## Abhängigkeiten
Automatische Updates über Dependabot (`.github/dependabot.yml`) und den monatlichen
Update-Check (`.github/workflows/dependency-check.yml`).
