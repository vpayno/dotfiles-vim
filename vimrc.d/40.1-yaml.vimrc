"
" ~/.vim/vimrc.d/40.1-yaml.vimrc
"
" https://www.arthurkoziel.com/setting-up-vim-for-yaml/
" https://github.com/stephpy/vim-yaml
"

if &filetype==#'yaml'
    call DebugPrint('40.1-yaml.vimrc: start')

    if _enable_yaml
        packadd! vim-yaml

        let g:yaml_limit_spell = g:disable
    endif

    call DebugPrint('40.1-yaml.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
