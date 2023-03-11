"
" vimrc.d/86-conque-shell.vimrc
"
" https://github.com/vim-scripts/Conque-Shell

if _enable_conque_shell
	call DebugPrint('86-conque-shell.vimrc: start [conque-shell]')

	" Load plugins.
	packadd! Conque-Shell

	call DebugPrint('86-conque-shell.vimrc: end [conque-shell]')
endif
