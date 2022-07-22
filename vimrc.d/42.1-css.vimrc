"
" vimrc.d/42.1-css.vimrc
"
" https://github.com/othree/html5.vim

if _enable_css
	call DebugPrint("42.1-css.vimrc: start")

    if _enable_css_less
        call DebugPrint("42.1-css.vimrc: start [vim-less]")

        " Load plugins.
        packadd! vim-less

        " nnoremap <Leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>

        call DebugPrint("42.1-css.vimrc: end [vim-less]")
    endif

	call DebugPrint("42.1-css.vimrc: end")
endif
