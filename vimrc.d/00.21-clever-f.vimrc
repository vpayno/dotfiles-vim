"
" vimrc.d/00.21-clever-f.vimrc
"

" https://github.com/rhysd/clever-f.vim

if _enable_targets
	call DebugPrint('00.21-clever-f.vimrc: start')

	packadd! clever-f.vim

	let g:clever_f_ignore_case = g:disable

	" If you type a lower case character, the case will be ignored however if you type an upper case character it will only search for upper case characters.
	let g:clever_f_smart_case = g:enable

	" Enable to search a character only in current line.
	let g:clever_f_across_no_line = g:disable

	" Always search forward with 'f' and backwards with 'F'.
	let g:clever_f_fix_key_direction = g:enable

	let g:clever_f_show_prompt = g:disable

	map ; <Plug>(clever-f-repeat-forward)
	map , <Plug>(clever-f-repeat-back)

	call DebugPrint('00.21-clever-f.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
