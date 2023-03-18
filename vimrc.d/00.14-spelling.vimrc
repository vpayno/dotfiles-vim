"
" vimrc.d/00.14-spelling.vimrc
"

call DebugPrint('runtime! vimrc.d/00.14-spelling.vimrc: start')

let g:SpellModeFlag = g:false

function! ToggleSpelling()
	if g:SpellModeFlag
		set nospell
		let g:SpellModeFlag = g:false
	else
		set spell spelllang=en_us
		let g:SpellModeFlag = g:true
	endif
endfunction

call DebugPrint('runtime! vimrc.d/00.14-spelling.vimrc: end')

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
