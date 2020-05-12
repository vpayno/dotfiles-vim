#!/bin/bash

if [[ -f ~/.vimrc ]] && [[ ! -L ~/.vimrc ]]; then
	mv -v ~/.vimrc{,~}
fi

ln -svf "$(pwd)/vimrc" ~/.vimrc

if [[ -d ~/.kite ]] && [[ ! -L ~/.kite ]]; then
	mv -v ~/.kite{,~}
fi

ln -svf "$(pwd)/dotconfigs/kite" ~/.kite
