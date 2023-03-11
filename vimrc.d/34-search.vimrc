"
" vimrc.d/34-search.vimrc
"
" https://github.com/mileszs/ack.vim
" https://github.com/jremmen/vim-ripgrep

" Tell VIM to use ack instead of grep.
" set grepprg=ack

if _enable_ack
	call DebugPrint('34-search.vimrc: start [ack]')

	" Load plugin.
	packadd! ack.vim

	call DebugPrint('34-search.vimrc: end [ack]')
endif

if _enable_ripgrep
	call DebugPrint('34-search.vimrc: start [ripgrep]')

	" Load plugin.
	packadd! vim-ripgrep

	call DebugPrint('34-search.vimrc: end [ripgrep]')
endif

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
