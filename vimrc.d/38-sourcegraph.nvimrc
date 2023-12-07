"
" ~/.vim/vimrc.d/38-sourcegraph.nvimrc
"
" https://github.com/sourcegraph/sg.nvim

if _enable_sourcegraph
    call DebugPrint('38-sourcegraph.nvimrc: start')

    packadd! sg.nvim

    " Example mapping for doing searches from within neovim (may change) using telescope.
    " (requires telescope.nvim to be installed)
    nnoremap <space>ss <cmd>lua require('sg.extensions.telescope').fuzzy_search_results()<CR>

    call DebugPrint('38-sourcegraph.nvimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
