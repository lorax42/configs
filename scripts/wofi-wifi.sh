#!/usr/bin/env bash
# wifi toggle for wofi

if [[ ! $(which wofi) ]]; then
    echo "E: wofi not installed"
    exit 1
elif [[ ! $(which kitty) ]]; then
    echo "E: kitty not installed"
    exit 1
fi

entries="󰨚 Toggle\n󰖩 On\n󰖪 Off\n󱚾 Settings"
selected=$(echo -e $entries|wofi --width 250 --height 300 --dmenu --cache-file /dev/null | awk '{print tolower($2)}')

STAT=$(nmcli radio wifi)

case $selected in
    toggle)
        case "$STAT" in
            enabled)
                exec nmcli radio wifi off
                ;;
            disabled)
                exec nmcli radio wifi on
                ;;
        esac
        ;;
    on)
        exec nmcli radio wifi on
        ;;
    off)
        exec nmcli radio wifi off
        ;;
    settings)
        exec kitty -e nmtui
        ;;
esac
