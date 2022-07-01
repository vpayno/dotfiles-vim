"
" ~/.vim/vimrc.d/87-golang.vimrc
"
" https://github.com/fatih/vim-go

autocmd! BufWritePost *.go | execute 'silent !gofmt -w %' | :e

if _enable_golang
	call DebugPrint("87-golang.vimrc: start")

	" Load plugins.
	packad! vim-go

    " https://github.com/golang/tools/blob/master/gopls/doc/vim.md
    augroup LspGo
        au!
        autocmd User lsp_setup call lsp#register_server({
            \ 'name': 'go-lang',
            \ 'cmd': {server_info->['gopls']},
            \ 'whitelist': ['go'],
            \ })
        autocmd FileType go setlocal omnifunc=lsp#complete
        "autocmd FileType go nmap <buffer> gd <plug>(lsp-definition)
        "autocmd FileType go nmap <buffer> ,n <plug>(lsp-next-error)
        "autocmd FileType go nmap <buffer> ,p <plug>(lsp-previous-error)
    augroup END

	" Disable the vim version warning
	" let g:go_version_warning = 0

	call DebugPrint("87-golang.vimrc: end")
endif
