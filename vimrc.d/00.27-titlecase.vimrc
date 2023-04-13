"
" vimrc.d/00.27-titlecase.vimrc
"

" https://github.com/christoomey/vim-titlecase

if _enable_titlecase
    call DebugPrint('00.27-titlecase.vimrc: start')

    packadd! vim-titlecase

    let g:titlecase_excluded_words = []

    " nmap <leader>gz  <Plug>Titlecase
    " vmap <leader>gz  <Plug>Titlecase
    " nmap <leader>gzz <Plug>TitlecaseLine

    call DebugPrint('00.27-titlecase.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
