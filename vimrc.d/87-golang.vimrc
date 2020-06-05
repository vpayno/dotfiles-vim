"
" ~/.vim/vimrc.d/87-golang.vimrc
"
" https://github.com/fatih/vim-go

if _enable_golang
	call DebugPrint("87-golang.vimrc: start")

	" Load plugins.
	packad! vim-go

	" Disable the vim version warning
	" let g:go_version_warning = 0

	call DebugPrint("87-golang.vimrc: end")
endif
