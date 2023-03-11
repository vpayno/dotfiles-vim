"
" ~/.vim/vimrc.d/38-json.vimrc
"
" https://github.com/elzr/vim-json

call DebugPrint('38-json.vimrc: start')

:au BufNewFile,BufRead *.json set filetype=json

" https://vi.stackexchange.com/questions/16906/how-to-format-json-file-in-vim
function FormatJson()
    execute '%!jq --sort-keys .'
endfunction

call DebugPrint('38-json.vimrc: end')
