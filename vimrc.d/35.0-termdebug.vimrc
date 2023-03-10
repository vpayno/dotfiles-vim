"
" ~/.vim/vimrc.d/35.0-termdebug.vimrc
"

" https://alpha2phi.medium.com/setting-up-neovim-for-rust-debugging-termdebug-and-vimspector-df749e1ba47c
" termdebugger is included with vim >=8.1

call DebugPrint('35.0-termdebug.vimrc: start')

if _enable_termdebug
	packadd! termdebug
endif

call DebugPrint('35.0-termdebug.vimrc: end')

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
