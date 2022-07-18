"
" ~/.vim/vimrc.d/98-docker.vimrc
"
" https://github.com/ekalinin/Dockerfile.vim
" https://github.com/skanehira/denops-docker.vim

if _enable_docker
	call DebugPrint("98-docker.vimrc: start")

	" Load plugins.
	packadd! Dockerfile.vim

    if _enable_denops

        packadd! denops-docker.vim

    endif

	call DebugPrint("98-docker.vimrc: end")
endif
