"
" vimrc.d/58.1-gleam.vimrc

if _enable_gleam
    call DebugPrint('58.1-gleam.vimrc: start')

    packadd! gleam.vim

    let g:ale_gleam_gleamlsp_executable = 'gleam'
    let g:ale_gleam_format_executable = 'gleam'

    let g:ale_linters.gleam = []
    let g:ale_fixers.gleam = ['gleam_format']

    call DebugPrint('58.1-gleam.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
