#!/usr/bin/env bash
# Lokaler Einmal-Build: SUSHI + IG Publisher
set -euo pipefail
command -v sushi >/dev/null 2>&1 || npm install -g fsh-sushi
sushi .
if [ ! -f input-cache/publisher.jar ]; then
  mkdir -p input-cache
  curl -fsSL https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar -o input-cache/publisher.jar
fi
java -jar input-cache/publisher.jar -ig ig.ini
echo "QA-Report: output/qa.html   IG: output/index.html"
