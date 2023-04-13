"
" vimrc.d/36.0-tabs.vimrc
"
" https://github.com/gcmt/taboo.vim

if _enable_taboo
    call DebugPrint('36.0-tabs.vimrc: start')

    " Load plugins.
    packadd! taboo.vim

    " Force the same look in gui aps.
    set guioptions-=e

    " Remember tab names when saving a session.
    set sessionoptions+=tabpages,globals

    call DebugPrint('36.0-tabs.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
