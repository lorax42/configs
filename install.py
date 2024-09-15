#!/usr/bin/env python3
# install script for configs

import sys
import os
import shutil


# install files
def install(src, dest):
    if os.path.exists(dest) and os.path.exists(src):
        if not input(f"overwrite {dest} (y to continue)") in "yY\n":
            return 1
    else:
        print(f"E: src = {src}; dest = {dest}; one or both of the files don't exist")
        return 1

    print(f"installing {src} => {dest}")
    if os.path.isfile(dest) and os.path.isfile(src):
        os.remove(dest)
        shutil.copyfile(src, dest)
    elif os.path.isdir(dest) and os.path.isdir(src):
        shutil.rmtree(dest)
        shutil.copytree(src, dest)
    else:
        print(f"E: src = {src}; dest = {dest}; file type not matching")
        sys.exit(1)

    print("-------------------------")

    return 0


# function for vim
def vim():
    install('./.vimrc', '~/.vimrc')


# function for starship
def starship():
    install('./starship.toml', '~/.config/starship.toml')


# function for nvim
def nvim():
    install('./nvim/', '~/.config/nvim/')


# function for kitty
def kitty():
    install('./kitty/', '~/.config/kitty/')


# function for sway
def sway():
    install('./sway/', '~/.config/sway/')


# function for superfile
def superfile():
    install('./superfile/', '~/.config/superfile/')


# exit program
def ex():
    sys.exit(1)


# DRIVER
def main():
    # list of functions and their identifier names
    funcs = [
        [ex, 'exit']
        [vim, 'vim'],
        [nvim, 'nvim'],
        [starship, 'starship'],
        [kitty, 'kitty'],
        [superfile, 'superfile'],
        [sway, 'sway'],
    ]

    # if no args select from list
    if len(sys.argv) < 2:
        i = 0
        for _, name in funcs:
            print(f"{i}: {name}")
            i += 1

        index = input("> ")
        if index > len(funcs):
            print(f"E: invalid index = {index}")
            sys.exit(1)

        op = funcs[index][0]
        op()

    # search args for installable dotfiles
    for arg in sys.argv:
        for func, name in funcs:
            if arg == name:
                func()


if __name__ == "__main__":
    main()
