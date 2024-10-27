#!/bin/bash

if [[ ! $(slurp -h) ]]; then
    echo "slurp not installed"
    exit
elif [[ ! $(grim -h) ]]; then
    echo "grim not installed"
    exit
fi

SCREENSHOT_PATH=~/Pictures/screenshots/
if [[ ! -d $SCREENSHOT_PATH ]]; then
    mkdir -p $SCREENSHOT_PATH
fi

FILENAME="screenshot_`date +%F_%H-%M-%S`"
PIC_PATH=$SCREENSHOT_PATH$FILENAME.png

if [[ "$1" =~ "select" ]]; then
    grim -g "$(slurp)" $PIC_PATH
else
    grim $PIC_PATH
fi
