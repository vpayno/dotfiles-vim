"
" vimrc.d/51.0-haskell.vimrc
"
" https://github.com/haskell/stylish-haskell
" https://github.com/neovimhaskell/haskell-vim

autocmd! BufWritePost *.hs | execute 'silent !brittany --write-mode inplace %' | :e

if _enable_haskell
	call DebugPrint('51.0-haskell.vimrc: start')

	" Load plugins.
	" packadd! haskell-vim

	call DebugPrint('51.0-haskell.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
