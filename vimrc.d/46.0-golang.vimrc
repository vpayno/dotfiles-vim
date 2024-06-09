"
" ~/.vim/vimrc.d/46.0-golang.vimrc
"
" https://github.com/fatih/vim-go

" go install golang.org/x/tools/gopls@latest
" :GoInstallBinaries
"
" https://github.com/josa42/coc-go
" :CocInstall coc-go

" autocmd! BufWritePre *.go | execute 'silent %!goimports | golines | gofumpt'

if (_enable_golang)
    call DebugPrint('46.0-golang.vimrc: start')

    " Disable the vim version warning
    " let g:go_version_warning = 0

    call extend(g:vimspector_install_gadgets, [ 'delve' ])
    call extend(g:vimspector_install_gadgets, [ 'vscode-go' ])

    function! ConfigureFileTypeGo()
        if g:_enable_ale && g:_enable_ale_go

            " https://github.com/dense-analysis/ale/blob/master/doc/ale-go.txt
            let b:ale_go_golangci_lint_package = g:enable
            " let g:ale_go_bingo_options = ''
            " let g:ale_go_gobuild_options = ''
            " let g:ale_go_gofmt_options = ''
            " let g:ale_go_gofumpt_options = ''
            let g:ale_go_golangci_lint_options = 'run --enable "govet,ineffassign,asciicheck,goimports,misspell,revive,wsl" ./...'
            " let g:ale_go_golines_options = ''
            " let g:ale_go_golint_options = ''
            " let g:ale_go_gopls_fix_options = ''
            " let g:ale_go_gopls_options = ''
            " let g:ale_go_govet_options = ''
            " let g:ale_go_langserver_options = ''
            " let g:ale_go_revive_options = ''
            " let g:ale_go_staticcheck_options = ''

            " https://github.com/golang/tools/blob/master/gopls/doc/analyzers.md
            " let g:ale_go_gopls_init_options = {'ui.diagnostic.analyses': {}}

            if g:_enable_ale_go_fixers
                let g:ale_fixers.go = ['gopls', 'goimports', 'golines', 'gofumpt']
            else
                let g:ale_fixers.go = []
            endif

            if g:_enable_ale_go_linters
                let g:ale_linters.go = ['gopls', 'golangci-lint']
            else
                let g:ale_linters.go = []
            endif

            let g:ale_linters_ignore.go = []

        elseif g:_enable_golang_vimgo
            call DebugPrint('46.0-golang.vimrc: start [vim-go]')

            " Load plugins.
            packadd! vim-go

            " Use :GoInstallBinaries to install dependencies.
            " github.com/mgechev/revive@latest
            " golang.org/x/tools/cmd/guru@master
            " github.com/davidrjenni/reftools/cmd/fillstruct@master
            " github.com/rogpeppe/godef@latest
            " github.com/fatih/motion@latest
            " github.com/kisielk/errcheck@latest
            " github.com/koron/iferr@master
            " github.com/jstemmer/gotags@master
            " github.com/josharian/impl@master
            " github.com/golangci/golangci-lint/cmd/golangci-lint@latest
            " honnef.co/go/tools/cmd/keyify@master
            " honnef.co/go/tools/cmd/staticcheck@latest
            " github.com/klauspost/asmfmt/cmd/asmfmt@latest

            " https://github.com/golang/tools/blob/master/gopls/doc/vim.md
            " go install golang.org/x/tools/gopls@latest

            " the highlights in vim-go are fairly unreadable
            let g:go_auto_sameids = g:disable
            let g:go_auto_type_info = g:enable
            let g:go_def_mode = 'gopls'
            let g:go_highlight_build_constraints = g:disable
            let g:go_highlight_extra_types = g:disable
            let g:go_highlight_fields = g:disable
            let g:go_highlight_function_calls = g:disable
            let g:go_highlight_functions = g:disable
            let g:go_highlight_generate_tags = g:disable
            let g:go_highlight_operators = g:disable
            let g:go_highlight_types = g:disable
            let g:go_info_mode = 'gopls'
            "let g:go_metalinter_autosave = g:enable
            "let g:go_metalinter_autosave_enabled = [ 'errcheck', 'gocritic', 'gosec', 'govet', 'ineffassign', 'revive', 'staticcheck', 'typecheck' ]
            "let g:go_metalinter_command = 'staticcheck'
            "let g:go_metalinter_command = 'golangci-lint'
            "let g:go_metalinter_enabled = [ 'errcheck', 'gocritic', 'gosec', 'govet', 'ineffassign', 'revive', 'staticcheck', 'typecheck' ]

            "let g:go_fmt_command = 'goimports'
            "let g:go_fmt_command = 'golines'
            "let g:go_fmt_command = 'gofumpt'
            "let g:go_fmt_options = {
                "\ 'gofmt': '',
                "\ 'golines': '-m 128',
                "\ 'goimports': '',
                "\ 'gofumpt': '',
                "\ }

            " Launch gopls when Go files are in use
            let g:LanguageClient_serverCommands = {
                \ 'go': ['gopls']
                \ }

            augroup ag_vimgo_gofmt
                autocmd!
                " Run gofmt on save
                autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()
                "autocmd BufWritePost *.go GoFmt
            augroup end

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

            call DebugPrint('46.0-golang.vimrc: end [vim-go]')

        elseif g:_enable_golang_govim
            call DebugPrint('46.0-golang.vimrc: start [govim]')

            " go install github.com/govim/govim/cmd/govim@latest
            packadd! govim

            " https://github.com/govim/govim/blob/main/cmd/govim/config/minimal.vimrc
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

            call DebugPrint('46.0-golang.vimrc: end [govim]')

        else
            augroup ag_golang_gofmt
                autocmd!
                autocmd BufWritePre *.go | execute 'silent %!goimports | golines | gofumpt'
            augroup end

        endif
    endfunction

    augroup ag_go_setup
        autocmd!
        autocmd BufEnter,BufRead,FileType * if &filetype==#'go' | call ConfigureFileTypeGo() | endif
    augroup end

    augroup au_go_ft_set
        autocmd!
        autocmd BufNewFile,BufRead *.go set filetype=go
        autocmd BufNewFile,BufRead go.mod set filetype=gomod
        autocmd BufNewFile,BufRead go.work set filetype=gowork
    augroup end

    call DebugPrint('46.0-golang.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
