"
" ~/vimrc.d/35-nerdtree.vimrc
"
" https://github.com/preservim/nerdtree
" https://github.com/Xuyuanp/nerdtree-git-plugin
" https://github.com/jistr/vim-nerdtree-tabs

if _enable_nerdtree
	call DebugPrint("35-nerdtree.vimrc: start")

	" Load the plugin.
	packadd! nerdtree

	" Open NERDTree when vim starts up.
	autocmd vimenter * NERDTree

	" ctrl-n to toggle NERDTree
	" map <C-n> :NERDTreeToggle<CR>

	autocmd StdinReadPre * let s:std_in=1

	" start NERDTree automatically when no files are specified.
	"autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

	" start NERDTree automatically when opening a directory.
	"autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

	" Automatically close vim if NERDTree is the only window left open.
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

	" Focus the file window when starting vim with a file argument.
	" NERDTree opens the file buffer first, then it's own window so just go
	" back to the previous window.
	" autocmd VimEnter * NERDTree | wincmd p
	autocmd VimEnter * wincmd p

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
			\ "Modified"  : "✹",
			\ "Staged"    : "✚",
			\ "Untracked" : "✭",
			\ "Renamed"   : "➜",
			\ "Unmerged"  : "═",
			\ "Deleted"   : "✖",
			\ "Dirty"     : "✗",
			\ "Clean"     : "✔︎",
			\ 'Ignored'   : '☒',
			\ "Unknown"   : "?"
		\ }
	endif

	call DebugPrint("35-nerdtree.vimrc: end")
endif
