"
" ~/.vim/vimrc.d/40.1-yaml.vimrc
"
" https://www.arthurkoziel.com/setting-up-vim-for-yaml/
" https://github.com/stephpy/vim-yaml
"

if _enable_yaml
    call DebugPrint('40.1-yaml.vimrc: start')

    function! ConfigureFileTypeYaml()
        packadd! vim-yaml

        let g:yaml_limit_spell = g:disable

        if g:_enable_ale && g:_enable_ale_yaml
            let g:ale_yaml_yamllint_options = '--config-file ' . g:MYVIMDIR . '/.vim/configs/yamllint-custom.yaml'
            let g:ale_yaml_yamlfix_options = '--config-file ' . g:MYVIMDIR . '/.vim/configs/yamlfix-custom.toml'

            let g:ale_fixers.yaml = ['yamlfix']
            let g:ale_linters.yaml = ['yamllint']
            let g:ale_linters_ignore.yaml = []
        endif
    endfunction

    augroup au_yaml_ft_set
        autocmd!
        autocmd BufNewFile,BufRead *.yaml,*.yml set filetype=yaml
    augroup end

    augroup ag_yaml_setup
        autocmd!
        autocmd BufEnter,BufRead,FileType * if &filetype==#'yaml' | call ConfigureFileTypeYaml() | endif
    augroup end

    call DebugPrint('40.1-yaml.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
