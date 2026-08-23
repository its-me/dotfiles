#!/usr/bin/env bash

check() {
  command -v "$1" 1>/dev/null
}

notify() {
  check notify-send && {
    notify-send -a "UpdateCheck Ironbar" "$@"
    return
  }
  echo "$@"
}

stringToLen() {
  STRING="$1"
  LEN="$2"
  if [ ${#STRING} -gt "$LEN" ]; then
    echo "${STRING:0:$((LEN - 2))}.."
  else
    printf "%-20s" "$STRING"
  fi
}
check paru || {
  notify "Ensure paru is installed"
  cat <<EOF
  {"text":"ERR","tooltip":"paru is not installed"}
EOF
  exit 1
}

# Both the bar text and tooltip invoke this script independently on the
# same interval, which would otherwise run paru's AUR lookup twice per
# cycle. Cache the result for a few minutes so the second call is free.
CACHE_FILE="/tmp/arch_updates_cache_$(id -u).json"
CACHE_MAX_AGE=300
if [ -f "$CACHE_FILE" ]; then
  cache_age=$(($(date +%s) - $(stat -c %Y "$CACHE_FILE")))
  if [ "$cache_age" -lt "$CACHE_MAX_AGE" ]; then
    cat "$CACHE_FILE"
    exit 0
  fi
fi

IFS=$'\n'$'\r'

mapfile -t updates < <(paru -Qu --color never 2>/dev/null)

text=${#updates[@]}
tooltip="<b>$text  updates (arch+aur) </b>\n"
tooltip+=" <b>$(stringToLen "PkgName" 20) $(stringToLen "PrevVersion" 20) $(stringToLen "NextVersion" 20)</b>\n"
[ "$text" -eq 0 ] && text="" || text="󰦘"

for i in "${updates[@]}"; do
  # shellcheck disable=2046
  update="$(stringToLen $(echo "$i" | awk '{print $1}') 20)"
  # shellcheck disable=2046
  prev="$(stringToLen $(echo "$i" | awk '{print $2}') 20)"
  # shellcheck disable=2046
  next="$(stringToLen $(echo "$i" | awk '{print $4}') 20)" # skipping '->' string
  tooltip+="<b> $update </b>$prev $next\n"
done
tooltip=${tooltip::-2}

result="{ \"text\":\"$text\", \"tooltip\":\"$tooltip\"}"
printf '%s' "$result" > "$CACHE_FILE"
printf '%s\n' "$result"
