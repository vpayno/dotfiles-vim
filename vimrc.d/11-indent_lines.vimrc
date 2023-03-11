"
" vimrc.d/11-indent_lines.vim
"

scriptencoding utf-8

" other possible solutions:
" https://github.com/Yggdroot/indentLine
" https://github.com/nathanaelkane/vim-indent-guides
" https://stackoverflow.com/questions/2158305/is-it-possible-to-display-indentation-guides-in-vim

if _enable_indent_guides
	call DebugPrint('11-indent_lines.vimrc: start')

	" https://gist.github.com/iburago/734422

	nnoremap <silent> <leader><bar> :call ToggleIndentGuides()<cr>

	function! ToggleIndentGuides()
		if !exists('b:indentguides')
			if !&expandtab && &tabstop == &shiftwidth
				let b:indentguides = 'tabs'
				let b:indentguides_listopt = &l:list
				let b:indentguides_listcharsopt = &l:listchars
				exe 'setl listchars' . '+'[!&l:list] . '=tab:˙\  list'
			else
				let b:indentguides = 'spaces'
				let pos = range(1, &textwidth > 0 ? &textwidth : 80, &shiftwidth)
				call map(pos, '"\\%" . v:val . "v"')
				let pat = '\%(\_^ *\)\@<=\%(' . join(pos, '\|') . '\) '
				let b:indentguides_match = matchadd('ColorColumn', pat)
			endif
		else
			if b:indentguides == 'tabs'
				let &l:list = b:indentguides_listopt
				let &l:listchars = b:indentguides_listcharsopt
				unlet b:indentguides_listopt b:indentguides_listcharsopt
			else
				call matchdelete(b:indentguides_match)
				unlet b:indentguides_match
			endif
			unlet b:indentguides
		endif
	endfunction

	call DebugPrint('11-indent_lines.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
