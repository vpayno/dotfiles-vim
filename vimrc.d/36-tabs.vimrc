"
" vimrc.d/36-tabs.vimrc
"
" https://github.com/gcmt/taboo.vim

if _enable_taboo

	" Load plugins.
	packadd! taboo.vim

	" Force the same look in gui aps.
	set guioptions-=e

	" Remember tab names when saving a session.
	set sessionoptions+=tabpages,globals

endif
