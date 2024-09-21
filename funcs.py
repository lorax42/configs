import os
import sys
import shutil
import filecmp


homedir = os.path.expanduser('~')


# exit program
def ex():
    print("Exiting...")
    sys.exit(1)


# compare directory recursively
# return True if dirs diff
def has_diff(dir_cmp):
    diff = dir_cmp.left_only + dir_cmp.right_only + dir_cmp.diff_files

    if diff:
        return True

    return any([has_diff(sub_dir_cmp) for sub_dir_cmp in dir_cmp.subdirs.values()])


# install files
def install(src, dest):
    # check for existence of src path
    if not os.path.exists(src):
        print(f"E: {src} doesn't exist")
        ex()

    # check for src is dir and existence of dest path
    if os.path.isdir(src) and not os.path.exists(dest):
        os.makedirs(dest)  # make dir if missing

    # check for matching filetype
    if os.path.isfile(dest) and os.path.isfile(src):
        # check for diffs between src and dest
        if filecmp.cmp(src, dest):
            print(f"no diff between {src} and {dest}")
            return 0

        # install file
        print(f"installing {src} => {dest}...")
        os.remove(dest)
        shutil.copyfile(src, dest)

    # check for matching filetype
    elif os.path.isdir(dest) and os.path.isdir(src):
        # check for diffs between src and dest
        if not has_diff(filecmp.dircmp(src, dest)):
            print(f"no diff between {src} and {dest}")
            return 0

        # install dir
        print(f"installing {src} => {dest}...")
        shutil.rmtree(dest)
        shutil.copytree(src, dest)

    else:
        print(f"E: {src} and {dest} file type not matching")
        ex()

    return 0


# function for vim
def vim():
    install("./vim/vimrc", f"{homedir}/.vimrc")


# function for starship
def starship():
    install("./starship/starship.toml", f"{homedir}/.config/starship.toml")


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
