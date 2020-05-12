#!/bin/bash

if [[ ! -f viminfo-${HOSTNAME} ]]; then
	if [[ -f ~/.viminfo ]] && [[ ! -L ~/.viminfo ]]; then
		mv -v ~/.viminfo "viminfo-${HOSTNAME}"
	else
		touch "viminfo-${HOSTNAME}"
	fi
fi

if [[ -f ~/.viminfo ]] && [[ ! -L ~/.viminfo ]]; then
	mv -v ~/.viminfo{,~}
fi

ln -svf "$(pwd)/viminfo-${HOSTNAME}" ~/.viminfo
