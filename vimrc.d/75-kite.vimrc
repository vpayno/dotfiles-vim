"
" ~/.vim/vimrc.d/75-kite.vimrc
"
" https://github.com/kiteco/vim-plugin

if _enable_kite
	call DebugPrint("75-kite.vimrc: start")

	packadd! kite

	let g:kite_supported_languages = ['python', 'go']
	let g:kite_auto_complete=1
	let g:kite_snippets=1

	set completeopt+=menuone   " show the popup menu even when there is only 1 match
	set completeopt+=noinsert  " don't insert any text until user chooses a match
	set completeopt-=longest   " don't insert the longest common text
	set completeopt+=preview

	" To have the preview window automatically closed once a completion has been inserted:
	autocmd CompleteDone * if !pumvisible() | pclose | endif

	set belloff+=ctrlg  " if vim beeps during completion

	" Intelligent Snippets
	let g:kite_previous_placeholder = '<C-H>'
	let g:kite_next_placeholder = '<C-L>'

	nmap <silent> <buffer> gK <Plug>(kite-docs)

	" To have the documentation continually update itself as you move from keyword to keyword:
	let g:kite_documentation_continual=1

	set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
	set laststatus=2  " always display the status line

	"let g:kite_log=1 " enable debug

	call DebugPrint("75-kite.vimrc: end")
endif
