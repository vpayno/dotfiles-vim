"
" ~/.vim/vimrc.d/99.81-editorconfig.vimrc
"
" https://github.com/editorconfig/editorconfig-vim

call DebugPrint('99.81-editorconfig.vimrc: start')

function ReloadEditorConfig()
    packadd! editorconfig-vim
endfunction

if _enable_editorconfig
    call ReloadEditorConfig()

    " Disable fugitive configs.
    " Disable loading editorconfig for remote files over ssh.
    let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

    let g:EditorConfig_verbose = v:false

    augroup au_disable_editorconfig
        autocmd!
        autocmd FileType gitcommit,gitrebase,netrw,qf let b:EditorConfig_disable = g:enable
    augroup end
endif

call DebugPrint('99.81-editorconfig.vimrc: end')

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
