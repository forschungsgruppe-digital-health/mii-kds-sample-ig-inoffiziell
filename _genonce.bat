@echo off
REM Lokaler Einmal-Build: SUSHI + IG Publisher (Windows-Pendant zu _genonce.sh)
where sushi >nul 2>nul || npm install -g fsh-sushi
sushi .
if not exist input-cache\publisher.jar (
  if not exist input-cache mkdir input-cache
  curl -fsSL https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar -o input-cache\publisher.jar
)
java -jar input-cache\publisher.jar -ig ig.ini
echo QA-Report: output\qa.html   IG: output\index.html
