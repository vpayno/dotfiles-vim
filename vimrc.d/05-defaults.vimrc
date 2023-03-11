"
" ~/.vim/vimrc.d/05-defaults.vimrc
"

syntax on
"colorscheme onedark

set nocompatible			  " be iMproved, required

set ruler

set background=dark

set shell=/bin/bash
" vint: -ProhibitEncodingOptionAfterScriptEncoding
set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8
" vint: +ProhibitEncodingOptionAfterScriptEncoding
set ffs=unix,dos,mac
set fileformat=unix
set nobackup
"set noswapfile
set title
set showmode
set wildmenu
set history=1000
set showmatch

" use visual bell instead of beeping
set vb

" highlight line number instead of the whole line
" https://stackoverflow.com/questions/8247243/highlighting-the-current-line-number-in-vim
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
set cursorline
set cursorcolumn

"
highlight clear CursorLine
augroup CLClear
	autocmd! ColorScheme * highlight clear CursorLine
augroup END
highlight CursorLine cterm=NONE ctermbg=234 ctermfg=NONE guibg=NONE guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=236 ctermfg=NONE guibg=NONE guifg=NONE

highlight CursorLineNR cterm=bold ctermbg=darkgreen
augroup CLNRSet
	autocmd! ColorScheme * highlight CursorLineNR cterm=bold
augroup END

" https://vim.fandom.com/wiki/Highlight_current_line

" To highlight the current line, and have the highlighting stay where it is
" when the cursor is moved.
" With the default backslash leader key, pressing \l will highlight the line
" that currently contains the cursor. The mapping also sets mark l so you can
" type 'l to return to the highlighted line. Enter :match to clear the
" highlighting when finished.
:nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>

" To highlight the current virtual column (column after tabs are expanded),
" and have the highlighting stay where it is when the cursor is moved.
:nnoremap <silent> <Leader>c :execute 'match Search /\%'.virtcol('.').'v/'<CR>

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

" highlight search matches
set hlsearch

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

filetype off				  " required
filetype plugin indent on	  " required

" enable line numbering
set number

" paste mode toggle
"set pastetoggle=\tp

" show line lengths at 80 and 120 chars
set colorcolumn=80,120
hi ColorColumn ctermbg=darkgray guibg=darkgray
set textwidth=0

" enable 256 colors
set t_Co=256

" http://stackoverflow.com/questions/16987362/how-to-get-vim-to-highlight-non-ascii-characters
"syntax match nonascii "[^\x00-\x7F]"
"highlight nonascii guibg=Red ctermbg=2 term=underline

"syntax match NonASCII "[^\x00-\x7F]"
"highlight NonASCII guibg=Red ctermbg=DarkRed

"syntax match WeirdStuff "[ -]"
"highlight WeirdStuff guibg=Red ctermbg=DarkRed
"match WeirdStuff / -/
":autocmd ColorScheme * highlight NonASCII ctermbg=Red guibg=Red

"highlight nonascii guibg=Red ctermbg=DarkRed term=standout
"au BufNewFile,BufReadPost,InsertEnter,InsertLeave * syntax match NonASCII "[^\u0000-\u007F]"

"open the file at the last line edited
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
						 \ exe "normal! g`\"" | endif

" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
:highlight ExtraWhitespace ctermbg=red guibg=red

" Automatically remove trailing whitespace (https://vim.fandom.com/wiki/Remove_unwanted_spaces)
:autocmd BufWritePre * %s/\s\+$//e

" The following alternative may be less obtrusive.
":highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen

" Try the following if your GUI uses a dark background.
":highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen

" Using before the first colorscheme command will ensure that the highlight group gets created and is not cleared by future colorscheme commands
:autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

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
:au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
:au InsertLeave * match ExtraWhitespace /\s\+$/

" For C, if you don't want to see trailing space errors at end-of-line set:
"let c_no_trail_space_error = 1

" If you only use spaces to indent, and don't want to see space errors in front of tabs:
"let c_no_tab_space_error = 1

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
	autocmd BufWinLeave * call clearmatches()
endif

" Change the Pmenu colors so they're more readable.
" normal item
highlight Pmenu ctermbg=cyan ctermfg=white
" selected item
highlight PmenuSel ctermbg=gray ctermfg=white
" scrollbar
highlight PmenuSbar ctermbg=lightmagenta ctermfg=white
" thumb of the scrollbar
highlight PmenuThumb ctermbg=magenta ctermfg=white

" pyflakes
let g:khuno_ignore='E501'

" Reload .vimrc immediately when edited
autocmd! bufwritepost vimrc source ~/.vimrc

" Set max line length.
"let linelen = 120
"execute 'set colorcolumn='.linelen
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"execute 'match OverLength /\%'.linelen.'v.\+/'

" Tell VIM which tags file to use.
set tags=~/.vimrc/tags

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
set listchars=tab:▸\ ,eol:¬

" Window stuff
"nnoremap <silent> + :exe 'resize ' . (winheight(0) * 3/2)<CR>
"nnoremap <silent> - :exe 'resize ' . (winheight(0) * 2/3)<CR>
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l
"set winheight=30
"set winminheight=5

"if (&ft=='sh' || &ft=='bash')
	"set noexpandtab
	"set ai
	"set ts=4
	"set sw=4
	"set list
"endif

let fts = ['sh', 'bash', 'vim']
if index(fts, &filetype) == -1
	set noexpandtab
endif

if has('nvim')
	set background=dark
endif

if v:version > 703 || v:version == 703 && has('patch541')
	set formatoptions+=j " Delete comment character when joining commented lines
endif

if _enable_line_wrap
	set wrap
	set breakindent
	set breakindentopt=sbr
	" I use a unicode curly array with a <backslash><space>
	set showbreak=↪>\
	"set formatoptions+=w " Wrap lines without breaking words
else
	set nowrap
	set sidescroll=1
	set sidescrolloff=5
	set listchars=extends:>,precedes:<
endif

" Setting leader key.
let mapleader = '\\'
"let maplocalldeader = '\\'

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
