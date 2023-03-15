"
" ~/.vim/vimrc.d/43.0-bash.vimrc
"

call DebugPrint('43.0-bash.vimrc: start')

if (&ft==#'sh' || &ft==#'bash')
	set ts=4
	set sw=4
	set noexpandtab
	set ai
	" :%retab!

	" pack/upstream/opt/vim-shfmt
	packadd! vim-shfmt

	" autosave on write
	let g:shfmt_fmt_on_save = 1

	" extra arguments
	let g:shfmt_extra_args = ''
endif

call extend(g:vimspector_install_gadgets, [ 'vscode-bash-debug' ])

call DebugPrint('43.0-bash.vimrc: end')

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
