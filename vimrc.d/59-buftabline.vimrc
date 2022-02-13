"
" vimrc.d/59-buftabline.vimrc
"

if _enable_buftabline
	call DebugPrint("59-buftabline.vimrc: start")

	" Load the plugin.
	packadd! vim-buftabline

	" When opening a new file, the existing buffer is hidden instead of closed.
	set hidden

	" Configure key bindings.
	nnoremap <C-N> :bnext<CR>
	nnoremap <C-P> :bprev<CR>

	call DebugPrint("59-buftabline.vimrc: end")
endif
