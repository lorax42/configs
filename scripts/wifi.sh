#! /usr/bin/bash

clear

if [[ ! $(which nmcli) ]]; then
    echo "E: nmcli is installed"
fi

while true; do
    STAT=$(nmcli radio wifi)
    clear
    echo "wifi is $STAT"
    read -r -p "(on/off) " CMD

    case "$CMD" in
        on)
            echo "turning wifi $CMD..."
            nmcli radio wifi $CMD
            ;;
        off)
            echo "turning wifi $CMD..."
            nmcli radio wifi $CMD
            ;;
        exit)
            echo "exiting..."
            break 
            ;;
        *)
            echo "invalid input: $CMD"
            ;;
    esac

    sleep 1
done

