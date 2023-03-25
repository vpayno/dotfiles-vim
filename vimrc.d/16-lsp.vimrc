"
" ~/.vim/vimrc.d/16-lsp.vimrc
"
" https://github.com/prabirshrestha/vim-lsp
" https://github.com/mattn/vim-lsp-setting

" go install golang.org/x/tools/gopls@latest

" autocmd! BufWritePost *.go | execute 'silent !go fmt %' | :e
" autocmd! BufWritePost *.go | execute '! go fmt %' | :e

func! s:setup_ls(...) abort
	let l:servers = lsp#get_allowed_servers()

	" key mappings
	for l:server in l:servers
	let l:cap = lsp#get_server_capabilities(l:server)

	if has_key(l:cap, 'completionProvider')
		setlocal completefunc=lsp#complete
	endif

	if has_key(l:cap, 'hoverProvider')
		setlocal keywordprg=:LspHover
	endif

	if has_key(l:cap, 'codeActionProvider')
		nmap <silent><buffer>ga <plug>(lsp-code-action)
	endif

	if has_key(l:cap, 'definitionProvider')
		nmap <silent><buffer>gd <plug>(lsp-definition)
		nmap <silent><buffer>gk <plug>(lsp-peek-definition)
	endif
	endfor
endfunc

if _enable_lsp
	call DebugPrint('16-lsp.vimrc: start')

	" Load plugins.
	packadd! vim-lsp
	packadd! vim-lsp-settings

	" register language server
	augroup LSC
		autocmd!

		if executable('ruff-lsp')
			" pip install ruff-lsp ruff
			autocmd User lsp_setup call lsp#register_server({
				\ 'name': 'ruff-lsp',
				\ 'cmd': {server_info->['ruff-lsp']},
				\ 'allowlist': ['python']
				\})
		elseif executable('pylsp')
			" pip install python-lsp-server python-lsp-ruff
			autocmd User lsp_setup call lsp#register_server({
				\ 'name': 'ruff-lsp',
				\ 'cmd': {server_info->['ruff-lsp']},
				\ 'allowlist': ['python']
				\})
		endif

		autocmd User lsp_setup call lsp#register_server({
			\ 'name': 'gopls',
			\ 'cmd': {_->['gopls']},
			\ 'allowlist': ['go']
			\})

		autocmd User lsp_setup call lsp#register_server({
			\ 'name': 'rust-analyzer',
			\ 'cmd': {_->['rust-analyzer']},
			\ 'allowlist': ['rust']
			\})

		autocmd User lsp_setup call lsp#register_server({
			\ 'name': 'haskell-language-server',
			\ 'cmd': {_->['haskell-language-server']},
			\ 'allowlist': ['haskell']
			\})

		autocmd User lsp_server_init call <SID>setup_ls()
		autocmd BufEnter * call <SID>setup_ls()
	augroup END

	inoremap <C-t>	   <C-x><C-u>

	" disable diagnostics etc.
	let g:lsp_diagnostics_enabled = g:disable
	let g:lsp_diagnostics_signs_enabled = g:disable
	let g:lsp_diagnostics_virtual_text_enabled = g:disable
	let g:lsp_diagnostics_highlights_enabled = g:disable
	let g:lsp_document_code_action_signs_enabled = g:disable

	let g:lsp_fold_enabled = g:disable

	set foldmethod=expr
	  \ foldexpr=lsp#ui#vim#folding#foldexpr()
	  \ foldtext=lsp#ui#vim#folding#foldtext()

	" let g:lsp_document_highlight_enabled = g:disable
	" highlight lspReference ctermfg=red guifg=red ctermbg=green guibg=green

	" Disable the vim version warning
	" let g:go_version_warning = g:disable

	function! s:on_lsp_buffer_enabled() abort
		setlocal omnifunc=lsp#complete
		setlocal signcolumn=yes
		if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
		nmap <buffer> gd <plug>(lsp-definition)
		nmap <buffer> gs <plug>(lsp-document-symbol-search)
		nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
		nmap <buffer> gr <plug>(lsp-references)
		nmap <buffer> gi <plug>(lsp-implementation)
		nmap <buffer> gt <plug>(lsp-type-definition)
		nmap <buffer> <leader>rn <plug>(lsp-rename)
		nmap <buffer> [g <plug>(lsp-previous-diagnostic)
		nmap <buffer> ]g <plug>(lsp-next-diagnostic)
		nmap <buffer> K <plug>(lsp-hover)
		nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
		nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

		let g:lsp_format_sync_timeout = 1000
		autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
	endfunction

	augroup lsp_install
		au!
		" call s:on_lsp_buffer_enabled only for languages that has the server registered.
		autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
	augroup END

	call DebugPrint('16-lsp.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
