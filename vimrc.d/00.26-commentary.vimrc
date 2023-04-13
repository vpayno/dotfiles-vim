"
" vimrc.d/00.26-commentary.vimrc
"

" https://github.com/tpope/vim-commentary

if _enable_commentary
    call DebugPrint('00.26-commentary.vimrc: start')

    packadd! vim-commentary

    " example of how to set comment type for an unsupported file type
    " autocmd FileType apache setlocal commentstring=#\ %s

    call DebugPrint('00.26-commentary.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
