"
" ~/.vim/vimrc.d/40.1-ale.vimrc
"
" https://github.com/dense-analysis/ale

" vint: -ProhibitEncodingOptionAfterScriptEncoding
set encoding=utf-8
scriptencoding utf-8
" vint: +ProhibitEncodingOptionAfterScriptEncoding

if _enable_ale
	call DebugPrint('40.1-ale.vimrc: start')

	" Must be set before ale is loaded.
	let g:ale_completion_enabled = g:disable

	packadd! ale

	let g:ale_set_quickfix = g:enable

	if g:false
	let g:ale_fixers = {
	\	'*': ['remove_trailing_lines', 'trim_whitespace'],
	\	'javascript': ['eslint'],
	\	'python': ['ruff', 'pyright', 'autopep8', 'mypy', 'bandit', 'mccabe', 'pycodestyle', 'pydocstyle', 'pyflakes', 'radon'],
	\	'go': ['govet', 'revive', 'gosec', 'staticcheck', 'guru', 'golangci-lint', 'errcheck', 'gocritic', 'ineffassign', 'typecheck'],
	\	'rust': ['clippy'],
	\	'yaml': ['yamllint'],
	\	'json': ['jsonlint'],
	\	'sh': ['shellcheck'],
	\	'vim': ['vint'],
	\}

	" Only run linters named in ale_linters settings.
	let g:ale_fix_on_save = g:enable
	let g:ale_linters_explicit = g:enable

	let g:ale_lint_on_save = g:enable
	if g:ale_lint_on_save
		" Write this in your vimrc file
		let g:ale_lint_on_text_changed = 'never'
		let g:ale_lint_on_insert_leave = g:disable
		" You can disable this option too
		" if you don't want linters to run on opening a file
		let g:ale_lint_on_enter = g:disable
	else
		let g:ale_lint_on_enter = g:enable
	endif

	" Disable whitespace warnings
	let g:ale_warn_about_trailing_whitespace = g:disable

	" default, current, disabled
	" let g:ale_virtualtext_cursor = 'current'

	let g:ale_sign_error = '>>'
	let g:ale_sign_warning = '--'

	"highlight clear ALEErrorSign
	"highlight clear ALEWarningSign

	let g:ale_sign_column_always = g:enable
	let g:ale_set_highlights = g:enable

	let g:ale_echo_msg_error_str = 'E'
	let g:ale_echo_msg_warning_str = 'W'
	let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

	" Set this. Airline will handle the rest.
	let g:airline#extensions#ale#enabled = 1

	function! LinterStatus() abort
		let l:counts = ale#statusline#Count(bufnr(''))

		let l:all_errors = l:counts.error + l:counts.style_error
		let l:all_non_errors = l:counts.total - l:all_errors

		return l:counts.total == 0 ? 'OK' : printf(
		\	'%dW %dE',
		\	all_non_errors,
		\	all_errors
		\)
	endfunction

	set statusline=%{LinterStatus()}

	let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰', '│', '─']
	" let g:ale_floating_window_border = repeat([''], 8)

	if _enable_coc
		let g:ale_disable_lsp = g:enable
	endif

	nmap <silent> <C-k> <Plug>(ale_previous_wrap)
	nmap <silent> <C-j> <Plug>(ale_next_wrap)
	nmap <silent> <C-e> <Plug>(ale_next_wrap)

	" call deoplete#custom#option('sources', {
	" \ '_': ['ale', 'foobar'],
	" \})

	set omnifunc=ale#completion#OmniFunc

	let g:ale_completion_autoimport = g:enable

	let g:ale_set_loclist = g:disable
	let g:ale_set_quickfix = ! g:ale_set_loclist

	let g:ale_open_list = g:enable
	" This can be useful if you are combining ALE with
	" some other plugin which sets quickfix errors, etc.
	let g:ale_keep_list_window_open = g:enable

	let g:ale_list_vertical = g:disable
	endif

	call DebugPrint('40.1-ale.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai: