"
" ~/.vim/vimrc.d/76-tabnine.vimrc
"
" https://www.codota.com/
" https://github.com/codota/tabnine-vim

if _enable_tabnine && !has("nvim")
	call DebugPrint("76-tabnine.vimrc: start")

	packadd! tabnine-vim

	call DebugPrint("76-tabnine.vimrc: end")
endif
