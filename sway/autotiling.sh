#!/usr/bin/env bash

cfg_path=~/.config/sway/

if [[ ! -d $cfg_path ]]; then
    echo "config path $cfg_path doesn't exist"
    exit 1
fi

cd $cfg_path
if [[ ! -d ./autotiling/.git/ ]]; then
    git clone https://www.github.com/nwg-piotr/autotiling.git
    if [[ "$?" != "0" ]]; then
        echo "E: trouble cloneing git repo"
    fi
fi

python3 ./autotiling/autotiling/main.py &
cd
exit 0
