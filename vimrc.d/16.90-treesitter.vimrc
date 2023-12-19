"
" ~/.vim/vimrc.d/16.90-treesitter.vimrc
"
" https://github.com/nvim-treesitter/nvim-treesitter
" https://github.com/nvim-treesitter/playground

" :TSInstall query

if _enable_treesitter && has('nvim')
    call DebugPrint('16.90-treesitter.vimrc: start')

    " Load plugins.
    packadd! nvim-treesitter
    packadd! nvim-ts-playground

    call DebugPrint('16.90-treesitter.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
