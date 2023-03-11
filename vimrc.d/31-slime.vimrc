"
" ~/vimrc.d/31-slime.vimrc
"
" https://github.com/jpalardy/vim-slime

if _enable_slime
	call DebugPrint('31-slime.vimrc: start')

	" Load the plugin.
	packadd! vim-slime

	let g:slime_target = 'tmux'

	let g:slime_paste_file = tempname()

	let g:slime_default_config = {'socket_name': 'default', 'target_pane': '{last}'}

	xmap <c-c><c-c> <Plug>SlimeRegionSend
	nmap <c-c><c-c> <Plug>SlimeParagraphSend
	nmap <c-c>v     <Plug>SlimeConfig

	let g:slime_dont_ask_default = 1

	let g:slime_preserve_curpos = 0

	call DebugPrint('31-slime.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
