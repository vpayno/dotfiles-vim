"
" vimrc.d/00.15-snippets.vimrc
"

call DebugPrint('runtime! vimrc.d/00.15-snippets.vimrc: start')

" Read an empty HTML template and move cursor to title.
nnoremap ,html :-1read $HOME/.vim/templates/skeleton.html<CR>3jwf>a

call DebugPrint('runtime! vimrc.d/00.15-snippets.vimrc: end')

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
