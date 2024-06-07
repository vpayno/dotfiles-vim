"
" ~/.vim/vimrc.d/54.1-cmake.vimrc
"

call DebugPrint('54.1-cmake.vimrc: start')

if g:_enable_cmake
    function! ConfigureFileTypeCmake()
        if has('terminal')
            packadd! vim-cmake
        endif

        if g:_enable_ale
            "let g:ale_cmake_cmakeformat_options = ''
            "let g:ale_cmake_cmakelint_options = ''
            "let g:ale_cmake_cmake_lint_options = ''

            let g:ale_fixers.cmake = ['cmakeformat']
            let g:ale_linters.cmake = ['cmakelint']
            let g:ale_linters_ignore.cmake = []
        endif
    endfunction

    augroup au_cmake_ft_set
        autocmd!
        autocmd BufNewFile,BufRead CMakeLists.txt,*.cmake set filetype=cmake
    augroup end

    augroup ag_cmake_setup
        autocmd!
        autocmd BufEnter,BufRead,FileType * if &filetype==#'cmake' | call ConfigureFileTypeCmake() | endif
    augroup end
endif

call DebugPrint('54.1-cmake.vimrc: end')

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
