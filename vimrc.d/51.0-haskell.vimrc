"
" vimrc.d/51.0-haskell.vimrc
"
" https://github.com/haskell/stylish-haskell
" https://github.com/neovimhaskell/haskell-vim

if _enable_haskell
    call DebugPrint('51.0-haskell.vimrc: start')

    function! ConfigureFileTypeHaskell()
        " Load plugins.
        packadd! haskell-vim

        augroup au_haskell
            autocmd!
            autocmd! BufWritePost *.hs | execute 'silent !brittany --write-mode inplace %' | :e
        augroup end
    endfunction

    augroup ag_haskell_setup
        autocmd!
        autocmd BufEnter,BufRead,FileType * if &filetype==#'haskell' | call ConfigureFileTypeHaskell() | endif
    augroup end

    augroup au_haskell_ft_set
        autocmd!
        autocmd BufNewFile,BufRead *.hs set filetype=haskell
    augroup end

    call DebugPrint('51.0-haskell.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
