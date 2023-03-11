"
" ~/.vim/vimrc.d/80.0-docker.vimrc
"
" https://github.com/ekalinin/Dockerfile.vim
" https://github.com/skanehira/denops-docker.vim

if _enable_docker
	call DebugPrint('80.0-docker.vimrc: start')

	" Load plugins.
	packadd! Dockerfile.vim

    if _enable_denops

        packadd! denops-docker.vim

    endif

	call DebugPrint('80.0-docker.vimrc: end')
endif
