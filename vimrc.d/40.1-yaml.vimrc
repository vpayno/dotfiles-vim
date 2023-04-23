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

    "augroup au_yaml
        "autocmd!
        "autocmd BufNewFile,BufRead *.yaml,*.yml set filetype=yaml
    "augroup end

    if _enable_ale
        let g:ale_yaml_yamllint_options = '--config-file ~/.vim/configs/yamllint-custom.yaml'
        let g:ale_yaml_yamlfix_options = '--config-file ~/.vim/configs/yamlfix-custom.toml'

        let g:ale_fixers.yaml = ['yamlfix']
        let g:ale_linters.yaml = ['yamllint']
        let g:ale_linters_ignore.yaml = []
    endif

    call DebugPrint('40.1-yaml.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
