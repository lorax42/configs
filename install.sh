#!/usr/bin/bash

if [[ -f ~/.vimrc ]]
then
    echo "Do you want to replace ~/.vimrc?"
    echo -n "(Y/n): "
    read yn

    if [[ "$yn" == "y" || "$yn" == "Y" || "$yn" == "" ]]
    then
        echo "Installing..."
        cp .vimrc ~/ # install .vimrc
    elif [[ "$yn" == "n" || "$yn" == "N" ]]
    then
        echo "Cancelling install..."
    else
        echo "invalid input"
    fi
fi
