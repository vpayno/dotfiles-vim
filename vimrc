"
" ~/.vim/vimrc
"

if $IN_NIX_FLAKE
    set nocompatible
endif

echom 'VIM set to [' . $VIM . ']'
echom 'MYVIMDIR set to [' . $MYVIMDIR . ']'
echom 'MYVIMRC set to [' . $MYVIMRC . ']'
echom 'VIMRUNTIME set to [' . $VIMRUNTIME . ']'

if $MYVIMDIR == '' || $MYVIMDIR == v:null || $MYVIMDIR is v:null
    let g:MYVIMDIR = $HOME . '/.vim'
else
    let g:MYVIMDIR = $MYVIMDIR
endif

if $MYVIMRC == v:null || $MYVIMRC is v:null
    let g:MYVIMRC = $HOME . '/.vim/vimrc'
else
    let g:MYVIMRC = $MYVIMRC
endif

let &runtimepath = $VIMRUNTIME . ',' . $MYVIMDIR
set packpath+=$VIMRUNTIME
set packpath+=$MYVIMDIR

" Load helper functions and global variables.
runtime! vimrc.d/00.00-helpers.vimrc

call DebugPrint('VIM set to [' . $VIM . ']')
call DebugPrint('MYVIMDIR set to [' . g:MYVIMDIR . ']')
call DebugPrint('MYVIMRC set to [' . g:MYVIMRC . ']')
call DebugPrint('runtimepath set to [' . &runtimepath . ']')

call DebugPrint('vimrc: start [loading ' . $MYVIMRC . ']')

" vint: -ProhibitEncodingOptionAfterScriptEncoding
set encoding=utf-8
scriptencoding utf-8
" vint: +ProhibitEncodingOptionAfterScriptEncoding

if g:debug_mode
    call DebugPrint('You can use `:messages` to show statusline messages.')
    call DebugPrint('You can use `:scriptnames` to show loaded plugins.')
    call DebugPrint('You can use `:function` to list all functions.')
    call DebugPrint("You can use `:verb set var_name?` to show that variable's set history.")
endif

" VIM & NEOVIM: Load the extra configs.
runtime! vimrc.d/*.vimrc

" NEOVIM: Load the extra configs.
if has('nvim')
    runtime! vimrc.d/*.nvimrc
endif

command! Scratch lua require'tools'.makeScratch()

if !has('nvim') && !$IN_NIX_FLAKE
    "set pythonthreedll=/home/vpayno/.pyenv/versions/3.9.18/lib/libpython3.9.a
    "set pythonthreedll=/home/vpayno/.pyenv/versions/3.10.13/lib/libpython3.so
    set pythonthreedll=/home/vpayno/.pyenv/versions/3.11.5/lib/libpython3.so
endif

call DebugPrint('vimrc: end')

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
