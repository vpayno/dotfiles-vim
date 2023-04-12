"
" vimrc.d/42.1-css.vimrc
"
" https://github.com/groenewege/vim-less
" https://github.com/ap/vim-css-color

if _enable_css
	call DebugPrint('42.1-css.vimrc: start')

	if _enable_css_less
		call DebugPrint('42.1-css.vimrc: start [vim-less]')

		" Load plugins.
		packadd! vim-less

		" nnoremap <Leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>

		call DebugPrint('42.1-css.vimrc: end [vim-less]')
	endif

	if _enable_css_color
		call DebugPrint('42.1-css.vimrc: start [vim-css-color]')

		" Load plugins.
		packadd! vim-css-color

		call DebugPrint('42.1-css.vimrc: end [vim-css-color]')
	endif

	call DebugPrint('42.1-css.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
