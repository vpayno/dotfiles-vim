"
" ~/.vim/vimrc.d/15.0-gitgutter.vimrc
"

" https://github.com/airblade/vim-gitgutter
" https://github.com/tpope/vim-fugitive

if _enable_gitgutter
	call DebugPrint('15.0-gitgutter.vimrc: start')

	packadd! vim-gitgutter

	" let g:gitgutter_max_signs = -1 " default
	let g:gitgutter_max_signs=10000

	" Speed with which signs appear and change is governed by Vim’s updatetime option.
	set updatetime=100

	" Use separate columns for git status and for the line numbers.
	set signcolumn=yes

	let g:gitgutter_grep					= 'rg'
	let g:gitgutter_map_keys				= 0
	let g:gitgutter_sign_added				= '▎'
	let g:gitgutter_sign_modified			= '▎'
	let g:gitgutter_sign_modified_removed	= '▌'
	let g:gitgutter_sign_removed			= '▎'
	let g:gitgutter_sign_removed_first_line = '▎'

	set foldtext=gitgutter#fold#foldtext()

	" Use vim-gitgutter default mappings
	let g:gitgutter_map_keys = g:enable

	" ]c next, [c previus
	" nmap [g <Plug>GitGutterPrevHunkzz
	" nmap ]g <Plug>GitGutterNextHunkzz
	"
	" nmap <Leader>p <Plug>GitGutterPreviewHunk
	" nmap <Leader>+ <Plug>GitGutterStageHunk
	" nmap <Leader>- <Plug>GitGutterUndoHunk

	" stage hunks with <leader>hs, undo <leader>hs
	command! Gqf GitGutterQuickFix | copen

	" nmap ghs <Plug>(GitGutterStageHunk)
	" nmap ghu <Plug>(GitGutterUndoHunk)
	" nmap ghp <Plug>(GitGutterPreviewHunk)
	" omap ih <Plug>(GitGutterTextObjectInnerPending)
	" omap ah <Plug>(GitGutterTextObjectOuterPending)
	" xmap ih <Plug>(GitGutterTextObjectInnerVisual)
	" xmap ah <Plug>(GitGutterTextObjectOuterVisual)

	" Use window's location list instead of quickfix list.
	let g:gitgutter_use_location_list = g:disable

	" Add a list of counts of added, modified, and removed lines in the current buffer to the status line.
	if _enable_gitgutter_statusline
		function! GitStatus()
			let [a,m,r] = GitGutterGetHunkSummary()
			return printf('+%d ~%d -%d', a, m, r)
		endfunction
		set statusline+=%{GitStatus()}
	endif

	call DebugPrint('15.0-gitgutter.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
