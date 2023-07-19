"
" ~/.vim/vimrc.d/53.0-clang.vimrc
"

call DebugPrint('53.0-clang.vimrc: start')

" Check to see what the latest version of clang is installed.
let g:clangd_bin = 'clangd'
let g:clang_format_bin = 'clang-format'
let g:clang_check_bin = 'clang-check'
let g:clang_tidy_bin = 'clang-tidy'

let g:clangd_ver = 0
let g:clang_format_ver = 0
let g:clang_check_ver = 0
let g:clang_tidy_ver = 0

for i in range(9, 999)
    if executable(g:clangd_bin . '-' . string(i))
        let g:clangd_ver = string(i)
    endif

    if executable(g:clang_format_bin . '-' . string(i))
        let g:clang_format_ver = string(i)
    endif

    if executable(g:clang_check_bin . '-' . string(i))
        let g:clang_check_ver = string(i)
    endif

    if executable(g:clang_tidy_bin . '-' . string(i))
        let g:clang_tidy_ver = string(i)
    endif
endfor

if g:clangd_ver > 0
    let g:clangd_bin = g:clangd_bin . '-' . g:clangd_ver
endif

if g:clang_format_ver > 0
    let g:clang_format_bin = g:clang_format_bin . '-' . g:clang_format_ver
endif

if g:clang_check_ver > 0
    let g:clang_check_bin = g:clang_check_bin . '-' . g:clang_check_ver
endif

if g:clang_tidy_ver > 0
    let g:clang_tidy_bin = g:clang_tidy_bin . '-' . g:clang_tidy_ver
endif

if _enable_lsp
    " ccls is working better than clangd
    if executable('ccls')
        let g:c_cpp_lsp_bin = 'ccls'
    else
        let g:c_cpp_lsp_bin = g:clangd_bin
    endif

    if executable(g:c_cpp_lsp_bin)
        augroup lsp_c_cpp
            autocmd!
            autocmd User lsp_setup call lsp#register_server({
                        \ 'name': g:c_cpp_lsp_bin,
                        \ 'cmd': {server_info->[g:c_cpp_lsp_bin]},
                        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
                        \ })
            autocmd FileType c setlocal omnifunc=lsp#complete
            autocmd FileType cpp setlocal omnifunc=lsp#complete
            autocmd FileType objc setlocal omnifunc=lsp#complete
            autocmd FileType objcpp setlocal omnifunc=lsp#complete
        augroup end
    endif
endif

call DebugPrint('53.0-clang.vimrc: end')

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
