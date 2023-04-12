"
" ~/.vim/vimrc.d/43.0-bash.vimrc
"

" https://github.com/josa42/coc-sh
" :CocInstall coc-sh

if _enable_sh && &filetype==#'sh'
	call DebugPrint('43.0-bash.vimrc: start')

	set tabstop=4
	set shiftwidth=4
	set noexpandtab
	set autoindent
	" :%retab!

	" pack/upstream/opt/vim-shfmt
	packadd! vim-shfmt

	let g:shfmt_fmt_on_save = g:enable
	let g:shfmt_extra_args = ''

" 	augroup au_shell_retab
" 		autocmd!
" 		autocmd BufReadPost * if &filetype==#'sh' | set noet | :%retab! | :w | endif
" 	augroup end

	augroup ag_sh_shfmt
		autocmd!
		autocmd! BufWritePost * if &filetype==#'sh' | Shfmt
	augroup end

	call extend(g:vimspector_install_gadgets, [ 'vscode-bash-debug' ])

	call DebugPrint('43.0-bash.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
