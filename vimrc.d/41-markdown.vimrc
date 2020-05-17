"
" ~/vimrc.d/37-markdown.vimrc
"
" https://travis-ci.org/godlygeek/tabular
" https://travis-ci.org/plasticboy/vim-markdown

if _enable_markdown
	call DebugPrint("37-markdown.vimrc: start")

	" Load plugins.
	packadd! tabular      " must load before vim-markdown
	packadd! vim-markdown

	call DebugPrint("37-markdown.vimrc: end")
endif
