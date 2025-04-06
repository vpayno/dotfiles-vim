"
" vimrc.d/57.0-xml.vimrc

if _enable_xml && (&filetype ==# 'xml' || &filetype ==# 'xhtml' || &filetype ==# 'html')
    call DebugPrint('57.0-xml.vimrc: start')

    function! ConfigureFileTypeXml()
        packadd! xml.vim

        command! -buffer XmlFmt let winsaved = winsaveview() | execute 'silent %! ~/.vim/scripts/xmlfmt -' | if v:shell_error > 0 | silent undo | else | silent :w | endif | call winrestview(winsaved)

        if g:_enable_xml_fmt
            set autoread
            augroup ag_xml_fmt
                autocmd!
                autocmd BufWritePost *.xml XmlFmt
            augroup end
        endif
    endfunction

    " <range>gq
    " set formatprg=$MYVIMDIR/scripts/xmlfmt
    " let &formatprg = g:MYVIMDIR . '/scripts/xmlfmt'

    augroup ag_xml_setup
        autocmd!
        autocmd BufEnter,BufRead,FileType * if &filetype==#'xml' | call ConfigureFileTypeXml() | endif
    augroup end

    augroup au_xml_ft
        autocmd!
        autocmd BufNewFile,BufRead *.xml set filetype=xml
    augroup end

    call DebugPrint('57.0-xml.vimrc: end')

endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
