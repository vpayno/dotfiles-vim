"
" vimrc.d/42.0-html5_svg.vimrc
"
" https://github.com/othree/html5.vim

if _enable_html5_svg
    call DebugPrint('42.0-html5_svg.vimrc: start')

    function! ConfigureFileTypeHtmlSvg()
        packadd! html5.vim

        " let g:html5_event_handler_attributes_complete = 0
        " let g:html5_rdfa_attributes_complete = 0
        " let g:html5_microdata_attributes_complete = 0
        " let g:html5_aria_attributes_complete = 0
    endfunction

    augroup ag_html_svg_setup
        autocmd!
        autocmd BufEnter,BufRead,FileType * if &filetype==#'html' || &filetype==#'svg' | call ConfigureFileTypeHtmlSvg() | endif
    augroup end

    call DebugPrint('42.0-html5_svg.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
