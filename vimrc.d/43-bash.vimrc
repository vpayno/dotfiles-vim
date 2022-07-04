"
" ~/.vim/vimrc.d/43-bash.vimrc
"

call DebugPrint("43-bash.vimrc: start")

if (&ft=='sh' || &ft=='bash')
	set ts=4
	set sw=4
	set noexpandtab
	set ai
	" :%retab!
endif

call DebugPrint("43-bash.vimrc: end")
