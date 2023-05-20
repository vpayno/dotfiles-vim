"
" .vim/vimrc
"

" !has("compatible") or has("eval") or has("autocmd")
if v:version >= 500

    " Load helper functions and global variables.
    runtime! vimrc.d/00.00-helpers.vimrc

    call DebugPrint('vimrc: start [loading ' . $MYVIMRC . ']')

    " vint: -ProhibitEncodingOptionAfterScriptEncoding
    set encoding=utf-8
    scriptencoding utf-8
    " vint: +ProhibitEncodingOptionAfterScriptEncoding

    if g:debug_mode
        call DebugPrint('You can use `:messages` to show statusline messages.')
        call DebugPrint('You can use `:scriptnames` to show loaded plugins.')
        call DebugPrint('You can use `:function` to list all functions.')
        call DebugPrint("You can use `:verb set var_name?` to show that variable's set history.")
    endif

    " VIM & NEOVIM: Load the extra configs.
    runtime! vimrc.d/*.vimrc

    " NEOVIM: Load the extra configs.
    if has('nvim')
        runtime! vimrc.d/*.nvimrc
    endif

    if !has('nvim')
        "set pythonthreedll=/home/vpayno/.pyenv/versions/3.9.1/lib/libpython3.9.a
        set pythonthreedll=/home/vpayno/.pyenv/versions/3.10.2/lib/libpython3.so
    endif

    call DebugPrint('vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
