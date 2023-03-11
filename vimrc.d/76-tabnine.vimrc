"
" ~/.vim/vimrc.d/76-tabnine.vimrc
"
" https://www.codota.com/
" https://github.com/codota/tabnine-vim

if _enable_tabnine && !has('nvim') && !_enable_youcompleteme_tabnine
	call DebugPrint('76-tabnine.vimrc: start')

	packadd! tabnine-vim

	call DebugPrint('76-tabnine.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
