"
" ~/.vim/vimrc.d/16.50-syntastic.vimrc
"

if _enable_syntastic
    call DebugPrint('16.50-syntastic.vimrc: start')

    packadd! syntastic

    let g:syntastic_check_on_open = g:enable

    let g:syntastic_vim_checkers = ['vint']

    let g:syntastic_lua_checkers = ['luac', 'luacheck']
    let g:syntastic_lua_checkers = ['luacheck']
    let g:syntastic_lua_luacheck_args = '--no-unused-args'

    let g:syntastic_enable_perl_checker = g:enable

    let g:syntastic_python_checkers = ['pylint']

    let g:syntastic_always_populate_loc_list = g:enable
    let g:syntastic_aggregate_errors = g:enable
    let g:syntastic_auto_loc_list = g:enable
    let g:syntastic_check_on_wq = g:enable
    map <leader>s :SyntasticCheck<CR>
    map <leader>d :SyntasticReset<CR>
    map <leader>e :lnext<CR>
    map <leader>r :lprev<CR>

    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    " https://github.com/vim-syntastic/syntastic/blob/master/doc/syntastic-checkers.txt

    let g:syntastic_python_checkers = ['pylint', 'pyflakes', 'python']

    " let g:syntastic_ruby_checkers = ['ruby', 'flog', 'reek', 'rubocop', 'sorbet']
    let g:syntastic_ruby_checkers = ['ruby', 'flog']

    augroup au_syntastic
        autocmd! BufWritePre *.rb | call KeepView('silent %!rufo')
    augroup end

    call DebugPrint('16.50-syntastic.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
