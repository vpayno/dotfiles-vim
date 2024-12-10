"
" ~/.vim/vimrc.d/40.8-just.vimrc
"
" https://github.com/casey/just
" https://github.com/vmchale/just-vim
"

if _enable_just
    call DebugPrint('40.8-just.vimrc: start')

    packadd! just-vim

    call DebugPrint('40.8-just.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
