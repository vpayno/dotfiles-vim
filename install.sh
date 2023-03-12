#!/bin/bash

if [[ -f ~/.vimrc ]] && [[ ! -L ~/.vimrc ]]; then
	mv -v ~/.vimrc{,~}
fi

ln -svf "$(pwd)/vimrc" ~/.vimrc
