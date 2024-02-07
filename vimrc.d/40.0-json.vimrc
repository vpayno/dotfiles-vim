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

        " Disable quote concealing in JSON files
        let g:vim_json_conceal=0

        " indentLine sets this to 2
        " set conceallevel=0

        " https://vi.stackexchange.com/questions/16906/how-to-format-json-file-in-vim
        function! FormatJson()
            execute '%!jq --sort-keys --indent 4 .'
        endfunction

        command! JsonFmt %!jq --sort-keys --indent 4 .

        if g:_enable_ale && g:_enable_ale_json
            let g:ale_fixers.json = ['fixjson', 'jq']
            let g:ale_linters.json = ['jsonlint']
            let g:ale_json_jq_options = '. --sort-keys --indent 4'
            let g:ale_linters_ignore.json = []
        endif
    endfunction

    augroup ag_json_setup
        autocmd!
        autocmd BufEnter,BufRead,FileType * if &filetype==#'json' | call ConfigureFileTypeJson() | endif
    augroup end

    augroup au_json_ft
        autocmd!
        autocmd Filetype json
          \ let g:indentLine_setConceal = 0 |
          \ let g:vim_json_syntax_conceal = 0
    augroup end

    call DebugPrint('40.0-json.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
