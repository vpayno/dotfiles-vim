"
" vimrc.d/97.01-neural.vimrc
"

" https://github.com/dense-analysis/neural

if _enable_ai && _enable_ai_neural
    call DebugPrint('97.01-neural.vimrc: start')

    packadd! neural

    call DebugPrint('97.01-neural.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
