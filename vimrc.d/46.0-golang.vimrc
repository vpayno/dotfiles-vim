"
" ~/.vim/vimrc.d/46.0-golang.vimrc
"
" https://github.com/fatih/vim-go

" go install golang.org/x/tools/gopls@latest
" :GoInstallBinaries

" autocmd! BufWritePost *.go | execute 'silent !go fmt %' | :e
" autocmd! BufWritePost *.go | execute '! go fmt %' | :e

if _enable_golang
	call DebugPrint('46.0-golang.vimrc: start')

	" Load plugins.
	packadd! vim-go

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
	let g:go_metalinter_autosave_enabled=[ 'gocritic', 'gosec', 'govet', 'ineffassign', 'revive', 'staticcheck', 'typecheck' ]
	let g:go_metalinter_command='golangci-lint'

	let g:go_fmt_command = 'golines'
	let g:go_fmt_options = {
		\ 'golines': '-m 128',
		\ }

	if has('nvim')
		" Launch gopls when Go files are in use
		let g:LanguageClient_serverCommands = {
			\ 'go': ['gopls']
			\ }
		augroup ag_golang_gofmt
			autocmd!
			" Run gofmt on save
			autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()
		augroup end
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

	" go install github.com/govim/govim/cmd/govim@latest
	" https://github.com/govim/govim/blob/main/cmd/govim/config/minimal.vimrc
	if _enable_golang_govim
		set mouse=a

		" To get hover working in the terminal we need to set ttymouse. See
		"
		" :help ttymouse
		"
		" for the appropriate setting for your terminal. Note that despite the
		" automated tests using xterm as the terminal, a setting of ttymouse=xterm
		" does not work correctly beyond a certain column number (citation needed)
		" hence we use ttymouse=sgr
		set ttymouse=sgr

		" Suggestion: By default, govim populates the quickfix window with diagnostics
		" reported by gopls after a period of inactivity, the time period being
		" defined by updatetime (help updatetime). Here we suggest a short updatetime
		" time in order that govim/Vim are more responsive/IDE-like
		set updatetime=500

		" Suggestion: To make govim/Vim more responsive/IDE-like, we suggest a short
		" balloondelay
		set balloondelay=250

		" Suggestion: Turn on the sign column so you can see error marks on lines
		" where there are quickfix errors. Some users who already show line number
		" might prefer to instead have the signs shown in the number column; in which
		" case set signcolumn=number
		set signcolumn=yes

		" Suggestion: Turn on syntax highlighting for .go files. You might prefer to
		" turn on syntax highlighting for all files, in which case
		"
		" syntax on
		"
		" will suffice, no autocmd required.

		augroup ag_golang_govim
			autocmd!
			autocmd! BufEnter,BufNewFile *.go,go.mod syntax on
			autocmd! BufLeave *.go,go.mod syntax off
		augroup end

		" Suggestion: turn on auto-indenting. If you want closing parentheses, braces
		" etc to be added, https://github.com/jiangmiao/auto-pairs. In future we might
		" include this by default in govim.
		set autoindent
		set smartindent
		filetype indent on

		" Suggestion: define sensible backspace behaviour. See :help backspace for
		" more details
		set backspace=2

		" Suggestion: show info for completion candidates in a popup menu
		if has('patch-8.1.1904')
			set completeopt+=popup
			set completepopup=align:menu,border:off,highlight:Pmenu
		endif
	endif

	" Disable the vim version warning
	" let g:go_version_warning = 0

	call extend(g:vimspector_install_gadgets, [ 'delve' ])
	call extend(g:vimspector_install_gadgets, [ 'vscode-go' ])

	call DebugPrint('46.0-golang.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
