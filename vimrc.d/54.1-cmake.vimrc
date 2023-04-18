"
" ~/.vim/vimrc.d/54.1-cmake.vimrc
"

call DebugPrint('54.1-cmake.vimrc: start')

if _enable_cmake
    packadd! vim-cmake

    if _enable_ale
        "let g:ale_cmake_cmakeformat_options = ''
        "let g:ale_cmake_cmakelint_options = ''
        "let g:ale_cmake_cmake_lint_options = ''

        let g:ale_fixers.cmake = ['cmakeformat']
        let g:ale_linters.cmake = ['cmakelint']
        let g:ale_linters_ignore.cmake = []
    endif
endif

call DebugPrint('54.1-cmake.vimrc: end')

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
