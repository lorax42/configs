import sys
import os
import pathlib as pl
import shutil as st
import filecmp as cmp
import difflib
import subprocess


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


# show diffs for files
def compare_files(file1, file2):
    print("SHOWING DIFFS FOR", file1, "AND", file2)
    with open(file1, 'r', encoding="utf-8") as f1, open(file2, 'r', encoding="utf-8") as f2:
        file1_lines = f1.readlines()
        file2_lines = f2.readlines()
        diff = difflib.unified_diff(file2_lines, file1_lines, fromfile=file2, tofile=file1)
        print('\n'.join(diff))


# show diffs for directories recursively
def compare_dirs(dir1, dir2):
    print("SHOWING DIFFS FOR", dir1, "AND", dir2)
    for file in os.listdir(dir1):
        file_path1 = os.path.join(dir1, file)
        file_path2 = os.path.join(dir2, file)
        if os.path.isfile(file_path1) and os.path.isfile(file_path2):
            if not cmp.cmp(file_path1, file_path2):
                print(f"Files {file_path1} and {file_path2} are different:")
                compare_files(file_path1, file_path2)
        elif os.path.isfile(file_path1) and not os.path.exists(file_path2):
            print(f"File {file_path1} does not exist in {dir2}")
        elif not os.path.exists(file_path1) and os.path.isfile(file_path2):
            print(f"File {file_path2} does not exist in {dir1}")


# install files
def install(src, dest, diff=False):
    src = pl.Path(src).absolute()
    dest = pl.Path(dest).absolute()

    # check for existence of src path
    if not src.exists():
        print(f"E: {src} doesn't exist")
        ex()

    # check for existence of dest path
    if src.is_file():
        dest.touch(exist_ok=True)

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

        if diff:
            compare_files(str(src), str(dest))
            return 0

        # install file
        print(f"installing {src} => {dest}...")
        input("Are you sure you want to overwrite file?")
        dest.unlink()
        # st.copyfile(src, dest)
        st.copy2(src, dest)

    # check for matching filetype
    elif dest.is_dir() and src.is_dir():
        # check for diffs between src and dest
        if not has_diff(cmp.dircmp(src, dest)):
            print(f"no diff between {src} and {dest}")
            return 0

        if diff:
            compare_dirs(src, dest)
            return 0

        # install dir
        print(f"installing {src} => {dest}...")
        input("Are you sure you want to overwrite dir?")
        st.rmtree(dest)
        st.copytree(src, dest)

    else:
        print(f"E: {src} and {dest} file type not matching")
        ex()

    return 0


# function for vim
def vim(diff=False):
    install("./vim/vimrc", f"{homedir}/.vimrc", diff=diff)


# function for starship
def starship(diff=False):
    install("./starship/starship.toml", f"{homedir}/.config/starship.toml", diff=diff)


# function for nvim
def nvim(diff=False):
    install("./nvim/", f"{homedir}/.config/nvim/", diff=diff)


# function for kitty
def kitty(diff=False):
    install("./kitty/", f"{homedir}/.config/kitty/", diff=diff)


# function for sway
def sway(diff=False):
    install("./sway/", f"{homedir}/.config/sway/", diff=diff)


# functiond for hyprland
def hyprland(diff=False):
    install("./hypr/", f"{homedir}/.config/hypr/", diff=diff)


# function for superfile
def superfile(diff=False):
    install("./superfile/", f"{homedir}/.config/superfile/", diff=diff)


# function for waybar
def waybar(diff=False):
    install("./waybar/", f"{homedir}/.config/waybar/", diff=diff)


# function for waybar
def waybar_sway(diff=False):
    result = subprocess.run(
        [
            'curl',
            '-o',
            './waybar_sway/mediaplayer.py',
            'https://github.com/Alexays/Waybar/raw/refs/heads/master/resources/custom_modules/mediaplayer.py'
         ],
        check=False
    )

    if result.returncode != 0:
        print(f"Failed to download mediaplayer.py: {result.stderr}")

    install("./waybar_sway/", f"{homedir}/.config/waybar/", diff=diff)


# function for waybar
def waybar_hypr(diff=False):
    install("./waybar_hypr/", f"{homedir}/.config/waybar/", diff=diff)


# function for wofi
def wofi(diff=False):
    install("./wofi/", f"{homedir}/.config/wofi/", diff=diff)


# function for bash
def bash(diff=False):
    install("./bash/bashrc", f"{homedir}/.bashrc", diff=diff)
    install("./bash/bash_aliases.sh", f"{homedir}/.bash_aliases.sh", diff=diff)
    install("./bash/bash_zoxide.sh", f"{homedir}/.bash_zoxide.sh", diff=diff)


# function for scripts
def scripts(diff=False):
    install("./scripts/wifi.sh", f"{homedir}/.local/bin/wifi.sh", diff=diff)
    install("./scripts/", f"{homedir}/.config/scripts/", diff=diff)

def git(diff=False):
    install("./git/commit-template.txt", f"{homedir}/.commit-template.txt", diff=diff)
    install("./git/gitconfig", f"{homedir}/.gitconfig", diff=diff)
