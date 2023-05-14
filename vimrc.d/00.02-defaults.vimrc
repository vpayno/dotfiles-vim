"
" vimrc.d/00.02-defaults.vimrc
"

call DebugPrint('00.02-defaults.vimrc: start')

" vint: -ProhibitEncodingOptionAfterScriptEncoding
set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8
" vint: +ProhibitEncodingOptionAfterScriptEncoding
"
syntax enable

" if ~/.vimrc exists, it's already set
" set nocompatible  " be iMproved, required

set shell=/bin/bash
set fileformats=unix,dos,mac
set fileformat=unix
set nobackup
"set noswapfile
set title
set showmode
set wildmenu
set history=1000
set showmatch

try
    if has('nvim')
        set undodir=~/.vim_runtime/undodir.nvim
    else
        set undodir=~/.vim_runtime/undodir.vim
    endif
    set undofile
catch
endtry

set smarttab
set expandtab
set linebreak
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent

" Enable incremental search.
set incsearch

" Disable case insensitive search and replace.
set noignorecase
set nosmartcase

" Fix up arrow not working in search.
"imap  OA <ESC>ki
"imap  OB <ESC>ji
"imap  OC <ESC>li
"imap  OD <ESC>hi

filetype off  " required
filetype plugin indent on  " required

" paste mode toggle
"set pastetoggle=\tp

"open the file at the last line edited
augroup au_last_pos
    autocmd!
    autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup end

" Show long lines
" Show < or > when characters are not displayed on the left or right.
" :set list listchars=precedes:<,extends:>
" Same, but also show tabs and trailing spaces.
":set list listchars=tab:>-,trail:.,precedes:<,extends:>
" Show invisible characters as dots
":set list
":set listchars=tab:··,trail:·

" memory leak problem
if v:version >= 702
    augroup au_fix_mem_leak
        autocmd!
        autocmd BufWinLeave * call clearmatches()
    augroup end
endif

" pyflakes
let g:khuno_ignore='E501'

" Reload vimrc immediately when edited
augroup au_reload_config
    autocmd!
    autocmd! bufwritepost vimrc source ~/.vimrc
    " Reloading ~/.vimrc when writing *.vimrc files caused problems with indent guides on the current buffer(s).
    autocmd! bufwritepost *.vimrc source %
augroup end

" Make underscores part of words.
"set iskeyword-=_

" When shifting always round to the correct indentation.
set shiftround

" Run lint on these file types.
"au FileType xml exe ':silent 1, $!xmllint --format --recover - 2> /dev/null'
"au FileType json exe ':silent 1, $!jq . - 2> /dev/null'

" disable folding
set nofoldenable
"set foldmethod=indent
"set foldlevel=99

" Use the same symbols as TextMate for tabstops and EOLs
" set listchars=tab:▸\ ,eol:¬

" Window stuff
"nnoremap <silent> + :exe 'resize ' . (winheight(0) * 3/2)<CR>
"nnoremap <silent> - :exe 'resize ' . (winheight(0) * 2/3)<CR>
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l
"set winheight=30
"set winminheight=5

" Setting leader key.
let mapleader = ','
"let maplocalldeader = '\\'

call DebugPrint('00.02-defaults.vimrc: stop')
" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
