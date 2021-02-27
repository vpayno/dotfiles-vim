#!/bin/bash

cd ~/.vim/pack/upstream/opt/YouCompleteMe || exit 1
pwd

git pull

echo python install.py --all
time python install.py --all
