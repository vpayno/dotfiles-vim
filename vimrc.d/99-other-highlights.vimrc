"
" ~/.vim/vimrc.d/99-other-highlights.vimrc
"
" https://github.com/sakshamgupta05/vim-todo-highlight

if _enable_other_todo_highlight
    call DebugPrint('99-other-highlights.vimrc: start [vim-todo-highlight]')

    " Load plugins.
    packadd! vim-todo-highlight

    " Disable highlighting for the default annotations:
    " let g:todo_highlight_disable_default = ['TODO', 'FIXME']

    let g:todo_highlight_config = {
        \   'TODO': {
        \       'gui_fg_color': '#ffffff',
        \       'gui_bg_color': '#ffbd2a',
        \       'cterm_fg_color': 'white',
        \       'cterm_bg_color': '214'
        \   },
        \   'FIXME': {
        \       'gui_fg_color': '#ffffff',
        \       'gui_bg_color': '#f06292',
        \       'cterm_fg_color': 'white',
        \       'cterm_bg_color': '204'
        \   }
        \}

    call DebugPrint('99-other-highlights.vimrc: end [vim-todo-highlight]')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
