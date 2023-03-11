"
" vimrc.d/73.0-youcompleteme.vimrc
"
" https://github.com/davidhalter/jedi
" https://github.com/ycm-core/YouCompleteMe

if (_enable_youcompleteme || _enable_youcompleteme_tabnine) && !has('nvim')
	call DebugPrint('73.0-youcompleteme.vimrc: start [youcompleteme]')

	" Load plugins.
	if _enable_youcompleteme_tabnine
		packadd! YouCompleteMe-tabnine
	elseif _enable_youcompleteme
		packadd! YouCompleteMe
	endif

	call DebugPrint('73.0-youcompleteme.vimrc: end [youcompleteme]')
endif

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
