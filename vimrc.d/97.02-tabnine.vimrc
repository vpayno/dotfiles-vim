"
" vimrc.d/97.02-tabnine.vimrc
"

" https://github.com/codota/tabnine-vim

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

    packadd! tabnine-vim

    call DebugPrint('97.02-tabnine.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
