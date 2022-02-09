"
" vimrc.d/85-youcompleteme.vimrc
"
" https://github.com/davidhalter/jedi
" https://github.com/ycm-core/YouCompleteMe

if _enable_youcompleteme && !has("nvim")
	call DebugPrint("85-youcompleteme.vimrc: start [youcompleteme]")

	" Load plugins.
	packadd! YouCompleteMe

	call DebugPrint("85-youcompleteme.vimrc: end [youcompleteme]")
endif
