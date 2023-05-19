"
" ~/.vim/vimrc.d/07-editorconfig.vimrc
"
" https://github.com/editorconfig/editorconfig-vim

" Disable fugitive configs.
" Disable loading editorconfig for remote files over ssh.
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

augroup au_disable_editorconfig
    autocmd!
    autocmd FileType gitcommit,gitrebase,netrw,qf let b:EditorConfig_disable = 1
augroup end

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
