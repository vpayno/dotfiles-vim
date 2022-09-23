"
" ~/.vim/vimrc.d/95.0-vim-vader.vimrc
"
" https://github.com/junegunn/vader.vim

" vim '+Vader!*' && echo Success || echo Failure
" :Vader [file glob ...]
" :Vader! [file glob ...]

if _enable_vim_vader
	call DebugPrint('95.0-vim-vader.vimrc: start')

	" Load plugins.
	packadd! vader.vim

	call DebugPrint('95.0-vim-vader.vimrc: end')
endif
