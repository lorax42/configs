#!/usr/bin/env bash

local_wp_dir=~/Pictures/wallpaper

img=~/.config/sway/img/Cyberpunk-Background-HD-2357151896.jpg

echo "checking for local wallpaper directory..."
if [[ -d $local_wp_dir ]]; then
    echo "reading $local_wp_dir/index.txt..."
    index="$local_wp_dir/$(cat $local_wp_dir/index.txt | head -n1)"

    ls $index

    if [[ "$?" == "0" ]]; then
        img=$index
    else
        echo "E: file $index not found"
    fi

elif [[ -f $img ]]; then
    echo "using fallback image..."

else
    echo "E: fallback image $img not found"
fi

swaymsg "output * bg $img fill"
