"
" vimrc.d/51.0-haskell.vimrc
"
" https://github.com/haskell/stylish-haskell
" https://github.com/neovimhaskell/haskell-vim

if _enable_haskell
    call DebugPrint('51.0-haskell.vimrc: start')

    " Load plugins.
    packadd! haskell-vim

    augroup au_haskell
        autocmd!
        autocmd! BufWritePost *.hs | execute 'silent !brittany --write-mode inplace %' | :e
    augroup end


    call DebugPrint('51.0-haskell.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
