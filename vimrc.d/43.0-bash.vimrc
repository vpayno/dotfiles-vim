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
endif

call extend(g:vimspector_install_gadgets, [ 'vscode-bash-debug' ])

call DebugPrint('43.0-bash.vimrc: end')

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
