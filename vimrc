"
" ~/.vim/vimrc
"

" Enable(1)/disable(0) debug mode.
let g:_debug_mode = 1

" Enable/disable plugins.

" Helper Functions.
function! DebugPrint(message)
    if g:_debug_mode
        echom "DEBUG:" a:message
    endif
endfunction

" Load the extra configs.
runtime! vimrc.d/*.vimrc
