"
" vimrc.d/99.98-catch_all.vimrc
"

" run commands here that need to run at the end of the loading path

" fix issues with :help not being complete
packloadall | silent! helptags ALL

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
