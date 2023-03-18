"
" vimrc.d/00.00-helpers.vimrc
"

call DebugPrint('runtime! vimrc.d/00.00-helpers.vimrc: start')

let g:True = 1
let g:False = 0

let g:Enable = g:True
let g:Disable = g:False

let g:languages = [
	\'python',
	\'ruby',
	\'perl',
	\'go',
	\'rust',
	\'sh',
	\'vim',
\]

function! ArrayIndex(list, item)
	if index(a:list, a:item) >= 0
		return g:True
	else
		return g:False
	endif
endfunction

function! IsCodeFile()
	return ArrayIndex(g:languages, &filetype)
endfunction

call DebugPrint('runtime! vimrc.d/00.00-helpers.vimrc: end')

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
