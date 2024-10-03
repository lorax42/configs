#!/usr/bin/bash
# mirror screen for wayland compositors

input="eDP-1"
output="HDMI-A-2"

if [[ "$XDG_SESSION_TYPE" != "wayland" ]]; then
    echo "E: not a wayland session"
    exit 1
fi

if [[ "$DESKTOP_SESSION" == "sway" && "$1" == "show" ]]; then
    swaymsg -t get_outputs
    exit 0
fi

if [[ "$1" != "" ]]; then
    input=$1
else
    echo "W: input not defined"
    echo "W: defaulting to $input"
fi

if [[ "$2" != "" ]]; then
    output=$2
else
    echo "W: output not defined"
    echo "W: defaulting to $output"
fi

if [[ $(which wl-mirror) && $(which wl-present) ]]; then
    wl-present mirror $input --fullscreen-output $output --fullscreen
else
    echo "E: wl-mirror and wl-present not installed"
fi
