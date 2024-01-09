"
" vimrc.d/56.0-cue.vimrc
"
" https://github.com/davidhalter/jedi
" https://github.com/davidhalter/jedi-vim
" https://github.com/python-mode/python-mode
" https://github.com/tell-k/vim-autopep8

if _enable_cue
    call DebugPrint('56.0-cue.vimrc: start')

    packadd! vim-cue

    command! -buffer CueFmt let winsaved = winsaveview() | execute 'silent %! cue fmt -' | if v:shell_error > 0 | silent undo | else | silent :w | endif | call winrestview(winsaved)

    function! ConfigureFileTypeCue()

        if g:_enable_cue_fmt
            set autoread
            augroup ag_cue_fmt
                autocmd!
                autocmd BufWritePost *.cue CueFmt
            augroup end
        endif

    endfunction

    " <range>gq
    " set formatprg=cue\ fmt\ -

    augroup au_cue_ft
        autocmd!
        autocmd BufNewFile,BufRead *.cue set filetype=cue
    augroup end

    augroup ag_cue_setup
        autocmd!
        autocmd BufEnter,BufRead,FileType * if &filetype==#'cue' | call ConfigureFileTypeCue() | endif
    augroup end

    call DebugPrint('56.0-cue.vimrc: end')

endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
