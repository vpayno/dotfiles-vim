"
" vimrc.d/34.1-fzf.vimrc
"

" https://github.com/junegunn/fzf
" https://github.com/junegunn/fzf.vim

if _enable_fzf
	call DebugPrint('34.1-fzf.vimrc: start')

	packadd! fzf
	packadd! fzf.vim

	if g:disable
		" This is the default option:
		" - Preview window on the right with 50% width
		" - CTRL-/ will toggle preview window.
		" - Note that this array is passed as arguments to fzf#vim#with_preview function.
		" - To learn more about preview window options, see `--preview-window` section of `man fzf`.
		let g:fzf_preview_window = ['right,50%', 'ctrl-/']
	endif

	if g:disable
		" Preview window is hidden by default. You can toggle it with ctrl-/.
		" It will show on the right with 50% width, but if the width is smaller
		" than 70 columns, it will show above the candidate list
		let g:fzf_preview_window = ['hidden,right,50%,<70(up,40%)', 'ctrl-/']
	endif

	if g:disable
		" Empty value to disable preview window altogether
		let g:fzf_preview_window = []
	endif

	" fzf.vim needs bash to display the preview window.
	" On Windows, fzf.vim will first see if bash is in $PATH, then if
	" Git bash (C:\Program Files\Git\bin\bash.exe) is available.
	" If you want it to use a different bash, set this variable.
	" let g:fzf_preview_bash = 'C:\Git\bin\bash.exe'

	if g:disable
		" [Buffers] Jump to the existing window if possible
		let g:fzf_buffers_jump = g:enable
	endif

	if g:disable
		" [[B]Commits] Customize the options used by 'git log':
		let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
	endif

	if g:disable
		" [Tags] Command to generate tags file
		let g:fzf_tags_command = 'ctags -R'
	endif

	if g:disable
		" [Commands] --expect expression for directly executing the command
		let g:fzf_commands_expect = 'alt-enter,ctrl-x'
	endif

	if g:disable
		" Default definition of Files command.
		command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, <bang>0)
	endif

	if g:disable
		" Let's say you want to a variation of it called ProjectFiles that only searches inside ~/projects directory. Then you can do it like this:
		command! -bang ProjectFiles call fzf#vim#files('~/projects', <bang>0)
	endif

	if g:disable
		" Or, if you want to override the command with different fzf options, just pass a custom spec to the function.
		command! -bang -nargs=? -complete=dir Files
			\ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline']}, <bang>0)
	endif

	if g:disable
		" Want a preview window?
		command! -bang -nargs=? -complete=dir Files
			\ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'cat {}']}, <bang>0)
	endif

	if g:disable
		" It kind of works, but you probably want a nicer previewer program than cat. fzf.vim ships a versatile preview script you can readily use. It internally executes bat for syntax highlighting, so make sure to install it.
		command! -bang -nargs=? -complete=dir Files
			\ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)
	endif

	if g:disable
		" However, it's not ideal to hard-code the path to the script which can be different in different circumstances. So in order to make it easier to set up the previewer, fzf.vim provides fzf#vim#with_preview helper function. Similarly to fzf#wrap, it takes a spec dictionary and returns a copy of it with additional preview options.
		command! -bang -nargs=? -complete=dir Files
			\ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)
	endif

	if g:disable
		" You can just omit the spec argument if you only want the previewer.
		command! -bang -nargs=? -complete=dir Files
			\ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
	endif

	" The following example implements GGrep command that works similarly to predefined Ag or Rg using fzf#vim#grep.

	if g:disable
		" The second argument to fzf#vim#grep is 0 (false), because git grep does not print column numbers.
		" We set the base directory to git root by setting dir attribute in spec dictionary.
		" The preview script supports grep format (FILE_PATH:LINE_NO:...), so we can just wrap the spec with fzf#vim#with_preview as before to enable previewer.
		command! -bang -nargs=* GGrep
			\ call fzf#vim#grep(
			\	'git grep --line-number -- '.shellescape(<q-args>), 0,
			\	fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

		" You can see the definition of Rg command with :command Rg. With the information, you can redefine it with the preview window enabled. In this case, we're only interested in setting up the preview window, so we will omit the spec argument to fzf#vim#preview.
		command! -bang -nargs=* Rg
			\ call fzf#vim#grep(
			\	'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
			\	fzf#vim#with_preview(), <bang>0)

		" We will name the new command all-uppercase RG so we can still access the default version.
		" --bind 'change:reload:rg ... {q}' will make fzf restart ripgrep process whenever the query string, denoted by {q}, is changed.
		" With --disabled option, fzf will no longer perform search. The query string you type on fzf prompt is only used for restarting ripgrep process.
		" Also note that we enabled previewer with fzf#vim#with_preview. The last argument to the function, ctrl-/, is the key to toggle the preview window.
		function! RipgrepFzf(query, fullscreen)
			let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
			let initial_command = printf(command_fmt, shellescape(a:query))
			let reload_command = printf(command_fmt, '{q}')
			let spec = {'options': ['--disabled', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
			let spec = fzf#vim#with_preview(spec, 'right', 'ctrl-/')
			call fzf#vim#grep(initial_command, 1, spec, a:fullscreen)
		endfunction

		command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
	endif

	if g:disable
		" Mapping selecting mappings
		nmap <leader><tab> <plug>(fzf-maps-n)
		xmap <leader><tab> <plug>(fzf-maps-x)
		omap <leader><tab> <plug>(fzf-maps-o)

		" Insert mode completion
		imap <c-x><c-k> <plug>(fzf-complete-word)
		imap <c-x><c-f> <plug>(fzf-complete-path)
		imap <c-x><c-l> <plug>(fzf-complete-line)
	endif

	if g:disable
		" Path completion with custom source command
		inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd')
		inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')

		" Word completion with custom spec with popup layout option
		inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})

		" Replace the default dictionary completion with fzf-based fuzzy completion
		inoremap <expr> <c-x><c-k> fzf#vim#complete('cat /usr/share/dict/words')
	endif

	" For advanced uses, you can pass an options dictionary to the function. The set of options is pretty much identical to that for fzf#run only with the following exceptions:

	if g:disable
		" - reducer (funcref)
		"	+ Reducer transforms the output lines of fzf into a single string value
		" - prefix (string or funcref; default: \k*$)
		"	+ Regular expression pattern to extract the completion prefix
		"	+ Or a function to extract completion prefix
		" - Both source and options can be given as funcrefs that take the completion prefix as the argument and return the final value
		" - sink or sink* are ignored

		" Global line completion (not just open buffers. ripgrep required.)
		inoremap <expr> <c-x><c-l> fzf#vim#complete(fzf#wrap({
			\ 'prefix': '^.*$',
			\ 'source': 'rg -n ^ --color always',
			\ 'options': '--ansi --delimiter : --nth 3..',
			\ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))

		" Reducer example
		function! s:make_sentence(lines)
			return substitute(join(a:lines), '^.', '\=toupper(submatch(0))', '').'.'
		endfunction

		inoremap <expr> <c-x><c-s> fzf#vim#complete({
			\ 'source':  'cat /usr/share/dict/words',
			\ 'reducer': function('<sid>make_sentence'),
			\ 'options': '--multi --reverse --margin 15%,0',
			\ 'left': 20})
	endif

	if g:disable
		" Hide statusline
		augroup fzf_hide_statusline
			autocmd! FileType fzf set laststatus=0 noshowmode noruler
				\| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
		augroup end
	endif

	if g:disable
		" Custom statusline
		function! s:fzf_statusline()
			" Override statusline as you like
			highlight fzf1 ctermfg=161 ctermbg=251
			highlight fzf2 ctermfg=23 ctermbg=251
			highlight fzf3 ctermfg=237 ctermbg=251
			setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
		endfunction

		augroup fzf_custom_statusline
			autocmd! User FzfStatusLine call <SID>fzf_statusline()
		augroup end
	endif

	call DebugPrint('34.1-fzf.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
