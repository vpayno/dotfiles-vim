"
" ~/.vim/vimrc.d/37-snippets.vimrc
"
if _enable_snipmate
    call DebugPrint('37-snippets.vimrc: start [snipmate]')

    " Load plugins.
    packadd! vim-addon-mw-utils
    packadd! tlib_vim
    packadd! vim-snipmate
    packadd! vim-snippets

    let g:snipMate = get(g:, 'snipMate', {}) " Allow for vimrc re-sourcing
    let g:snipMate.scope_aliases = {}

    call DebugPrint('37-snippets.vimrc: end [snipmate]')

elseif _enable_ultisnips
    call DebugPrint('37-snippets.vimrc: start [ultisnips]')

    " Load plugins.
    packadd! ultisnips
    packadd! vim-snippets

    call DebugPrint('37-snippets.vimrc: end [ultisnips]')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
