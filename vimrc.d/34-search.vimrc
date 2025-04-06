"
" vimrc.d/34-search.vimrc
"
" https://github.com/mileszs/ack.vim
" https://github.com/jremmen/vim-ripgrep

" Tell VIM to use ack instead of grep.
" set grepprg=ack

if _enable_ack
    call DebugPrint('34-search.vimrc: start [ack]')

    " Load plugin.
    packadd! ack.vim

    let g:ackprog='ack -H --nocolor --nogroup --column'

    " Open a new tab and search for something.
    nmap <leader>a :tab split<CR>:Ack ""<Left>

    " Immediately search for the word under the cursor in a new tab.
    nmap <leader>A :tab split<CR>:Ack <C-r><C-w><CR>

    call DebugPrint('34-search.vimrc: end [ack]')
endif

if _enable_ripgrep
    call DebugPrint('34-search.vimrc: start [ripgrep]')

    " Load plugin.
    packadd! vim-ripgrep

    call DebugPrint('34-search.vimrc: end [ripgrep]')
endif

if _enable_command_t && has('nvim')
    call DebugPrint('34-search.vimrc: start [command-t]')

    packadd! command-t

    let g:CommandTPreferredImplementation = 'lua'

    call DebugPrint('34-search.vimrc: end [command-t]')
endif

" enable extended regex search
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

" let &wildignore = ''
" let &grepformat = '%f:%l:%m,%f:%l%m,%f  %l%m'
" let &grepprg = 'grep -n -R $* 2> /dev/null'

" let &wildignore = '*.o,*.obj,*~,*.pyc,.git/**,ctags,tags,cscope*'
" let &grepprg = g:MYVIMDIR . '/scripts/grep' -n --exclude=' . shellescape(&wildignore) . ' $*'

" let &grepprg = g:MYVIMDIR . '/scripts/grep' -n $*'
" command -nargs=+ Ggr execute 'silent Ggrep!' <q-args> | copen "| redraw!
" nnoremap <leader>s :grep! <cword><CR><CR>

" git grep w/o fugitive
" set grepprg = 'git --no-pager grep --no-color -n $*'
" set grepformat = '%f:%l:%m,%m %f match%ts,%f'

" ack
" set grepprg = 'ack -s -H --nopager --nocolor --nogroup --column'
" set grepformat = '%f:%l:%c:%m,%f:%l:%m'

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
