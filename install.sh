#!/usr/bin/bash

f_base(){
    check .vimrc ~/.vimrc
    check nvim/ ~/.config/nvim/
    check starship.toml ~/.config/starship.toml
    check kitty.conf ~/.config/kitty/kitty.conf
}

### INSTALL FILE ###
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
        ~/.config/nvim/init.lua)
            if [[ ! ( -d ~/.config/nvim ) ]]
            then
                mkdir ~/.config/nvim
            fi

            cp nvim/init.lua ~/.config/nvim/
            ;;
        ~/.config/nvim/)
            rm -rf ~/.config/nvim/*
            cp -r nvim/ ~/.config/
            ;;
        ~/.config/kitty/kitty.conf)
            if [[ ! -d ~/.config/kitty ]]
            then
                mkdir ~/.config/kitty
            fi

            cp kitty.conf ~/.config/kitty
            ;;
        ~/.config/sway/)
            if [[ ! -d ~/.config/sway ]]; then
                mkdir ~/.config/sway
            fi

            cp sway/config ~/.config/sway
            ;;
        *)
            echo "ERROR: \"$dest\" not found"
            ;;
    esac
}

### CHECK IF FILE EXISTS ###
check(){
    src=$1
    dest=$2

    diff -r $src $dest >> /dev/null
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

### MAIN FUNCITON ###
main(){
    case $1 in
        vim)
            check .vimrc ~/.vimrc
            ;;
        nvim)
            #check nvim/init.vim ~/.config/nvim/init.vim
            #check nvim/init.lua ~/.config/nvim/init.lua
            check nvim/ ~/.config/nvim/
            ;;
        starship)
            check starship.toml ~/.config/starship.toml
            ;;
        kitty)
            check kitty.conf ~/.config/kitty/kitty.conf
            ;;
        sway)
            check sway/ ~/.config/sway/
            ;;
        base)
            f_base
            ;;
        "")
            echo -e "1: exit"
            echo -e "2: base"

            read -p "> " x

            case "$x" in
                1)
                    exit 1
                    ;;
                2)
                    f_base
                    ;;
                *)
                    echo "ERROR: invalid input \"$x\""
                    ;;
            esac
            ;;
        *)
        echo "ERROR: invalid input \"$1\""
        ;;
esac
}

main $1

