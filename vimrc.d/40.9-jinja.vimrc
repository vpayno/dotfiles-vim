"
" ~/.vim/vimrc.d/40.9-jinja.vimrc
"

if _enable_jinja
    call DebugPrint('40.9-jinja.vimrc: start')

    packadd! vim-jinja

    augroup au_jinja
        autocmd!
        autocmd BufNewFile,BufRead *.jinja,*.j2 set filetype=jinja
        autocmd BufNewFile,BufRead *.yaml.jinja,*.yaml.j2,*.yml.jinja,*.yml.j2 set filetype=yaml.jinja
        autocmd BufNewFile,BufRead *.json.jinja,*.json.j2 set filetype=json.jinja
    augroup end

    call DebugPrint('40.9-jinja.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
