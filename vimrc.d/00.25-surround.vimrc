"
" vimrc.d/00.25-surround.vimrc
"

" https://github.com/tpope/vim-surround
" https://github.com/tpope/vim-repeat

if _enable_surround
	call DebugPrint('00.25-surround.vimrc: start')

	packadd! vim-surround
	packadd! vim-repeat

	call DebugPrint('00.25-surround.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
