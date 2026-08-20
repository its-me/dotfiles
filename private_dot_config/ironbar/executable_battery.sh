#!/usr/bin/env sh
info="$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 2>/dev/null)"
percentage="$(printf '%s\n' "$info" | awk '/percentage:/ {gsub("%","",$2); print $2}')"
state="$(printf '%s\n' "$info" | awk '/state:/ {print $2}')"

[ -z "$percentage" ] && exit 0

if [ "$state" = "charging" ] || [ "$state" = "pending-charge" ]; then
    icon="󰂄"
elif [ "$state" = "fully-charged" ]; then
    icon="󰁹"
elif [ "$percentage" -ge 90 ]; then
    icon="󰁹"
elif [ "$percentage" -ge 80 ]; then
    icon="󰂂"
elif [ "$percentage" -ge 70 ]; then
    icon="󰂀"
elif [ "$percentage" -ge 60 ]; then
    icon="󰁿"
elif [ "$percentage" -ge 50 ]; then
    icon="󰁾"
elif [ "$percentage" -ge 40 ]; then
    icon="󰁽"
elif [ "$percentage" -ge 30 ]; then
    icon="󰁼"
elif [ "$percentage" -ge 20 ]; then
    icon="󰁻"
elif [ "$percentage" -ge 10 ]; then
    icon="󰁺"
else
    icon="󰂎"
fi

printf '%s %s%%\n' "$icon" "$percentage"
