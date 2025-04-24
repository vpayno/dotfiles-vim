"
" vimrc.d/34.2-zoxide.vimrc
"

" https://github.com/nanotee/zoxide.vim

if _enable_zoxide
    call DebugPrint('34.2-zoxide.vimrc: start')

    packadd! zoxide.vim

    call DebugPrint('34.2-zoxide.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
