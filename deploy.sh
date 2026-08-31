#!/usr/bin/env bash
# Publikuje report na https://make-more-s-r-o.github.io/reports/
# Použití:  ./deploy.sh <cesta-k-html> <slug>
#   např.  ./deploy.sh ~/scratch/mf-praha.html mf-praha-2026
set -euo pipefail
SRC="${1:?Zadej cestu k HTML souboru}"
SLUG="${2:?Zadej slug, např. mf-praha-2026}"
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
[ -f "$SRC" ] || { echo "Soubor neexistuje: $SRC" >&2; exit 1; }
mkdir -p "$D/$SLUG"
{
  printf '<!doctype html>\n<html lang="cs">\n<head>\n<meta charset="utf-8">\n'
  printf '<meta name="viewport" content="width=device-width, initial-scale=1">\n'
  printf '<meta name="robots" content="noindex, nofollow, noarchive">\n'
  printf '<style>:root{color-scheme:light dark}body{margin:0}img{max-width:100%%}[hidden]{display:none!important}</style>\n'
  cat "$SRC"
  printf '</body></html>\n'
} > "$D/$SLUG/index.html"
cd "$D"
if git diff --quiet && git diff --cached --quiet && [ -z "$(git status --porcelain)" ]; then
  echo "Beze změn — nic k publikaci."; exit 0
fi
git add -A
git commit -m "Report: $SLUG"
git push
echo "Publikováno → https://make-more-s-r-o.github.io/reports/$SLUG/"
echo "Je-li report nový, přidej řádek do index.html (rozcestník) a spusť znovu."
