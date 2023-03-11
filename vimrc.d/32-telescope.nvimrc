"
" ~/.vim/vimrc.d/32-telescope.nvimrc
"
" https://github.com/nvim-telescope/telescope.nvim
" https://github.com/nvim-telescope/telescope-file-browser.nvim

if _enable_telescope
	call DebugPrint('32-telescope.nvimrc: start')

	packadd! plenary.nvim
	packadd! telescope.nvim
	packadd! telescope-file-browser.nvim

	call DebugPrint('32-telescope.nvimrc: end')
endif

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
