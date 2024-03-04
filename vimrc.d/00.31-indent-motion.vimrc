"
" vimrc.d/00.31-indent-motion.vimrc
"

" https://github.com/tmhedberg/indent-motion

if _enable_indent_motion
    call DebugPrint('00.31-indent-motion.vimrc: start')

    packadd! indent-motion

    call DebugPrint('00.31-indent-motion.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
