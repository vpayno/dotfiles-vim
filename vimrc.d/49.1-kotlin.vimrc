"
" ~/.vim/vimrc.d/49.1-kotlin.vimrc
"

if _enable_kotlin
    call DebugPrint('49.1-kotlin.vimrc: start')

    function! ConfigureFileTypeKotlin()
        packadd! kotlin-vim
    endfunction

    augroup ag_kotlin_setup
        autocmd!
        autocmd BufEnter,BufRead,FileType * if &filetype==#'kotlin' | call ConfigureFileTypeKotlin() | endif
    augroup end

    augroup au_kotlin_ft_set
        autocmd!
        autocmd BufNewFile,BufRead *.kt,*.ktm,*.kts set filetype=kotlin
    augroup end

    call DebugPrint('49.1-kotlin.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
