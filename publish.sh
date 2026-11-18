#!/bin/bash
# Публікує сайт на GitHub Pages: https://bot-badass.github.io/dontpanic-law/
set -e
cd "$(dirname "$0")"
[ -d .git ] || { git init -q -b main; git add index.html privacy.html; git commit -qm "DontPanic Law: home + privacy policy for YouTube API app"; }
gh repo create bot-Badass/dontpanic-law --public --source=. --push -d "DontPanic Law — home page and privacy policy"
gh api -X POST repos/bot-Badass/dontpanic-law/pages -f "source[branch]=main" -f "source[path]=/" --jq .html_url
