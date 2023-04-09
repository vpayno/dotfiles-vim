"
" vimrc.d/99.80-whitespace.vimrc
"

scriptencoding utf-8

call DebugPrint('99.80-whitespace.vimrc: start')

function! FileTypeUsesTabs()
	let l:result = v:false
	if
		\ &filetype ==# 'ebuild' ||
		\ &filetype ==# 'makefile' ||
		\ &filetype ==# 'sh' ||
		\ &filetype ==# 'tsv' ||
		\ &filetype ==# 'vim'
		let l:result = v:true
	endif

	return l:result
endfunction

function! FileTypeUsesSpaces()
	if FileTypeUsesTabs()
		return v:false
	else
		return v:true
	endif
endfunction

function! SetOptionsForTabs()
	set copyindent
	set noexpandtab
	set preserveindent
	set shiftwidth=4
	set softtabstop=0
	set tabstop=4

	:%retab!
endfunction

function! SetOptionsForSpaces()
	set copyindent
	set expandtab
	set preserveindent
	set shiftwidth=4
	set softtabstop=0
	set tabstop=4

	:%retab!
endfunction

function! SetOptionsForWhiteSpace()
	if &filetype==#'qf'
		return
	endif

	if FileTypeUsesTabs()
		" echom 'SetOptionsForWhiteSpace() -> SetOptionsForTabs()'
		call SetOptionsForTabs()
	 else
		" echom 'SetOptionsForWhiteSpace() -> SetOptionsForSpaces()'
		call SetOptionsForSpaces()
	endif
endfunction

augroup au_whitespace
	autocmd!
	autocmd BufEnter * call SetOptionsForWhiteSpace()
augroup end

call DebugPrint('99.80-whitespace.vimrc: end')

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
