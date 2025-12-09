#!/bin/sh

SCHEME=
case "$1" in
dark) SCHEME=prefer-dark ;;
light) SCHEME=prefer-light ;;
esac
gsettings set org.gnome.desktop.interface color-scheme "$SCHEME"
