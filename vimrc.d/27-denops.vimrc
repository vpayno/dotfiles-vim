"
" ~/.vim/vimrc.d/27-denops.vimrc
"
" https://github.com/vim-denops/denops.vim

if _enable_denops
	call DebugPrint("27-denops.vimrc: start")

    " Manually start the shared server:
    " deno run -A --no-check ./denops/@denops-private/cli.ts

	" Load plugins.
	packadd! denops.vim

    " where to find the shared server
    let g:denops_server_addr = '127.0.0.1:32123'

	call DebugPrint("27-denops.vimrc: end")
endif
