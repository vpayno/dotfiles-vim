"
" ~/.vim/vimrc.d/40.0-json.vimrc
"
" https://github.com/elzr/vim-json

if _enable_json
    call DebugPrint('40.0-json.vimrc: start')

    function! ConfigureFileTypeJson()
        packadd! vim-json

        " don't hide double quotes
        let g:vim_json_syntax_conceal = g:disable

        " https://vi.stackexchange.com/questions/16906/how-to-format-json-file-in-vim
        function! FormatJson()
            execute '%!jq --sort-keys .'
        endfunction

        command! JsonFmt %!jq --sort-keys .

        if g:_enable_ale && g:_enable_ale_json
            let g:ale_fixers.json = ['fixjson', 'jq']
            let g:ale_linters.json = ['jsonlint']
            let g:ale_linters_ignore.json = []
        endif
    endfunction

    augroup ag_json_setup
        autocmd!
        autocmd BufEnter,BufRead,FileType * if &filetype==#'json' | call ConfigureFileTypeJson() | endif
    augroup end

    call DebugPrint('40.0-json.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
