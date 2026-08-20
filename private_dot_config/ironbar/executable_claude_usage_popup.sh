#!/usr/bin/env sh
# GTK/Pango in this environment renders box-drawing corner glyphs (╭╮╰╯)
# wildly oversized and mispositioned regardless of font, so the frame
# characters are stripped here; the colored text/icons/bars still render fine.
ai-usagebar --vendor anthropic --icon '󰚩' --color-low '#eeeeee' --color-mid '#ffee88' --color-high '#ff8888' --color-critical '#ff4444' --json \
  | jq -r '.tooltip' \
  | sed -e 's/[╭╮╰╯─│]//g' -e 's/[[:space:]]*$//' \
  | awk 'NF'
