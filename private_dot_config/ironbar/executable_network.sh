#!/usr/bin/env sh
iface="$(ip route show default | awk '/^default/ {print $5; exit}')"

[ -z "$iface" ] && { printf '󰤭\n'; exit 0; }

if [ -d "/sys/class/net/$iface/wireless" ]; then
    link="$(iw dev "$iface" link 2>/dev/null)"
    ssid="$(printf '%s\n' "$link" | awk -F': ' '/SSID:/ {print $2}')"
    signal="$(printf '%s\n' "$link" | awk '/signal:/ {print $2}')"

    [ -z "$ssid" ] && { printf '󰤭\n'; exit 0; }

    if [ "${signal:-0}" -ge -50 ] 2>/dev/null; then
        icon="󰤨"
    elif [ "$signal" -ge -60 ] 2>/dev/null; then
        icon="󰤥"
    elif [ "$signal" -ge -70 ] 2>/dev/null; then
        icon="󰤢"
    else
        icon="󰤟"
    fi

    printf '%s %s\n' "$icon" "$ssid"
else
    printf '󰈀\n'
fi
