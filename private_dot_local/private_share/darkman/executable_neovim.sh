#!/bin/sh

case "$1" in
dark) THEME=ayu_dark ;;
light) THEME=ayu_light ;;
esac
nvim --headless "+lua require('base46').toggle_theme(\"$THEME\")" +qa
