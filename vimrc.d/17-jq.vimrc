"
" ~/.vim/vimrc.d/17-jq.vimrc
"
" https://github.com/bfrg/vim-jq
" https://github.com/bfrg/vim-jqplay
" https://asciinema.org/a/276970
" https://shyr.io/blog/format-json-in-vim-jq
" https://til.hashrocket.com/posts/ha0ci0pvkj-format-json-in-vim-with-jq

if _enable_jq
	call DebugPrint('17-jq.vimrc: start (vim-jq)')

	" Load plugins.
	packadd! vim-jq

	" Don't highlight builtin functions/filters (default: 1)
	let g:jq_highlight_builtin_functions = 1

	" Don't highlight module prefix, like NAME:: (default: 1)
	let g:jq_highlight_module_prefix = 1

	" Don't highlight imported JSON file prefix, like $NAME:: (default: 1)
	let g:jq_highlight_json_file_prefix = 1

	" Highlight objects like .foo (default: 0)
	let g:jq_highlight_objects = 1

	" Highlight all function calls (default: 0)
	" This will highlight all words directly followed by an opening
	" parenthesis
	let g:jq_highlight_function_calls = 1

	call DebugPrint('17-jq.vimrc: end (vim-jq')
endif

if _enable_jqplay
	call DebugPrint('17-jq.vimrc: start (vim-jqplay)')

	" Load plugins.
	packadd! vim-jqplay

	call DebugPrint('17-jq.vimrc: end (vim-jqplay')
endif

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
