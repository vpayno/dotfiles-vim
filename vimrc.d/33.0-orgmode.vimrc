"
" ~/vimrc.d/33.0-orgmode.vimrc
"
" https://github.com/jceb/vim-orgmode

if _enable_orgmode
    call DebugPrint('33.0-orgmode.vimrc: start')

    " Load plugins.
    packadd! vim-orgmode

    call DebugPrint('33.0-orgmode.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
