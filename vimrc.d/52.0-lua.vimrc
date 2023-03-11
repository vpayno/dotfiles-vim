"
" ~/.vim/vimrc.d/52.0-lua.vimrc
"

call DebugPrint('52.0-lua.vimrc: start')

call extend(g:vimspector_install_gadgets, [ 'local-lua-debugger-vscode' ])

call DebugPrint('52.0-lua.vimrc: end')

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
