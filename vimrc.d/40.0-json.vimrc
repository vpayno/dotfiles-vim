"
" ~/.vim/vimrc.d/40.0-json.vimrc
"
" https://github.com/elzr/vim-json

if &filetype==#'json'
    call DebugPrint('40.0-json.vimrc: start')

    " packadd! vim-json

    " don't hide double quotes
    let g:vim_json_syntax_conceal = g:disable

    "augroup au_json
        "autocmd!
        "autocmd BufNewFile,BufEnter,BufRead *.json set filetype=json
    "augroup end

    "augroup ag_json_jsonfmt
        "autocmd!
        "autocmd! BufWritePost *.json | execute 'silent !"${HOME}"/.vim/scripts/jsonfmt --vim %' | :e
    "augroup end

    " https://vi.stackexchange.com/questions/16906/how-to-format-json-file-in-vim
    function FormatJson()
        execute '%!jq --sort-keys .'
    endfunction

    command! JsonFmt %!jq --sort-keys .

    if _enable_ale
        let g:ale_fixers.json = ['fixjson', 'jq']
        let g:ale_linters.json = ['jsonlint']
        let g:ale_linters_ignore.json = []
    endif

    call DebugPrint('40.0-json.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
