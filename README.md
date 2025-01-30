# configs

These are my dotfiles.

<!--toc:start-->
- [configs](#configs)
  - [Requirements] (#requirements)
  - [Install](#install)
  - [Future](#future)
<!--toc:end-->

## Requirements
* python3
  * sys
  * os
  * pathlib
  * shutil 
  * filecmp
  * difflib
  * pycurl
  * io


## Install
See `dotfiles.py` for available dotfiles and bundles.

```bash
git clone https://www.github.com/lorax42/configs.git
cd configs

./install.py nvim  # to install nvim configs
# OR
./install.py -b sway  # to install the sway bundle
```

## Future
- [x] show configs that differ
- [x] show diffs

