#!/usr/bin/env bash
claude-usage --waybar | sed "s/foreground='[^']*' *//g"
