#! /usr/bin/env bash

echo "lockimg.sh runing..."

echo "checking grim..."
if [[ ! $(which grim) ]]; then
    echo "E: grim not found"
    exit 1
fi
echo "v"

echo "checking convert..."
if [[ ! $(which convert) ]]; then
    echo "E: convert not found"
    exit 1
fi
echo "v"

echo "using grim..."
grim -s0.5 lockimg.png
echo "returned $?"
echo "using convert..."
convert lockimg.png -blur 1 ~/.config/sway/img/lockimg.png
echo "returned $?"
