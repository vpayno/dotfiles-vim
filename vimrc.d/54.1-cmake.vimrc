"
" ~/.vim/vimrc.d/54.1-cmake.vimrc
"

call DebugPrint('54.1-cmake.vimrc: start')

if _enable_cmake
    packadd! vim-cmake
endif

call DebugPrint('54.1-cmake.vimrc: end')

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
