"
" vimrc.d/00.29-replace_with_register.vimrc
"

" https://github.com/inkarkat/vim-ReplaceWithRegister

if _enable_replace_with_register
	call DebugPrint('00.29-replace_with_register.vimrc: start')

	packadd! vim-ReplaceWithRegister

	" nmap <Leader>r  <Plug>ReplaceWithRegisterOperator
	" nmap <Leader>rr <Plug>ReplaceWithRegisterLine
	" xmap <Leader>r  <Plug>ReplaceWithRegisterVisual

	call DebugPrint('00.29-replace_with_register.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
