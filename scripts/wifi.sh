#! /usr/bin/bash

clear

if [[ ! $(which nmcli) ]]; then
    echo "E: nmcli not installed"
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
        "")
            case "$STAT" in
                enabled)
                    nmcli radio wifi off
                    ;;
                disabled)
                    nmcli radio wifi on
                    ;;
                *)
                    echo "E: invalid stat: $STAT"
                    ;;
            esac
            ;;
        exit)
            echo "exiting..."
            break 
            ;;
        *)
            echo "E: invalid input: $CMD"
            ;;
    esac

    sleep 1
done

