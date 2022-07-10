"
" ~/.vim/vimrc.d/98-docker.vimrc
"
" https://github.com/ekalinin/Dockerfile.vim

if _enable_docker
	call DebugPrint("98-docker.vimrc: start")

	" Load plugins.
	packadd! Dockerfile.vim

	call DebugPrint("98-docker.vimrc: end")
endif
