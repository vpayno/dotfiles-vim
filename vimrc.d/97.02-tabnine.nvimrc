"
" vimrc.d/97.02-tabnine.nvimrc
"

" https://github.com/codota/tabnine-nvim

" Also needs
" - YouCompleteMe
" - coc.nvim
" - completion-nvim
" - nvim-cmp
" - deoplete.nvim
" - ddc.vim
" - nvim-compe
" - vim-easycomplete

if _enable_ai && _enable_ai_tabnine && (_enable_coc || _enable_tabnine || _enable_youcompleteme || _enable_youcompleteme_tabnine)
    call DebugPrint('97.02-tabnine.vimrc: start')

    packadd! tabnine-nvim

    echom 'starting tabnine-nvim'

lua<<EOF
require('tabnine').setup({
  disable_auto_comment=true,
  accept_keymap="<Tab>",
  dismiss_keymap = "<C-]>",
  debounce_ms = 800,
  suggestion_color = {gui = "#808080", cterm = 244},
  exclude_filetypes = {"TelescopePrompt", "NvimTree"},
  log_file_path = nil, -- absolute path to Tabnine log file
})
EOF

    call DebugPrint('97.02-tabnine.nvimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
