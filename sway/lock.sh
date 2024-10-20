#! /usr/bin/env bash

echo "running lock.sh..."

img=~/.config/sway/img/Cyberpunk-Background-HD-2357151896.jpg

if [[ "$1" == "blur" ]]; then
    echo "running lockimg.sh..."
    ~/.config/sway/lockimg.sh
    if [[ $? ]]; then
        echo "using img/lockimg.png..."
        img=~/.config/sway/img/lockimg.png
    else
        echo "using fallback img..."
    fi
fi

if [[ ! -f $img ]]; then
    echo "E: $img not found"
    exit 1
fi

echo "running swaylock..."
swaylock\
    --show-failed-attempts\
    --indicator-radius 75\
    --image $img\
    --scaling fit\
    --indicator-caps-lock\
    --config ~/.config/sway/swaylock.conf &
