"
" ~/.vim/vimrc.d/35.1-vimspector.vimrc
"

" https://alpha2phi.medium.com/setting-up-neovim-for-rust-debugging-termdebug-and-vimspector-df749e1ba47c
" https://github.com/puremourning/vimspector

call DebugPrint('35.1-vimspector.vimrc: start')

if _enable_vimspector
	packadd! vimspector

	let g:vimspector_enable_mappings = 'HUMAN'

	nmap <leader>dd :call vimspector#Launch()<CR>
	nmap <leader>dx :VimspectorReset<CR>
	nmap <leader>de :VimspectorEval
	nmap <leader>dw :VimspectorWatch
	nmap <leader>do :VimspectorShowOutput

	let g:vimspector_install_gadgets = [ ]
	call extend(g:vimspector_install_gadgets, [ 'CodeLLDB' ])
endif

call DebugPrint('35.1-vimspector.vimrc: end')

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
