"
" vimrc.d/00.24-wordmotion.vimrc
"

" https://github.com/chaoren/vim-wordmotion

if _enable_wordmotion
	call DebugPrint('00.24-wordmotion.vimrc: start')

	packadd! targets.vim

	" Restore standard Vim behaviour, that being to preserve whitespace between words.
	" note: nope
	" nmap cw ce
	" nmap cW cE

	call DebugPrint('00.24-wordmotion.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
