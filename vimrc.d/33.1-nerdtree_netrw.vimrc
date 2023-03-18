"
" ~/vimrc.d/33.1-nerdtree_netrw.vimrc
"
" https://github.com/preservim/nerdtree
" https://github.com/Xuyuanp/nerdtree-git-plugin
" https://github.com/jistr/vim-nerdtree-tabs

scriptencoding utf-8

if _enable_nerdtree
	call DebugPrint('33.1-nerdtree_netrw.vimrc: [nerdtree] start')

	" Load the plugin.
	packadd! nerdtree

	augroup au_nerdtree
		autocmd!

		" Open NERDTree when vim starts up.
		" autocmd vimenter * NERDTree

		" ctrl-n to toggle NERDTree
		" map <C-n> :NERDTreeToggle<CR>

		autocmd StdinReadPre * let s:std_in=1

		" start NERDTree automatically when no files are specified.
		"autocmd StdinReadPre * let s:std_in=1
		autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

		" start NERDTree automatically when opening a directory.
		"autocmd StdinReadPre * let s:std_in=1
		autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

		" Automatically close vim if NERDTree is the only window left open.
		autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif

		" Focus the file window when starting vim with a file argument.
		" NERDTree opens the file buffer first, then it's own window so just go
		" back to the previous window.
		" autocmd VimEnter * NERDTree | wincmd p
		autocmd VimEnter * wincmd p
	argument end

	" Arrow symbols - the unicode characters cause weird column alignment
	" issues on some platforms.
	" let g:NERDTreeDirArrowExpandable = '▸'
	" let g:NERDTreeDirArrowCollapsible = '▾'
	let g:NERDTreeDirArrowExpandable = '>'
	let g:NERDTreeDirArrowCollapsible = 'v'

	if _enable_nerdtree_git
		" Load plugin.
		packadd! nerdtree-git-plugin

		" Configure symbols.
		let g:NERDTreeIndicatorMapCustom = {
			\ 'Modified'  : '✹',
			\ 'Staged'	  : '✚',
			\ 'Untracked' : '✭',
			\ 'Renamed'   : '➜',
			\ 'Unmerged'  : '═',
			\ 'Deleted'   : '✖',
			\ 'Dirty'	  : '✗',
			\ 'Clean'	  : '✔︎',
			\ 'Ignored'   : '☒',
			\ 'Unknown'   : '?'
		\ }
	endif

	call DebugPrint('33.1-nerdtree_netrw.vimrc: [nerdtree] end')
else
	call DebugPrint('33.1-nerdtree_netrw.vimrc: [netrw] start')

	"let g:netrw_liststyle = 3

	"let g:netrw_banner = 1

	" Open files in a
	" 1: horizontal split
	" 2: vertical split
	" 3: new tab
	" 4: previous window
	"let g:netrw_browse_split = 1

	" ?
	" let g:netrw_altv = 1

	" pane width in %
	"let g:netrw_winsize = 25

	"let g:netrw_altv = 1

	call DebugPrint('33.1-nerdtree_netrw.vimrc: [netrw] end')
endif

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
