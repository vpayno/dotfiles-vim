"
" vimrc.d/00.00-helpers.vimrc
"

" If helpers haven't been imported...
if get(g:, 'ImportedHelpers', 0) == 0

	let g:true = 1
	let g:false = 0

	let g:enable = g:true
	let g:disable = g:false

	let g:debug_mode = g:disable

	function! DebugPrint(message)
		if g:debug_mode
			echom 'DEBUG:' a:message
		endif
	endfunction

	call DebugPrint('runtime! vimrc.d/00.00-helpers.vimrc: start')

	let g:ImportedHelpers = get(g:, 'ImportedHelpers', g:true)

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
			return g:true
		else
			return g:false
		endif
	endfunction

	function! IsCodeFile()
		return ArrayIndex(g:languages, &filetype)
	endfunction

	call DebugPrint('runtime! vimrc.d/00.00-helpers.vimrc: end')

endif

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
