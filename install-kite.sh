#!/bin/bash

if [[ -d ~/.kite ]] && [[ ! -L ~/.kite ]]; then
	mv -v ~/.kite{,~}
fi

ln -svf "$(pwd)/dotconfigs/kite" ~/.kite

time bash -c "$(wget -q -O - https://linux.kite.com/dls/linux/current)"
