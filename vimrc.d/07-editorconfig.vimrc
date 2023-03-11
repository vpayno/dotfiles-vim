"
" ~/.vim/vimrc.d/07-editorconfig.vimrc
"
" https://github.com/editorconfig/editorconfig-vim

" Disable fugitive configs.
" Disable loading editorconfig for remote files over ssh.
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
