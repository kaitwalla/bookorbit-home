#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p dist
rm -f dist/bookorbit-home.koplugin.zip
zip -qr dist/bookorbit-home.koplugin.zip bookorbit-home.koplugin -x '*.DS_Store'
unzip -tq dist/bookorbit-home.koplugin.zip