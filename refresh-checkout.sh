#!/usr/bin/env bash

set -ex

git add .

git stash save 'refreshing checkout'

git pull

git stash pop

[[ -f .gitmodules ]] && git submodule update

git status
