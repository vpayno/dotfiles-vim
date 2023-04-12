"
" vimrc.d/99-other-xterm-color-table.vimrc
"

" https://vim.fandom.com/wiki/Xterm256_color_names_for_console_Vim
" https://github.com/guns/xterm-color-table.vim

call DebugPrint('vimrc.d/99-other-xterm-color-table.vimrc: start')

packadd! xterm-color-table.vim

" Run command XtermColorTable to use it.

call DebugPrint('vimrc.d/99-other-xterm-color-table.vimrc: end')

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
