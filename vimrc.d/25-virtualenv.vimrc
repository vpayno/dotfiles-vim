"
" ~/.vim/vimrc.d/25-virtualenv.vimrc
"
" https://github.com/jmcantrell/vim-virtualenv

if _use_virtualenv
	call DebugPrint("25-virtualenv.vimrc: start [vim-python]")

	" Load plugins.
	packadd! vim-virtualenv

	" Where are my virtual envs
	let g:virtualenv_directory = "~/.vim/venv"

	"call VirtualEnvActivate("vim-python")

	call DebugPrint("25-virtualenv.vimrc: end [vim-python]")
else
	call DebugPrint("25-virtualenv.vimrc: start")

	" Load plugins.
	packadd! vim-virtualenv

	" Where are my virtual envs
	let g:virtualenv_directory = "~/venv"

	call DebugPrint("25-virtualenv.vimrc: end")
endif
