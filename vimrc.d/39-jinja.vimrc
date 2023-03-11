"
" ~/.vim/vimrc.d/39-jinja.vimrc
"

call DebugPrint('39-jinja.vimrc: start')

:au BufNewFile,BufRead *.jinja set filetype=jinja

call DebugPrint('39-jinja.vimrc: end')

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
