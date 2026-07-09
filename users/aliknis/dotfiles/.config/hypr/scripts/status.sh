#!/usr/bin/env bash
parts=()

# Time
parts+=(" $(date +%H:%M)")

# Battery
pct=$(cat /sys/class/power_supply/BAT0/capacity 2>/dev/null) || true
status=$(cat /sys/class/power_supply/BAT0/status 2>/dev/null) || true
if [[ "$pct" ]]; then
    if [[ "$status" == Charging ]]; then icon=""; elif ((pct <= 15)); then icon=""; elif ((pct <= 40)); then icon=""; elif ((pct <= 60)); then icon=""; elif ((pct <= 80)); then icon=""; else icon=""; fi
    parts+=("$icon $pct%")
fi

# WiFi
ssid=$(nmcli -t -f active,ssid dev wifi 2>/dev/null | grep '^yes' | cut -d: -f2) || true
[[ "$ssid" ]] && parts+=("  $ssid")

# Join and send
text=$(printf "  |  %s" "${parts[@]}")
notify-send -a status "${text:4}" $@
