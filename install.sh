#!/usr/bin/bash

install(){
    program=$1

	echo "Installing \"$program\"..."

    case $program in
        ~/.vimrc)
            cp .vimrc ~/ # install .vimrc
            ;;
        ~/.config/starship.toml)
            cp starship.toml ~/.config/ # install starship.toml
            ;;
        ~/.config/nvim/init.vim)
            if [[ ! ( -d ~/.config/nvim ) ]]
            then
                mkdir ~/.config/nvim
            fi

            cp nvim/init.vim ~/.config/nvim/
            ;;
        *)
            echo "ERROR: \"$program\" not found"
            ;;
    esac
}

check(){
    program=$1

    if [[ -f $program ]]
    then
        echo "Do you want to replace \"$program\"?"
        echo -n "(Y/n): "
        read yn

        if [[ "$yn" == "y" || "$yn" == "Y" || "$yn" == "" ]]
        then
            install $program
        elif [[ "$yn" == "n" || "$yn" == "N" ]]
        then
            echo "Cancelling install of \"$program\"..."
        else
            echo "ERROR: invalid input \"$yn\""
        fi
    else
        install $program
    fi
    echo
}

check ~/.vimrc
check ~/.config/starship.toml
check ~/.config/nvim/init.vim

