#!/usr/bin/env bash
# This script looks for a file named ~/Pictures/wallpaper/index.txt and reads
# the name of an image from the first line.
# If the picture exists in the directory it will be set as the wallpaper else
# the default image is chosen.
# This allows for background image customization per machine without having to
# change the configs.

local_wp_dir=~/Pictures/wallpaper

img=~/.config/sway/img/Cyberpunk-Background-HD-2357151896.jpg

echo "checking for local wallpaper directory..."
if [[ -f $local_wp_dir/index.txt ]]; then
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
