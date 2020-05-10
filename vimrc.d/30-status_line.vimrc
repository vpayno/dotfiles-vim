"
" ~/.vim/vimrc.d/30-status_line.vimrc
"
" https://github.com/powerline/powerline
" https://github.com/vim-airline/vim-airline
" https://github.com/itchyny/lightline.vim

" Always enable the status line.
set laststatus=2

if _enable_powerline

	call DebugPrint("30-status_line.vimrc: start [powerline]")

	" Powerline requires a Python component. Use virtualenv here if the
	" minimum required version isn't found on the system.

	" Load plugins.
	packadd! powerline

	call DebugPrint("30-status_line.vimrc: end [powerline]")

elseif _enable_airline

	call DebugPrint("30-status_line.vimrc: start [airline]")

	" Load plugins.
	packadd! onedark.vim
	packadd! vim-airline

	" Set the airline theme.
	let g:airline_theme='onedark'

	call DebugPrint("30-status_line.vimrc: end [airline]")

else

	call DebugPrint("30-status_line.vimrc: start [lightline]")

	" Load plugins.
	packadd! onedark.vim
	packadd! lightline.vim

	call DebugPrint("30-status_line.vimrc: end [lightline]")

endif
