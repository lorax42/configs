import os
import sys
import shutil


homedir = os.path.expanduser('~')


# exit program
def ex():
    print("Exiting...")
    sys.exit(1)


# install files
def install(src, dest):
    if os.path.exists(dest) and os.path.exists(src):
        print(f"overwrite {dest}?")
        if not input("(y to continue) ") in "yY\n":
            return 1
    else:
        print(f"E: src = {src}; dest = {dest}; one or both of the files don't exist")
        return 1

    print(f"installing {src} => {dest}...")

    if os.path.isfile(dest) and os.path.isfile(src):
        os.remove(dest)
        shutil.copyfile(src, dest)
    elif os.path.isdir(dest) and os.path.isdir(src):
        shutil.rmtree(dest)
        shutil.copytree(src, dest)
    else:
        print(f"E: src = {src}; dest = {dest}; file type not matching")
        ex()

    print("-------------------------")

    return 0


# function for vim
def vim():
    install("./vim/vimrc", f"{homedir}/.vimrc")


# function for starship
def starship():
    install("./starship.toml", f"{homedir}/.config/starship.toml")


# function for nvim
def nvim():
    install("./nvim/", f"{homedir}/.config/nvim/")


# function for kitty
def kitty():
    install("./kitty/", f"{homedir}/.config/kitty/")


# function for sway
def sway():
    install("./sway/", f"{homedir}/.config/sway/")


# function for superfile
def superfile():
    install("./superfile/", f"{homedir}/.config/superfile/")


# function for waybar
def waybar():
    install("./waybar/", f"{homedir}/.config/waybar/")


# function for wofi
def wofi():
    install("./wofi/", f"{homedir}/.config/wofi/")
