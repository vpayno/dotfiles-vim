# dotfiles-vim

[![GitHub Action Workflow](https://github.com/vpayno/dotfiles-vim/actions/workflows/gh-actions.yml/badge.svg)](https://github.com/vpayno/dotfiles-vim/actions/workflows/gh-actions.yml)
[![Vimscript Workflow](https://github.com/vpayno/dotfiles-vim/actions/workflows/vimscript.yml/badge.svg)](https://github.com/vpayno/dotfiles-vim/actions/workflows/vimscript.yml)

DotFiles - Vim Config

## Nix

Experimenting with Nix to make this configuration more portable.

### Debugging

When debugging the configuration, the changes need to be pushed to a branch, the
branch needs to be referenced in the inputs and the input lock needs to be
updated.

```text
git add -u .
git commit -v --amend
git push --force updateflake
nix flake update vimconf-src && nix build && ./result/bin/vim
```

### Running

To run it use `nix run`:

```text
nix run github:vpayno/dotfiles-vim --
```

### Installing

To install it run `nix profile install ...`:

```text
nix profile install github:vpayno/dotfiles-vim
```

## Installation

### Download

To download/clone the repo:

```bash
git clone --recurse-submodules https://github.com/vpayno/dotfiles-vim.git ~/.vim
```

If you cloned the repo with out the `--recurse-submodules` argument, use these
commands to download the submodules:

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

Run the `install.sh` script to replace your existing `~/.vimrc` configuration
file with a symlink to the one in the repository.

```bash
./install.sh
```

### Update Repo

```bash
git pull
git submodule update
```
