"
" vimrc.d/00.07-theme.vimrc
"

call DebugPrint('00.07-theme.vimrc: start')

" vint: -ProhibitEncodingOptionAfterScriptEncoding
set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8
" vint: +ProhibitEncodingOptionAfterScriptEncoding

"colorscheme onedark

" use visual bell instead of beeping
set visualbell

" highlight line number instead of the whole line
" https://stackoverflow.com/questions/8247243/highlighting-the-current-line-number-in-vim
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
set cursorline
set cursorcolumn

set ruler

" enable line numbering
set number

" https://jeffkreeftmeijer.com/vim-number/
if _enable_smart_gutter_numbers
    augroup numbertoggle
        autocmd!
        autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &number && mode() != "i" | set relativenumber   | endif
        autocmd BufLeave,FocusLost,InsertEnter,WinLeave * if &number | set norelativenumber | endif
    augroup END
endif

" highlight search matches
set hlsearch

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

" show line lengths at 80, 120, 160 and 240 chars
set colorcolumn=80,120,160,240
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

set background=dark

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
augroup au_whitespace
    autocmd!
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
augroup eng

" For C, if you don't want to see trailing space errors at end-of-line set:
"let c_no_trail_space_error = 1

" If you only use spaces to indent, and don't want to see space errors in front of tabs:
"let c_no_tab_space_error = 1

" Change the Pmenu colors so they're more readable.
" normal item
highlight Pmenu ctermbg=cyan ctermfg=white
" selected item
highlight PmenuSel ctermbg=gray ctermfg=white
" scrollbar
highlight PmenuSbar ctermbg=lightmagenta ctermfg=white
" thumb of the scrollbar
highlight PmenuThumb ctermbg=magenta ctermfg=white

" shows command keys in lower right corner of the screen
set showcmd

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

" Set max line length.
"let linelen = 120
"execute 'set colorcolumn='.linelen
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"execute 'match OverLength /\%'.linelen.'v.\+/'

let fts = ['sh', 'bash', 'vim']
if index(fts, &filetype) == -1
    set noexpandtab
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

call DebugPrint('00.07-theme.vimrc: stop')

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
