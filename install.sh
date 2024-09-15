#!/usr/bin/bash

f_base(){
    check .vimrc ~/.vimrc
    check nvim/ ~/.config/nvim/
    check starship.toml ~/.config/starship.toml
    check kitty/ ~/.config/kitty/
}

### INSTALL FILE ###
install(){
    src=$1
    dest=$2

	echo "+++ installing \"$src\" to \"$dest\"..."

    case $dest in
        ~/.vimrc)
            cp .vimrc ~/ # install .vimrc
            ;;
        ~/.config/starship.toml)
            cp starship.toml ~/.config/
            ;;
        ~/.config/nvim/)
            rm -rf ~/.config/nvim/*
            cp -r nvim/ ~/.config/
            ;;
        ~/.config/kitty/)
            rm -rf ~/.config/kitty/
            cp -r kitty/ ~/.config/
            ;;
        ~/.config/sway/)
            rm -rf ~/.config/sway/
            cp -r sway/ ~/.config/
            ;;
        ~/.config/waybar/)
            rm -rf ~/.config/waybar/
            cp -r waybar/ ~/.config/
            ;;
        ~/.config/superfile/)
            rm -rf ~/.config/superfile/
            cp -r superfile/ ~/.config/
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
        install $src $dest
    else
            echo "=== $dest already newest version"
    fi
    echo "-------------------------"
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
            check kitty/ ~/.config/kitty/
            ;;
        sway)
            check sway/ ~/.config/sway/
            check waybar/ ~/.config/waybar/
            ;;
        waybar)
            check waybar/ ~/.config/waybar/
            ;;
        superfile | spf)
            check superfile/ ~/.config/superfile/
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

