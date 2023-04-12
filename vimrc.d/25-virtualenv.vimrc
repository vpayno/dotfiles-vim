"
" ~/.vim/vimrc.d/25-virtualenv.vimrc
"
" https://github.com/jmcantrell/vim-virtualenv

if _enable_virtualenv
	call DebugPrint('25-virtualenv.vimrc: start [vim-python]')

	" Load plugins.
	packadd! vim-virtualenv

	" Where are my virtual envs
	let g:virtualenv_directory = '~/.vim/venv'

	" this isn't working, only works from the interactive command shell
	" also need to figure out how to select the appropriate version (host
	" specific vim env files?)
	"VirtualEnvActivate py35

	call DebugPrint('25-virtualenv.vimrc: end [vim-python]')
else
	call DebugPrint('25-virtualenv.vimrc: start')

	" Load plugins.
	packadd! vim-virtualenv

	" Where are my virtual envs
	let g:virtualenv_directory = '~/venv'

	call DebugPrint('25-virtualenv.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
