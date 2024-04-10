"
" vimrc.d/99.80-whitespace.vimrc
"
" https://stackoverflow.com/questions/5144284/force-vi-vim-to-use-leading-tabs-only-on-retab

scriptencoding utf-8

call DebugPrint('99.80-whitespace.vimrc: start')

" Retab spaced file, but only indentation
command! RetabIndents call RetabIndents()

" Retab spaced file, but only indentation
func! RetabIndents()
    let saved_view = winsaveview()
    execute '%s@^\( \{'.&tabstop.'}\)\+@\=repeat("\t", len(submatch(0))/'.&tabstop.')@'
    call winrestview(saved_view)
endfunc

function! FileTypeUsesTabs()
    let l:result = v:false
    let l:fts= ['ebuild', 'gentoo-init-d', 'gentoo-conf-d', 'gentoo-env-d', 'bash', 'go', 'make', 'nginx', 'sh', 'tsv']

    if index(l:fts, &filetype) >= 0
        let l:result = v:true
    endif

    " echom 'File type ' . &filetype . ' uses tabs: ' . l:result

    return l:result
endfunction

function! FileTypeUsesSpaces()
    let l:result = v:true

    if FileTypeUsesTabs()
        let l:result = v:false
    endif

    " echom 'File type ' . &filetype . ' uses spaces: ' . l:result

    return l:result
endfunction

function! SetOptionsForTabs()
    set copyindent
    set noexpandtab
    set preserveindent
    set shiftwidth=4
    set softtabstop=0
    set tabstop=4

    if !empty(glob(expand('%'))) && ! &readonly
        " this keeps chaning spaces to tabs in strings
        " :%retab! | :w
        " RetabIndents
    endif
endfunction

function! SetOptionsForSpaces()
    set copyindent
    set expandtab
    set preserveindent
    set softtabstop=0

    if
        \ &filetype ==# 'gleam' ||
        \ &filetype ==# 'html' ||
        \ &filetype ==# 'lisp' ||
        \ &filetype ==# 'r' ||
        \ &filetype ==# 'ruby' ||
        \ &filetype ==# 'wast' ||
        \ &filetype ==# 'xhtml' ||
        \ &filetype ==# 'xml' ||
        \ &filetype ==# 'yaml' ||
        \ &filetype ==# 'yaml.jinja'
        set shiftwidth=2
        set tabstop=2
    elseif
        \ &filetype ==# 'lua' ||
        \ &filetype ==# 'java' ||
        \ &filetype ==# 'json' ||
        \ &filetype ==# 'json.jinja'
        set shiftwidth=4
        set tabstop=4
    else
        set shiftwidth=4
        set tabstop=4
    endif

    if !empty(glob(expand('%'))) && ! &readonly
        " :%retab! | :w
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

function! SetFileTypeOptions()
    let l:special_types = ['', 'gitcommit', 'gitrebase', 'netrw', 'qf']

    if index(l:special_types, &filetype) >=0
        return
    endif

    call SetOptionsForWhiteSpace()

    if g:_enable_editorconfig
        call ReloadEditorConfig()
    endif

    call ReloadModeLine()
endfunction

" this is the first definition, clear all the autocommands in the group
augroup au_multipart_file_settings
    autocmd!
    autocmd BufNewFile,BufReadPost,BufFilePost,VimEnter,BufNew,BufEnter,FileType * call SetFileTypeOptions()
    " autocmd BufNewFile,BufFilePost,VimEnter,BufNew,BufEnter,FileType * call SetFileTypeOptions()
    " autocmd BufEnter,FileType * call SetFileTypeOptions()
augroup end

" Using before the first colorscheme command will ensure that the highlight group gets created and is not cleared by future colorscheme commands
augroup au_colorscheme
    autocmd!
    autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
augroup end

" The following alternative may be less obtrusive.
":highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen

" Try the following if your GUI uses a dark background.
":highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen

" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
:highlight ExtraWhitespace ctermbg=red guibg=red

" Automatically remove trailing whitespace (https://vim.fandom.com/wiki/Remove_unwanted_spaces)
augroup au_traling_ws
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
augroup end

" The following alternative may be less obtrusive.
":highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen

" Try the following if your GUI uses a dark background.
":highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
" Show trailing whitespace:
:match ExtraWhitespace /\s\+$/

" Show trailing whitespace and spaces before a tab:
:match ExtraWhitespace /\s\+$\| \+\ze\t/

" Show tabs that are not at the start of a line:
:match ExtraWhitespace /[^\t]\zs\t\+/

" Show spaces used for indenting (so you use only tabs for indenting).
":match ExtraWhitespace /^\t*\zs \+/

" Switch off :match highlighting.
":match

" The following pattern will match trailing whitespace, except when typing at the end of a line.
:match ExtraWhitespace /\s\+\%#\@<!$/

" If you use this alternate pattern, you may want to consider using the following autocmd to let the highlighting show up as soon as you leave insert mode after entering trailing whitespace:
":autocmd InsertLeave * redraw!
augroup au_whitespace_match
    autocmd!
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
augroup eng

" For C, if you don't want to see trailing space errors at end-of-line set:
"let c_no_trail_space_error = 1

" If you only use spaces to indent, and don't want to see space errors in front of tabs:
"let c_no_tab_space_error = 1

call DebugPrint('99.80-whitespace.vimrc: end')

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
