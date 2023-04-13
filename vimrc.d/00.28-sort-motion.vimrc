"
" vimrc.d/00.28-sort-motion.vimrc
"

" https://github.com/christoomey/vim-sort-motion

if _enable_sort_motion
    call DebugPrint('00.28-sort-motion.vimrc: start')

    packadd! vim-sort-motion

    call DebugPrint('00.28-sort-motion.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
