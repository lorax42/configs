#!/bin/bash

if [[ ! $(slurp -h) ]]; then
    echo "slurp not installed"
    exit
elif [[ ! $(grim -h) ]]; then
    echo "grim not installed"
    exit
fi

if [[ ! -d ~/Pictures/Screenshots/ ]]; then
    mkdir ~/Pictures/Screenshots/
fi

FILENAME="screenshot_`date +%F_%H-%M-%S`"
grim -g "$(slurp)" ~/Pictures/Screenshots/$FILENAME.png
