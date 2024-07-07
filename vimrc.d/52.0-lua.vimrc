"
" ~/.vim/vimrc.d/52.0-lua.vimrc
"

call DebugPrint('52.0-lua.vimrc: start')

call extend(g:vimspector_install_gadgets, [ 'local-lua-debugger-vscode' ])

augroup au_ale_lua_disable_balloons
    autocmd! FileType lua | let g:ale_set_balloons = g:disable
augroup end

call DebugPrint('52.0-lua.vimrc: end')

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
