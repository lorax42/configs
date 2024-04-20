#!/usr/bin/bash

install(){
    src=$1
    dest=$2

	echo "Installing \"$src\" to \"$dest\"..."

    case $dest in
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
            echo "ERROR: \"$dest\" not found"
            ;;
    esac
}

check(){
    src=$1
    dest=$2

    diff $src $dest >> /dev/null
    if [[ "$?" -ne "0" ]]
    then
        if [[ -f $dest ]]
        then
            echo "Do you want to replace \"$dest\"?"
            echo -n "(Y/n): "
            read yn

            if [[ "$yn" == "y" || "$yn" == "Y" || "$yn" == "" ]]
            then
                install $src $dest
            elif [[ "$yn" == "n" || "$yn" == "N" ]]
            then
                echo "Cancelling install of \"$dest\"..."
            else
                echo "ERROR: invalid input \"$yn\""
            fi
        else
            install $src $dest
        fi
        echo "-------------------------"
    fi
}

check .vimrc ~/.vimrc
check starship.toml ~/.config/starship.toml
check nvim/init.vim ~/.config/nvim/init.vim

