"
" ~/.vim/vimrc.d/50.0-dart.vimrc
"
" https://github.com/dart-lang/dart-vim-plugin

" autocmd! BufWritePre *.dart | execute 'silent %!dart format'

if _enable_dart
    call DebugPrint('50.0-dart.vimrc: start')

    function! ConfigureFileTypeDart()
        " Load plugins.
        packadd! dart-vim-plugin

        let dart_html_in_string=v:true
        let g:dart_style_guide = 2
        let g:dart_format_on_save = 1

        " (discover formatter options with dartfmt -h)
        " let g:dartfmt_options =

        let g:dart_trailing_comma_indent = v:true
        let g:lsc_auto_map = v:true
    endfunction

    augroup ag_dart_setup
        autocmd!
        autocmd BufEnter,BufRead,FileType * if &filetype==#'dart' | call ConfigureFileTypeDart() | endif
    augroup end

    augroup au_dart_ft_set
        autocmd!
        autocmd BufNewFile,BufRead *.dart set filetype=dart
    augroup end

    call DebugPrint('50.0-dart.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
