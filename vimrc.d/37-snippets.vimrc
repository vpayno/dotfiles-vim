"
" ~/.vim/vimrc.d/37-snippets.vimrc
"
if _enable_snipmate
	call DebugPrint("37-snippets.vimrc: start [snipmate]")

	" Load plugins.
	packadd! vim-addon-mw-utils
	packadd! tlib_vim
	packadd! vim-snipmate
	packadd! vim-snippets

	let g:snipMate = get(g:, 'snipMate', {}) " Allow for vimrc re-sourcing
	let g:snipMate.scope_aliases = {}

	call DebugPrint("37-snippets.vimrc: end [snipmate]")

elseif _enable_utilsnips
	call DebugPrint("37-snippets.vimrc: start [utilsnips]")

	" Load plugins.
	packadd! utilsnips
	packadd! vim-snippets

	call DebugPrint("37-snippets.vimrc: end [utilsnips]")
endif
