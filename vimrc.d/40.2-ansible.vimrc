"
" ~/.vim/vimrc.d/40.2-ansible.vimrc
"
" https://github.com/pearofducks/ansible-vim
" https://github.com/chase/vim-ansible-yaml - archived
"

if _enable_ansible
    call DebugPrint('40.2-ansible.vimrc: start')

    augroup au_ansible_ft
        autocmd!
        autocmd BufRead,BufNewFile playbooks/*.yml set filetype=yaml.ansible
    augroup end

    function! ConfigureFileTypeAnsible()
        packadd! ansible-vim " ft=yaml.ansible | *.jinja2 | ansible_hosts
        " packadd! vim-ansible-yaml " ft=ansible

        let g:ansible_unindent_after_newline = g:enable

        if g:_enable_yaml
            " compatibility with vim-yaml
            let g:ansible_yamlKeyName = 'yamlKey'
        endif

        " a: highlight all instances of key=
        " o: highlight only instances of key= found on newlines
        " d: dim the instances of key= found
        " b: brighten the instances of key= found
        " n: turn this highlight off completely
        let g:ansible_attribute_highlight = 'ob'

        " highlights module name:
        let g:ansible_name_highlight = 'd'

        " enabled when set, disabled when not set
        " let g:ansible_extra_keywords_highlight = g:enable

        " Defaults to 'Structure'
        " let g:ansible_extra_keywords_highlight_group = 'Statement'

        " Defaults to 'Statement'
        " let g:ansible_normal_keywords_highlight = 'Constant'

        " 'regex-for-file': 'filetype'.
        let g:ansible_template_syntaxes = {
            \ '*.rb.j2': 'ruby',
            \ }

        let g:ansible_ftdetect_filename_regex = '\v(playbook|site|main|local|requirements)\.ya?ml$'
    endfunction

    augroup ag_ansible_setup
        autocmd!
        autocmd BufEnter,BufRead,FileType * if &filetype==#'yaml.ansible' | call ConfigureFileTypeAnsible() | endif
    augroup end

    call DebugPrint('40.2-ansible.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
