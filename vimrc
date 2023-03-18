"
" .vim/vimrc
"

" !has("compatible") or has("eval") or has("autocmd")
if v:version >= 500

	" Enable(1)/disable(0) debug mode.
	let g:_debug_mode = 0

    " The rest of the helper functions go in ./vimrc.d/00.00-helpers.vimrc
    function! DebugPrint(message)
        if g:_debug_mode
            echom 'DEBUG:' a:message
        endif
    endfunction

	" vint: -ProhibitEncodingOptionAfterScriptEncoding
	set encoding=utf-8
	scriptencoding utf-8
	" vint: +ProhibitEncodingOptionAfterScriptEncoding

	if g:_debug_mode
		call DebugPrint('You can use :messages to show statusline messages.')
		call DebugPrint('You can use :scriptnames to show loaded plugins.')
		call DebugPrint('You can use :function to list all functions.')
	endif

	call DebugPrint('runtime! vimrc.d/*.vimrc: start')

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

	call DebugPrint('runtime! vimrc.d/*.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
