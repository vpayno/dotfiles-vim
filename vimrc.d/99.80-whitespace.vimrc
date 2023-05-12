"
" vimrc.d/99.80-whitespace.vimrc
"

scriptencoding utf-8

call DebugPrint('99.80-whitespace.vimrc: start')

function! FileTypeUsesTabs()
    let l:result = v:false
    if
        \ &filetype ==# 'ebuild' ||
        \ &filetype ==# 'go' ||
        \ &filetype ==# 'make' ||
        \ &filetype ==# 'nginx' ||
        \ &filetype ==# 'sh' ||
        \ &filetype ==# 'tsv'
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

    if !empty(glob(expand('%'))) && ! &readonly
        :%retab! | :w
    endif
endfunction

function! SetOptionsForSpaces()
    set copyindent
    set expandtab
    set preserveindent
    set softtabstop=0

    if
        \ &filetype ==# 'html' ||
        \ &filetype ==# 'xhtml' ||
        \ &filetype ==# 'xml'
        set shiftwidth=2
        set tabstop=2
    elseif
        \ &filetype ==# 'json' ||
        \ &filetype ==# 'yaml'
        set shiftwidth=4
        set tabstop=4
    else
        set shiftwidth=4
        set tabstop=4
    endif

    if !empty(glob(expand('%'))) && ! &readonly
        :%retab! | :w
    endif
endfunction

function! SetOptionsForWhiteSpace()
    if IsSpecialFile()
        return v:true
    endif

    if FileTypeUsesTabs()
        " echom 'SetOptionsForWhiteSpace() -> SetOptionsForTabs()'
        call SetOptionsForTabs()
    else
        " echom 'SetOptionsForWhiteSpace() -> SetOptionsForSpaces()'
        call SetOptionsForSpaces()
    endif

    " commands that show you the last changer of these options
    " verb set expandtab?
    " verb set et?
    " verb set invexpandtab?
endfunction

augroup au_whitespace
    autocmd!
    autocmd BufEnter,FileType * call SetOptionsForWhiteSpace()
augroup end

call DebugPrint('99.80-whitespace.vimrc: end')

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
