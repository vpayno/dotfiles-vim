"
" ~/.vim/vimrc.d/53.2-cpp.vimrc
"

call DebugPrint('53.2-cpp.vimrc: start')

call extend(g:vimspector_install_gadgets, [ 'vscode-cpptools' ])

" let g:ale_cpp_astyle_executable = 'astyle'
" let g:ale_cpp_astyle_project_options = ''

let g:ale_cpp_ccls_executable = 'ccls' . 'disabled'
" let g:ale_cpp_ccls_init_options = {}

let g:ale_cpp_clangd_executable = g:clangd_bin
" let g:ale_cpp_clangd_options = ''

let g:ale_cpp_clangcheck_executable = g:clang_check_bin
" let g:ale_cpp_clangcheck_options = '--'

let g:ale_cpp_clangformat_executable = g:clang_format_bin
" let g:ale_cpp_clangformat_options = ''

let g:ale_cpp_clangtidy_executable = g:clang_tidy_bin
" let g:ale_cpp_clangtidy_checks = ['*', '-llvm-header-guard', '-llvmlibc-restrict-system-libc-headers']
" let g:ale_cpp_clangtidy_options = '--quiet --'
" let g:ale_cpp_clangtidy_extra_options = ''
let g:ale_cpp_clangtidy_fix_errors = g:disable

" https://github.com/KDE/clazy
" let g:ale_cpp_clazy_executable = 'clazy-standalone'
" let g:ale_cpp_clazy_checks = [level1]
" let g:ale_cpp_clazy_options = ''

" let g:ale_cpp_cppcheck_executable = 'cppcheck'
" let g:ale_cpp_cppcheck_options = '--enable=style'

" let g:ale_cpp_cpplint_executable = 'cpplint'
" let g:ale_cpp_cpplint_options = ''

" let g:ale_cpp_cquery_executable = 'cquery'
" let g:ale_cpp_cquery_cache_directory = '~/.cache/cquery'

" let g:ale_cpp_flawfinder_executable = 'flawfinder'
" let g:ale_cpp_flawfinder_minlevel = 1
" let g:ale_cpp_flawfinder_options = ''
" let g:ale_cpp_flawfinder_error_severity = 6

call DebugPrint('53.2-cpp.vimrc: end')

" uncrustify settings from 53.1-c.vimrc

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
