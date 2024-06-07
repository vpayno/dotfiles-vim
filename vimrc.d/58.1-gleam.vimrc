"
" vimrc.d/58.1-gleam.vimrc

if _enable_gleam
    call DebugPrint('58.1-gleam.vimrc: start')

    function! ConfigureFileTypeGleam()
        packadd! gleam.vim

        let g:ale_gleam_gleamlsp_executable = 'gleam'
        let g:ale_gleam_format_executable = 'gleam'

        let g:ale_linters.gleam = []
        let g:ale_fixers.gleam = ['gleam_format']
    endfunction

    augroup ag_gleam_setup
        autocmd!
        autocmd BufEnter,BufRead,FileType * if &filetype==#'gleam' | call ConfigureFileTypeGleam() | endif
    augroup end

    augroup au_gleam_ft
        autocmd!
        autocmd BufNewFile,BufRead *.gleam set filetype=gleam
    augroup end

    call DebugPrint('58.1-gleam.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
