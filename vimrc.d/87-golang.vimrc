"
" ~/.vim/vimrc.d/87-golang.vimrc
"
" https://github.com/fatih/vim-go

" go install golang.org/x/tools/gopls@latest

" autocmd! BufWritePost *.go | execute 'silent !go fmt %' | :e
" autocmd! BufWritePost *.go | execute '! go fmt %' | :e

if _enable_golang
	call DebugPrint("87-golang.vimrc: start")

	" Load plugins.
	packad! vim-go

	" Use :GoInstallBinaries to install dependencies.
	" github.com/mgechev/revive@latest
	" golang.org/x/tools/cmd/guru@master
	" github.com/davidrjenni/reftools/cmd/fillstruct@master
	" github.com/rogpeppe/godef@latest
	" github.com/fatih/motion@latest
	" github.com/kisielk/errcheck@latest to folder /home/vpayno/go/bin
	" github.com/koron/iferr@master
	" github.com/jstemmer/gotags@master
	" github.com/josharian/impl@master
	" github.com/golangci/golangci-lint/cmd/golangci-lint@latest
	" honnef.co/go/tools/cmd/keyify@master
	" honnef.co/go/tools/cmd/staticcheck@latest
	" github.com/klauspost/asmfmt/cmd/asmfmt@latest

	" https://github.com/golang/tools/blob/master/gopls/doc/vim.md
	" go install golang.org/x/tools/gopls@latest
	let g:go_def_mode='gopls'
	let g:go_info_mode='gopls'
	let g:go_metalinter_autosave=1
	let g:go_metalinter_autosave_enabled=['revive', 'govet', 'typecheck', 'staticcheck']
	" let g:go_metalinter_command='golangci-lint'


	if has('nvim')
		" Launch gopls when Go files are in use
		let g:LanguageClient_serverCommands = {
			\ 'go': ['gopls']
			\ }
		" Run gofmt on save
		autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()
	endif

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
