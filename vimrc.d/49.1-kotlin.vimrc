"
" ~/.vim/vimrc.d/49.1-kotlin.vimrc
"

if _enable_kotlin
    call DebugPrint('49.1-kotlin.vimrc: start')

    packadd! kotlin-vim

    call DebugPrint('49.1-kotlin.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
