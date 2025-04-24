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
set linebreak
set autoindent
set smartindent

" overridden by vimrc.d/99.80-whitespace.vimrc
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Enable incremental search.
set incsearch

" Disable case insensitive search and replace.
set noignorecase
set nosmartcase

if _enable_keys_mine
    " new old - shift "arrow" keys to the right by one
    " right
    noremap ; l
    " up
    noremap l k
    " down
    noremap k j
    " left
    noremap j h
elseif _enable_keys_dvorak
    " https://gist.github.com/Prodge/a6347a4ca986058a7b3fbe20bfd9c578
    "
    " Add this to your vimrc
    "
    "   New mappings:    c
    "                  h t n
    "
    " This also integrates this mapping into insert mode via <Alt>

    " Navigation for dvorak
    nnoremap c k
    nnoremap t j
    nnoremap n l

    vnoremap c k
    vnoremap t j
    vnoremap n l

    " Add a new mapping for 'n' as we just replaced it
    nnoremap g n

    " Provide chtn / hjkl movements in Insert mode via the <Alt> modifier key
    inoremap <A-h> <C-o>h
    inoremap <A-t> <C-o>j
    inoremap <A-c> <C-o>k
    inoremap <A-n> <C-o>l

    " Shift navigation jumping movements for chtn
    nnoremap H <C-Left>
    nnoremap N <C-Right>
    inoremap <A-H> <C-Left>
    inoremap <A-N> <C-Right>
endif

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

" Use the same symbols as TextMate for tabstops and EOLs
" set listchars=tab:▸\ ,eol:¬

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
    autocmd! bufwritepost vimrc source g:MYVIMDIR . '/.vimrc'
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
