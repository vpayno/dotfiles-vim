"
" ~/.vim/vimrc.d/16.00-lsp.vimrc
"
" https://github.com/prabirshrestha/vim-lsp
" https://github.com/mattn/vim-lsp-setting

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
    call DebugPrint('16.00-lsp.vimrc: start')

    " Load plugins.
    packadd! vim-lsp
    packadd! vim-lsp-settings

    let g:lsp_log_file = '/dev/null'

    " register language server
    augroup LSC
        autocmd!

        if executable('ruff-lsp')
            " pip install ruff-lsp ruff
            autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'ruff-lsp',
                \ 'cmd': {server_info->['ruff-lsp']},
                \ 'allowlist': ['python']
                \ })

        elseif executable('pylsp')
            " pip install python-lsp-server python-lsp-ruff
            autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'pylsp',
                \ 'cmd': {server_info->['pylsp']},
                \ 'allowlist': ['python']
                \ })
        endif

        if executable('gopls')
            autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'gopls',
                \ 'cmd': {_->['gopls']},
                \ 'allowlist': ['go']
                \ })
        endif

        if executable('rust-analyzer')
            autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'rust-analyzer',
                \ 'cmd': {_->['rust-analyzer']},
                \ 'allowlist': ['rust']
                \ })
        endif

        if executable('haskell-language-server')
            autocm User lsp_setup call lsp#register_server({
                \ 'name': 'haskell-language-server',
                \ 'cmd': {_->['haskell-language-server']},
                \ 'allowlist': ['haskell']
                \ })
        endif

        if executable('awk-language-server')
            autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'awk-language-server',
                \ 'cmd': {_->['awk-language-server']},
                \ 'allowlist': ['awk', 'gawk']
                \ })
        endif

        if executable('solargraph')
            autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'ruby-lsp',
                \ 'cmd': {_->['solargraph', 'stdio']},
                \ 'allowlist': ['ruby']
                \ })
        endif

        if executable('wasm-lsp')
            autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'wasm-lsp',
                \ 'cmd': {_->['wasm-lsp']},
                \ 'allowlist': ['wat', 'wast']
                \ })
        endif

        autocmd User lsp_setup call lsp#register_server({
            \ 'name': 'lua-language-server',
            \ 'cmd': {server_info->[$HOME . '/.vim/scripts/lua-language-server']},
            \ 'allowlist': ['lua']
            \ })

        if executable('cuelsp')
            autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'cuelsp',
                \ 'cmd': {server_info->['cuelsp']},
                \ 'allowlist': ['cue'],
                \ })
        endif

        if executable('gleam')
            autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'gleamlsp',
                \ 'cmd': {server_info->['gleam', 'lsp']},
                \ 'allowlist': ['gleam'],
                \ })
        endif

        if executable('R')
            autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'r-lsp',
                \ 'cmd': {server_info->[$HOME . '/.vim/scripts/r-lsp']},
                \ 'allowlist': ['r'],
                \ })
        endif

        autocmd User lsp_server_init call <SID>setup_ls()
        autocmd BufEnter * call <SID>setup_ls()
    augroup END

    inoremap <C-t>     <C-x><C-u>

    " disable diagnostics etc.
    let g:lsp_diagnostics_enabled = g:disable
    let g:lsp_diagnostics_signs_enabled = g:disable
    let g:lsp_diagnostics_virtual_text_enabled = g:disable
    let g:lsp_diagnostics_highlights_enabled = g:disable
    let g:lsp_document_code_action_signs_enabled = g:disable

    let g:lsp_fold_enabled = g:disable

    set foldmethod=expr
      \ foldexpr=lsp#ui#vim#folding#foldexpr()
      \ foldtext=lsp#ui#vim#folding#foldtext()

    " let g:lsp_document_highlight_enabled = g:disable
    " highlight lspReference ctermfg=red guifg=red ctermbg=green guibg=green

    " Disable the vim version warning
    " let g:go_version_warning = g:disable

    function! s:on_lsp_buffer_enabled() abort
        setlocal omnifunc=lsp#complete
        setlocal signcolumn=yes
        if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
        nmap <buffer> gd <plug>(lsp-definition)
        nmap <buffer> gs <plug>(lsp-document-symbol-search)
        nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
        nmap <buffer> gr <plug>(lsp-references)
        nmap <buffer> gi <plug>(lsp-implementation)
        nmap <buffer> gt <plug>(lsp-type-definition)
        nmap <buffer> <leader>rn <plug>(lsp-rename)
        nmap <buffer> [g <plug>(lsp-previous-diagnostic)
        nmap <buffer> ]g <plug>(lsp-next-diagnostic)
        nmap <buffer> K <plug>(lsp-hover)
        nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
        nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

        let g:lsp_format_sync_timeout = 1000
        augroup au_lsp_sync
            autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
        augroup END
    endfunction

    augroup lsp_install
        au!
        " call s:on_lsp_buffer_enabled only for languages that has the server registered.
        autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
    augroup END

    call DebugPrint('16.00-lsp.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
