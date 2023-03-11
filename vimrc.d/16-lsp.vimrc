"
" ~/.vim/vimrc.d/16-lsp.vimrc
"
" https://github.com/prabirshrestha/vim-lsp

" go install golang.org/x/tools/gopls@latest

" autocmd! BufWritePost *.go | execute 'silent !go fmt %' | :e
" autocmd! BufWritePost *.go | execute '! go fmt %' | :e

func! s:setup_ls(...) abort
    let l:servers = lsp#get_allowed_servers()

    " key mappings
    for l:server in l:servers
    let l:cap = lsp#get_server_capabilities(l:server)

    if has_key(l:cap, 'completionProvider')
        setlocal completefunc=lsp#complete
    endif

    if has_key(l:cap, 'hoverProvider')
        setlocal keywordprg=:LspHover
    endif

    if has_key(l:cap, 'codeActionProvider')
        nmap <silent><buffer>ga <plug>(lsp-code-action)
    endif

    if has_key(l:cap, 'definitionProvider')
        nmap <silent><buffer>gd <plug>(lsp-definition)
        nmap <silent><buffer>gk <plug>(lsp-peek-definition)
    endif
    endfor
endfunc

if _enable_lsp
    call DebugPrint('16-lsp.vimrc: start')

    " Load plugins.
    packadd! vim-lsp

    " register language server
    augroup LSC
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
            \ 'name': 'gopls',
            \ 'cmd': {_->['gopls']},
            \ 'allowlist': ['go']
            \})

        autocmd User lsp_server_init call <SID>setup_ls()
        autocmd BufEnter * call <SID>setup_ls()
    augroup END

    inoremap <C-t>     <C-x><C-u>

    " disable diagnostics etc.
    let g:lsp_diagnostics_enabled                = 0
    let g:lsp_diagnostics_signs_enabled          = 0
    let g:lsp_diagnostics_virtual_text_enabled   = 0
    let g:lsp_diagnostics_highlights_enabled     = 0
    let g:lsp_document_code_action_signs_enabled = 0

    let g:lsp_fold_enabled = 0

    set foldmethod=expr
      \ foldexpr=lsp#ui#vim#folding#foldexpr()
      \ foldtext=lsp#ui#vim#folding#foldtext()

    " let g:lsp_document_highlight_enabled = 0
    " highlight lspReference ctermfg=red guifg=red ctermbg=green guibg=green

    " Disable the vim version warning
    " let g:go_version_warning = 0

    call DebugPrint('16-lsp.vimrc: end')
endif
