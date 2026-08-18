#!/bin/bash
set -uo pipefail
PS4='+ [$(date "+%H:%M:%S")] '
set -x

waybar &
WAYBAR_PID=$!
trap "echo '[DEBUG] Cleaning up Waybar (PID: $WAYBAR_PID)'; kill $WAYBAR_PID" EXIT

echo "[DEBUG] Watching Waybar config for changes..."
while true; do
    inotifywait -r -e create,modify ~/.config/waybar/* || true
    echo "[DEBUG] Config changed, reloading Waybar..."
    kill -SIGUSR2 "$WAYBAR_PID" || true
done

