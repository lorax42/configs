#!/usr/bin/env bash
# actions prompt for wofi

if [[ ! $(which wofi) ]]; then
    echo "E: wofi not installed"
    exit 1
fi

entries="󰖩 Wifi\n⏻ Exit"
selected=$(echo -e $entries|wofi --width 250 --height 210 --dmenu --cache-file /dev/null | awk '{print tolower($2)}')

case $selected in
  wifi)
    exec ~/.config/scripts/wofi-wifi.sh;;
  exit)
    exec ~/.config/scripts/wofi-power.sh;;
esac
