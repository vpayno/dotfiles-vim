"
" ~/vimrc.d/09-calendar-vim.vimrc
"
" https://github.com/mattn/calendar-vim

if _enable_calendar_vim
	call DebugPrint('09-calendar.vimrc: start')

	" Load plugins.
	packadd! calendar-vim

	call DebugPrint('09-calendar-vim.vimrc: end')
endif
