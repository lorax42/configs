import pathlib as pl
import sys
import shutil as st
import filecmp as cmp


homedir = pl.Path.home()


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

    return any(
        has_diff(sub_dir_cmp) for sub_dir_cmp in dir_cmp.subdirs.values()
    )


# install files
def install(src, dest):
    src = pl.Path(src).absolute()
    dest = pl.Path(dest).absolute()

    # check for existence of src path
    if not src.exists():
        print(f"E: {src} doesn't exist")
        ex()

    # check for existence of dest path
    if src.is_file():
        dest.touch(exist_ok=True, parents=True)

    # check for src is dir and existence of dest path
    if src.is_dir():
        # make dir and parents if missing
        dest.mkdir(exist_ok=True, parents=True)

    # check for matching filetype
    if dest.is_file() and src.is_file():
        # check for diffs between src and dest
        if cmp.cmp(src, dest):
            print(f"no diff between {src} and {dest}")
            return 0

        # install file
        print(f"installing {src} => {dest}...")
        dest.unlink()
        st.copyfile(src, dest)

    # check for matching filetype
    elif dest.is_dir() and src.is_dir():
        # check for diffs between src and dest
        if not has_diff(cmp.dircmp(src, dest)):
            print(f"no diff between {src} and {dest}")
            return 0

        # install dir
        print(f"installing {src} => {dest}...")
        st.rmtree(dest)
        st.copytree(src, dest)

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


# function for bash
def bash():
    install("./bash/bashrc", f"{homedir}/.bashrc")
    install("./bash/bash_aliases", f"{homedir}/.bash_aliases")
