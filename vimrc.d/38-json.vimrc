"
" ~/.vim/vimrc.d/38-json.vimrc
"
" https://github.com/elzr/vim-json

call DebugPrint('38-json.vimrc: start')

augroup au_json
	autocmd!
	autocmd BufNewFile,BufRead *.json set filetype=json
augroup end

" https://vi.stackexchange.com/questions/16906/how-to-format-json-file-in-vim
function FormatJson()
	execute '%!jq --sort-keys .'
endfunction

call DebugPrint('38-json.vimrc: end')

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
