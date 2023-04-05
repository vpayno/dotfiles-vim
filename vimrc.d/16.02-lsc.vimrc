"
" ~/.vim/vimrc.d/16.02-lsc.vimrc
"

" https://github.com/natebosch/vim-lsc

if _enable_lsc
	call DebugPrint('16.02-lsc.vimrc: start')

	" Load plugins.
	packadd! vim-lsc

	let g:lsc_enable_autocomplete = v:true

	" Use all the defaults (recommended):
	let g:lsc_auto_map = v:true

	" Apply the defaults with a few overrides:
	let g:lsc_auto_map = {'defaults': v:true, 'FindReferences': '<leader>r'}

	" Setting a value to a blank string leaves that command unmapped:
	let g:lsc_auto_map = {'defaults': v:true, 'FindImplementations': ''}

	" ... or set only the commands you want mapped without defaults.
	" Complete default mappings are:
	let g:lsc_auto_map = {
		\ 'GoToDefinition': '<C-]>',
		\ 'GoToDefinitionSplit': ['<C-W>]', '<C-W><C-]>'],
		\ 'FindReferences': 'gr',
		\ 'NextReference': '<C-n>',
		\ 'PreviousReference': '<C-p>',
		\ 'FindImplementations': 'gI',
		\ 'FindCodeActions': 'ga',
		\ 'Rename': 'gR',
		\ 'ShowHover': v:true,
		\ 'DocumentSymbol': 'go',
		\ 'WorkspaceSymbol': 'gS',
		\ 'SignatureHelp': 'gm',
		\ 'Completion': 'completefunc',
		\}

	" off, messages, verbose
	let g:lsc_trace_level = 'off'

	augroup au_lsc_cd
		autocmd CompleteDone * silent! pclose
	augroup end

	call DebugPrint('16.02-lsc.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
