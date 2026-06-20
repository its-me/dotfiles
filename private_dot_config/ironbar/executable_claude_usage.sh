#!/usr/bin/env sh
claude-usage --waybar | sed "s/foreground='[^']*' *//g" | jq -r '.text'
