#!/bin/sh
# Stamp the stylesheet's content hash onto every <link> that references it, so
# browsers fetch the new file immediately instead of serving a cached copy.
# Run from the repo root after editing css/style.css:   sh tools/cachebust.sh
set -e
cd "$(dirname "$0")/.."
HASH=$(md5 -q css/style.css 2>/dev/null || md5sum css/style.css | cut -d' ' -f1)
HASH=$(echo "$HASH" | cut -c1-8)
for f in *.html; do
  sed -i '' -E "s|href=\"css/style\.css(\?v=[a-f0-9]+)?\"|href=\"css/style.css?v=$HASH\"|g" "$f"
done
echo "stamped css/style.css?v=$HASH on: $(ls *.html | tr '\n' ' ')"
