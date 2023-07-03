"
" ~/.vim/vimrc.d/53.0-clang.vimrc
"

call DebugPrint('53.0-clang.vimrc: start')

" Check to see what the latest version of clang is installed.
let g:clangd_bin = 'clangd'
let g:clang_format_bin = 'clangd-format'
let g:clang_check_bin = 'clangd-check'
let g:clang_tidy_bin = 'clangd-tidy'

for i in range(9, 999)
    if executable('clangd-' . string(i))
        let g:clangd_bin = 'clangd-' . string(i)
    endif
    if executable('clang-format-' . string(i))
        let g:clang_format_bin = 'clangd-format-' . string(i)
    endif
    if executable('clang-check-' . string(i))
        let g:clang_check_bin = 'clangd-check-' . string(i)
    endif
    if executable('clang-tidy-' . string(i))
        let g:clang_tidy_bin = 'clangd-tidy-' . string(i)
    endif
endfor

call DebugPrint('53.0-clang.vimrc: end')

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
