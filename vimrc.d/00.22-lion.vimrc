"
" vimrc.d/00.22-lion.vimrc.vimrc
"

" https://github.com/tommcdo/vim-lion

if _enable_lion
    call DebugPrint('00.22-lion.vimrc.vimrc: start')

    packadd! vim-lion

    let g:lion_squeeze_spaces = g:enable

    let g:lion_map_right = 'gl'
    let g:lion_map_left = 'gL'

    call DebugPrint('00.22-lion.vimrc.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
