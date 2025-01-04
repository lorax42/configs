#!/usr/bin/env python3
# install script for configs

import sys

from funcs import *
from dotfiles import *


# DRIVER
def main():
    # if no args select from list
    if len(sys.argv) < 2:
        print("0: exit")
        print("1: dotfile")
        print("2: bundle")
        print("3: diffs")

        index = int(input("> "))

        if index == 0:
            ex()

        elif index == 1:
            i = 0

            for func in funcs:
                print(f"{i}: {func[0]}")
                i += 1

            index = int(input("> "))

            if index > len(funcs) or index < 0:
                print(f"E: invalid index = {index}")
                ex()

            funcs[index][1]()

        elif index == 2:
            i = 0

            for bundle in bundles:
                print(f"{i}: {bundle[0]}")
                i += 1

            index = int(input("> "))

            if index > len(bundles) or index < 0:
                print(f"E: invalid index = {index}")
                ex()

            for func in bundles[index][1]:
                func()

        elif index == 3:
            i = 0

            for func in funcs:
                print(f"{i}: {func[0]}")
                i += 1

            index = int(input("> "))

            if index > len(funcs) or index < 0:
                print(f"E: invalid index = {index}")
                ex()

            funcs[index][1](diff=True)

        else:
            print(f"E: invalid index = {index}")

    elif sys.argv[1] == "-b":
        for arg in sys.argv:
            # loop through bunles in list (skipping first (exit))
            for bundle in bundles[1:]:
                if bundle[0] == arg:
                    for func in bundle[1]:
                        func()

    else:
        diff=False
        if sys.argv[1] == "-d":
            diff=True
        if len(sys.argv) < 3:
            print("DIFFING ALL!")
            for func in funcs[1:]:
                func[1](diff=diff)
        # search args for installable dotfiles
        for arg in sys.argv[2:]:
            for func in funcs[1:]:
                if arg == func[0]:
                    func[1](diff=diff)


if __name__ == "__main__":
    main()
