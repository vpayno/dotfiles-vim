"
" ~/.vim/vimrc.d/45.0-rust.vimrc
"

" https://github.com/racer-rust/vim-racer.git
" https://github.com/racer-rust/racer
" https://github.com/rust-lang/rust.vim

" https://github.com/fannheyward/coc-rust-analyzer
" :CocInstall coc-rust-analyzer

if (&filetype==#'rust' && _enable_rust)
	call DebugPrint('45.0-rust.vimrc: start')

	if _enable_rust_rustvim
		packadd! rust.vim

		" rust.vim options
		let g:rustfmt_autosave = g:enable
		let g:ale_rust_cargo_use_check = g:enable
		let g:ale_rust_cargo_check_tests = g:enable
		let g:ale_rust_cargo_check_examples = g:enable
		let g:rust_cargo_check_benches = g:disable
		let g:rust_fold = g:enable
		let g:rust_bang_comment_leader = g:enable

		" Send clipboard to rust playpen.
		if has('macunix')
			let g:rust_clip_command = 'pbcopy'
		else
			let g:rust_clip_command = 'xclip -selection clipboard'
		endif
	endif

	if _enable_rust_vimracer
		packadd! vim-racer

		set hidden
		let g:racer_cmd = '/home/vpayno/.cargo/bin/racer'
		let g:racer_experimental_completer = 1	" shoe the complete function definition
		let g:racer_insert_paren = 1	" insert parenthesis in the completion

		augroup Racer
			autocmd!
			autocmd FileType rust nmap <buffer> gd		   <Plug>(rust-def)
			autocmd FileType rust nmap <buffer> gs		   <Plug>(rust-def-split)
			autocmd FileType rust nmap <buffer> gx		   <Plug>(rust-def-vertical)
			autocmd FileType rust nmap <buffer> gt		   <Plug>(rust-def-tab)
			autocmd FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)
		augroup END
	endif

	if _enable_rust_coc
		" highlight CocFloating ctermbg=grey

		inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

		nnoremap <silent> K :call ShowDocumentation()<CR>

		function! ShowDocumentation()
			if CocAction('hasProvider', 'hover')
				call CocActionAsync('doHover')
			else
				call feedkeys('K', 'in')
			endif
		endfunction

		nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
		nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
		inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
		inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
		vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
		vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
	endif

	"augroup ag_rust_rustfmt
		"autocmd!
		"autocmd! BufWritePost * if &filetype==#'rust' | RustFmt | :e
		"autocmd! BufWritePost * if &filetype==#'rust' | execute 'silent !rustfmt %' | :e
	"augroup end

	packadd! tagbar

	" https://alpha2phi.medium.com/setting-up-neovim-for-rust-debugging-termdebug-and-vimspector-df749e1ba47c
	" termdebugger is included with vim >=8.1
	packadd! termdebug
	let termdebugger='rust-gdb'

	call DebugPrint('45.0-rust.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
