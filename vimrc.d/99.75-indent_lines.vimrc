"
" vimrc.d/99.75-indent_lines.vimrc
"

scriptencoding utf-8

" other possible solutions:
" https://github.com/Yggdroot/indentLine
" https://github.com/nathanaelkane/vim-indent-guides
" https://stackoverflow.com/questions/2158305/is-it-possible-to-display-indentation-guides-in-vim

call DebugPrint('99.75-indent_lines.vimrc: start')

" https://gist.github.com/iburago/734422

nnoremap <silent> <leader><bar> :call ToggleIndentGuides()<cr>

let g:_use_indentlines_plugin = g:true
let g:_enable_indent_guides_on_enter = g:true

function! EnableIndentGuides()
	if !&expandtab && &tabstop == &shiftwidth
		" echom 'EnableIndentGuides() -> tabs'
		let b:indentguides = 'tabs'
		let b:indentguides_listopt = &l:list
		let b:indentguides_listcharsopt = &l:listchars

		" set the indentation symbol here
		" exe 'setl listchars' . '+'[!&l:list] . '=tab:˙\  list'
		exe 'setl listchars' . '+'[!&l:list] . '=tab:·\  list'
		" exe 'setl listchars' . '+'[!&l:list] . '=tab:•\  list'
		" exe 'setl listchars' . '+'[!&l:list] . '=tab:¦\  list'
	else
		" echom 'EnableIndentGuides() -> spaces'
		if g:_use_indentlines_plugin
			:IndentLinesToggle
		else
			let b:indentguides = 'spaces'
			let pos = range(1, &textwidth > 0 ? &textwidth : 80, &shiftwidth)
			call map(pos, '"\\%" . v:val . "v"')
			let pat = '\%(\_^ *\)\@<=\%(' . join(pos, '\|') . '\) '
			" let b:indentguides_match = matchadd('ColorColumn', pat)
			let b:indentguides_match = matchadd('CursorLine', pat)
		endif
	endif
endfunction

function! DisableIndentGuides()
	if b:indentguides ==# 'tabs'
		" echom 'DisableIndentGuides() -> tabs'
		let &l:list = b:indentguides_listopt
		let &l:listchars = b:indentguides_listcharsopt
		unlet b:indentguides_listopt b:indentguides_listcharsopt
	else
		" echom 'DisableIndentGuides() -> tabs'
		call matchdelete(b:indentguides_match)
		unlet b:indentguides_match
	endif

	unlet b:indentguides
endfunction

function! ToggleIndentGuides()
	if !exists('b:indentguides')
		call EnableIndentGuides()
	else
		call DisableIndentGuides()
	endif
endfunction

if _enable_indent_guides && &filetype!=#'gitcommit'
	augroup au_enable_indent_guides
		autocmd!
		if g:_enable_indent_guides_on_enter
			autocmd BufEnter * call EnableIndentGuides()
		else
			autocmd BufEnter * call DisableIndentGuides()
		endif
	augroup end

	" This works with spaces only, not tabs.
	" https://github.com/Yggdroot/indentLine
	packadd! indentLine

	" these chars only work in utf-8 encoded files (files with spaces)
	" https://www.ascii-code.com/ - Windows-1252
	" https://www.meridianoutpost.com/resources/articles/ASCII-Extended-Code-reference-chart.php
	" • 	█∙ ·   ▓ ▒ ░ ■ ≡ ≥ » › º ¨ ° º ¼ ½ ¾ ¹ ² ³
	let g:indentLine_char_list = ['│', '|', '¦', '┆', '┊', '•', '·', '∙', '˙']
	" let g:indentLine_char = '¦'
	" let g:indentLine_char = '▏'
	" let g:indentLine_setConceal = 0
endif

call DebugPrint('99.75-indent_lines.vimrc: end')

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
