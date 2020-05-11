"
" ~/.vim/vimrc.d/38-json.vimrc
"
" https://github.com/elzr/vim-json

call DebugPrint("38-json.vimrc: start")

:au BufNewFile,BufRead *.json set filetype=json

call DebugPrint("38-json.vimrc: end")
