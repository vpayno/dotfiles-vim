"
" vimrc.d/12-ide.vimrc
"

" https://vim.fandom.com/wiki/Display_output_of_shell_commands_in_new_window

command! -complete=shellcmd -nargs=+ Shell2 call s:RunShellCommand2(<q-args>)

function! s:RunShellCommand2(cmdline)
	echo a:cmdline

	let expanded_cmdline = a:cmdline

	for part in split(a:cmdline, ' ')
		if part[0] =~ '\v[%#<]'
		let expanded_part = fnameescape(expand(part))
		let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
		endif
	endfor

	botright new

	setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap

	call setline(1, 'You entered:	 ' . a:cmdline)
	call setline(2, 'Expanded Form:  ' .expanded_cmdline)
	call setline(3,substitute(getline(2),'.','=','g'))

	execute '$read !'. expanded_cmdline

	setlocal nomodifiable

	1
endfunction

command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)

function! s:RunShellCommand(cmdline)
	let isfirst = 1
	let words = []

	for word in split(a:cmdline)

		if isfirst
			let isfirst = 0  " don't change first word (shell command)
		else
			if word[0] =~ '\v[%#<]'
				let word = expand(word)
			endif

			let word = shellescape(word, 1)
		endif

		call add(words, word)
	endfor

	let expanded_cmdline = join(words)

	botright new

	setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap

	call setline(1, 'You entered:  ' . a:cmdline)
	call setline(2, 'Expanded to:  ' . expanded_cmdline)
	call append(line('$'), substitute(getline(2), '.', '=', 'g'))

	silent execute '$read !'. expanded_cmdline

	1
endfunction

" command! -complete=file -nargs=* Git call s:RunShellCommand('git '.<q-args>)
" command! -complete=file -nargs=* Svn call s:RunShellCommand('svn '.<q-args>)
" command! -complete=file -nargs=* Bzr call s:RunShellCommand('bzr '.<q-args>)
" command! -complete=file -nargs=* Hg  call s:RunShellCommand('hg '.<q-args>)

" command! -complete=file -nargs=* Cargo call s:RunShellCommand('cargo '.<q-args>)

command! -complete=file -nargs=* C set splitbelow | new | r! cargo <q-args>
" command! -complete=file -nargs=* Sr set splitright | vnew | r! <q-args>
" command! -complete=file -nargs=* Sb set splitbelow | new | r! <q-args>

" http://vimdoc.sourceforge.net/htmldoc/pattern.html
augroup ag_leaders
	autocmd!
	autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
	autocmd FileType sh,ruby,python   let b:comment_leader = '# '
	autocmd FileType conf,fstab		  let b:comment_leader = '# '
	autocmd FileType tex			  let b:comment_leader = '% '
	autocmd FileType mail			  let b:comment_leader = '> '
	autocmd FileType vim			  let b:comment_leader = '" '
augroup end

function! CommentToggle()
	execute ':silent! s/\([^ ]\)/' . escape(b:comment_leader,'\/') . ' \1/'
	execute ':silent! s/^\( *\)' . escape(b:comment_leader,'\/') . ' \?' . escape(b:comment_leader,'\/') . ' \?/\1/'
endfunction
" map <F7> :call CommentToggle()<CR>

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
