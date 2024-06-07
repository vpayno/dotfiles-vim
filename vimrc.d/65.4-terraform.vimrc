"
" ~/.vim/vimrc.d/65.4-terraform.vimrc
"
" https://github.com/hashivim/vim-terraform

" apt install terraform

if _enable_terraform
    call DebugPrint('65.4-terraform.vimrc: start')

    function! ConfigureFileTypeTerraform()
        " Load plugins.
        packadd! vim-terraform

        " disable diagnostics etc.
        let g:hcl_align = g:enable
        let g:hcl_fold_sections = g:disable
        let g:terraform_align = g:enable
        let g:terraform_binary_path = 'terraform'
        let g:terraform_fmt_on_save = g:enable
        let g:terraform_fold_sections = g:disable
    endfunction

    augroup ag_terraform_setup
        autocmd!
        autocmd BufEnter,BufRead,FileType * if &filetype==#'terraform' | call ConfigureFileTypeTerraform() | endif
    augroup end

    augroup au_terraform_ft
        autocmd!
        autocmd BufNewFile,BufRead *.hcl,*.tf,*.tfvars,*.terraformrc,terraform.rc set filetype=terraform
        autocmd BufNewFile,BufRead *.tfstate,*.tfstate.backup set filetype=json
    augroup end

    call DebugPrint('65.4-terraform.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
