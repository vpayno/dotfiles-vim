"
" ~/.vim/vimrc
"

" Enable(1)/disable(0) debug mode.
let g:_debug_mode = 1

" Enable/disable my options.
let _enable_line_wrap = 0

" Enable/disable plugins.
let _enable_ack = 1
let _enable_airline = 1 " if disabled, lightline is used
let _enable_nerdtree = 1
let _enable_nerdtree_git = 0
let _enable_orgmode = 0
let _enable_powerline = 0 " if disabled, airline is used
let _enable_ripgrep = 1

" Helper Functions.
function! DebugPrint(message)
    if g:_debug_mode
        echom "DEBUG:" a:message
    endif
endfunction

if g:_debug_mode
	call DebugPrint("You can use :messages to show statusline messages.")
	call DebugPrint("You can use :scriptnames to show loaded plugins.")
	call DebugPrint("You can use :function to list all functions.")
endif

call DebugPrint("runtime! vimrc.d/*.vimrc: start")

" Load the extra configs.
runtime! vimrc.d/*.vimrc

call DebugPrint("runtime! vimrc.d/*.vimrc: end")
