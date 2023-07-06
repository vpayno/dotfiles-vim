"
" ~/.vim/vimrc.d/53.1-c.vimrc
"

call DebugPrint('53.1-c.vimrc: start')

let g:ale_c_astyle_executable = 'astyle'
let g:ale_c_astyle_project_options = ''

" use clangd as the lsp
" https://github.com/MaskRay/ccls/wiki/Customization#initialization-options
let g:ale_c_ccls_executable = 'ccls'
" let g:ale_c_ccls_init_options = {}

let g:ale_c_clangcheck_executable = g:clang_check_bin
let g:ale_c_clangcheck_options = '--'

let g:ale_c_clangd_executable = g:clangd_bin
" let g:ale_c_clangformat_options = ''

let g:ale_c_clangformat_executable = g:clang_format_bin
" let g:ale_c_clangformat_options = '-style=file '
" let g:ale_c_clangformat_style_option = ''
let g:ale_c_clangformat_use_local_file = g:enable

" https://clang.llvm.org/extra/clang-tidy/checks/list.html
let g:ale_c_clangtidy_executable = g:clang_tidy_bin
let g:ale_c_clangtidy_checks = ['*', '-llvm-header-guard', '-llvmlibc-restrict-system-libc-headers']
let g:ale_c_clangtidy_options = '--quiet --'
" let g:ale_c_clangtidy_extra_options = ''
let g:ale_c_clangtidy_fix_errors = g:enable

let g:ale_c_cppcheck_executable = '' " 'cppcheck'
let g:ale_c_cppcheck_options = '--enable=style'

let g:ale_c_flawfinder_executable = '' " 'flawfinder'
" let g:ale_c_flawfinder_minlevel = 1
" let g:ale_c_flawfinder_options = ''
" let g:ale_c_flawfinder_error_severity = 6

let g:ale_c_uncrustify_executable = '' " 'uncrustify'
" let g:ale_c_uncrustify_options = ''

let g:ale_c_cpplint_executable = '' " 'cpplint'
" let g:ale_c_cpplint_options = ''

call DebugPrint('53.1-c.vimrc: end')

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
