"
" ~/vimrc.d/41.0-markdown.vimrc
"
" https://travis-ci.org/godlygeek/tabular
" https://travis-ci.org/plasticboy/vim-markdown

if _enable_markdown
	call DebugPrint('41.0-markdown.vimrc: start')

	" Load plugins.
	packadd! tabular	  " must load before vim-markdown
	packadd! vim-markdown

	let g:vim_markdown_math = g:enable
	let g:vim_markdown_toc_autofit = g:disable
	let g:vim_markdown_strikethrough = g:enable
	let g:vim_markdown_auto_insert_bullets = g:disable
	let g:vim_markdown_new_list_item_indent = g:disable

	"let g:vim_markdown_conceal = 0

	"let g:vim_markdown_folding_disabled = g:enable
	let g:vim_markdown_folding_level = 6
	let g:vim_markdown_folding_style_pythonic = g:enable
	"let g:vim_markdown_override_foldtext = g:disable

	call DebugPrint('41.0-markdown.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
