"
" ~/.vim/vimrc.d/95.1-vim-themis.vimrc
"
" https://github.com/thinca/vim-themis

if _enable_vim_themis
    call DebugPrint('95.1-vim-themis.vimrc: start')

    " Load plugins.
    packadd! vim-themis

    call DebugPrint('95.1-vim-themis.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
