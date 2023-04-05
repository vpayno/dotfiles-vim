"
" vimrc.d/00.30-unimpaired.vimrc
"

" https://github.com/vim-unimpaired

if _enable_unimpaired
	call DebugPrint('00.30-unimpaired.vimrc: start')

	packadd! vim-unimpaired

	call DebugPrint('00.30-unimpaired.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
