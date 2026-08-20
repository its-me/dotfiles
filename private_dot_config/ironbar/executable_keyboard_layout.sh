#!/usr/bin/env sh
niri msg -j keyboard-layouts | jq -r '.names[.current_idx]' | sed -e 's/English (US)/󰌌 En/' -e 's/Russian/󰌌 Ru/'
