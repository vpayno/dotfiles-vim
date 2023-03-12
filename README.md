[![GitHub Action Workflow](https://github.com/vpayno/dotfiles-vim/actions/workflows/gh-actions.yml/badge.svg)](https://github.com/vpayno/dotfiles-vim/actions/workflows/gh-actions.yml)
[![Vimscript Workflow](https://github.com/vpayno/dotfiles-vim/actions/workflows/vimscript.yml/badge.svg)](https://github.com/vpayno/dotfiles-vim/actions/workflows/vimscript.yml)

# dotfiles-vim

DotFiles - Vim Config

## Installation

### Download

To download/clone the repo:

```bash
git clone --recurse-submodules https://github.com/vpayno/dotfiles-vim.git ~/.vim
```

If you cloned the repo with out the `--recurse-submodules` argument, use these commands to download the submodules:

```bash
cd ~/.vim
git submodule init
git submodule update
```

You can use this command to look at the submodule status:

```bash
git submodule status
```

### Install Repo

Run the `install.sh` script to replace your existing `~/.vimrc` configuration file with a symlink to the one in the repository.

```bash
./install.sh
```
