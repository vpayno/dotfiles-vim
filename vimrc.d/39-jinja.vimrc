"
" ~/.vim/vimrc.d/39-jinja.vimrc
"

if _enable_jinja
	call DebugPrint('39-jinja.vimrc: start')

	packadd! vim-jinja

	augroup au_jinja
		autocmd!
		autocmd BufNewFile,BufRead *.jinja set filetype=jinja
	augroup end

	call DebugPrint('39-jinja.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
