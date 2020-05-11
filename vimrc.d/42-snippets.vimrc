"
" ~/.vim/vimrc.d/42-snippets.vimrc
"
if _enable_snipmate
	call DebugPrint("42-snippets.vimrc: start [snipmate]")

	" Load plugins.
	packadd! vim-snipmate

	call DebugPrint("42-snippets.vimrc: end [snipmate]")

elseif _enable_snippets
	call DebugPrint("42-snippets.vimrc: start [snippets]")

	" Load plugins.
	packadd! vim-snippets

	call DebugPrint("42-snippets.vimrc: end [snipets]")

elseif _enable_utilsnips
	call DebugPrint("42-snippets.vimrc: start [utilsnips]")

	" Load plugins.
	packadd! utilsnips

	call DebugPrint("42-snippets.vimrc: end [utilsnips]")
endif
