#!/usr/bin/bash

install(){
	echo "Installing..."
    cp .vimrc ~/ # install .vimrc
}

if [[ -f ~/.vimrc ]]
then
    echo "Do you want to replace ~/.vimrc?"
    echo -n "(Y/n): "
    read yn

    if [[ "$yn" == "y" || "$yn" == "Y" || "$yn" == "" ]]
    then
	install
    elif [[ "$yn" == "n" || "$yn" == "N" ]]
    then
        echo "Cancelling install..."
    else
        echo "invalid input"
    fi
else
	install
fi

