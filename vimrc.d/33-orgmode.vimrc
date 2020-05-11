"
" ~/vimrc.d/33-orgmode.vimrc
"
" https://github.com/jceb/vim-orgmode

if _enable_orgmode
	call DebugPrint("33-orgmode.vimrc: start")

	" Load plugins.
	packadd! vim-orgmode

	call DebugPrint("33-orgmode.vimrc: end")
endif
