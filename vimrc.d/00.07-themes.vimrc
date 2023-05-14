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
        autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &number && mode() != "i" | set relativenumber | endif
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

    " https://vim.fandom.com/wiki/Automatically_wrap_left_and_right
    " This causes the left and right arrow keys, as well as h and l, to wrap
    " when used at beginning or end of lines. ( < > are the cursor keys used
    " in normal and visual mode, and [ ] are the cursor keys in insert mode).
    set whichwrap=<,>,[,],h,l
else
    set nowrap
    set sidescroll=1
    set sidescrolloff=5
    set listchars=extends:>,precedes:<
    set whichwrap=b,s
endif

call DebugPrint('00.07-theme.vimrc: stop')

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
