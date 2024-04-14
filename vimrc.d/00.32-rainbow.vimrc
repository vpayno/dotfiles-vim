"
" vimrc.d/00.32-rainbow.vimrc
"

" https://github.com/frazrepo/vim-rainbow

if _enable_rainbow
    call DebugPrint('00.32-rainbow.vimrc: start')

    packadd! vim-rainbow

    " enable for a few file types
    " au FileType c,cpp,objc,objcpp call rainbow#load()

    " global enable
    let g:rainbow_active = 1

    call DebugPrint('00.32-rainbow.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
