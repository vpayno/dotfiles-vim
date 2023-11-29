"
" ~/.vim/vimrc.d/43.0-bash.vimrc
"

" https://github.com/josa42/coc-sh
" :CocInstall coc-sh

if _enable_sh
    call DebugPrint('43.0-bash.vimrc: start')

    function! ConfigureFileTypeSh()
        " pack/upstream/opt/vim-shfmt
        packadd! vim-shfmt

        let g:shfmt_fmt_on_save = g:enable
        let g:shfmt_extra_args = ''

        call extend(g:vimspector_install_gadgets, [ 'vscode-bash-debug' ])

        if g:_enable_ale && g:_enable_ale_sh
            " https://github.com/dense-analysis/ale/blob/master/doc/ale-sh.txt
            " let g:ale_sh_bashate_options = ''
            " let g:ale_sh_shellcheck_options = ''
            " let g:ale_sh_shfmt_options = '--case-indent --space-redirects -keep-padding'
            let g:ale_sh_shfmt_options = '--case-indent --keep-padding'

            if g:_enable_ale_sh_fixers
                let g:ale_fixers.sh = ['shfmt']
            else
                let g:ale_fixers.sh = []
            endif

            if g:_enable_ale_sh_linters
                let g:ale_linters.sh = ['shellcheck']
            else
                let g:ale_linters.sh = []
            endif

            let g:ale_linters_ignore.sh = []
        else
            augroup ag_sh_shfmt
                autocmd!
                autocmd BufWritePost * if &filetype==#'sh' | Shfmt | endif
            augroup end

            " augroup au_shell_retab
            "    autocmd!
            "    autocmd BufReadPost * if &filetype==#'sh' | set noet | :%retab! | :w | endif
            " augroup end
        endif
    endfunction

    augroup ag_sh_setup
        autocmd!
        autocmd BufEnter,BufRead,FileType * if &filetype==#'sh' | call ConfigureFileTypeSh() | endif
    augroup end

    call DebugPrint('43.0-bash.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
