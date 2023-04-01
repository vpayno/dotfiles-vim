"
" vimrc.d/00.20-targets.vimrc
"

" https://github.com/wellle/targets.vim

if _enable_targets
	call DebugPrint('00.20-targets.vimrc: start')

	packadd! targets.vim

	call DebugPrint('00.20-targets.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
