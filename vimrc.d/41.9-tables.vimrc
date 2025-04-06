"
" vimrc.d/41.9-tables.vimrc
"

scriptencoding utf-8

call DebugPrint('41.9-tables.vimrc: start')

" Retable file
command! RetabTable call RetabTable()

" Retable file
func! RetabTable()
    let saved_view = winsaveview()
    " execute '%!column -t'
    execute '%!' . g:MYVIMDIR . '/scripts/fmt-codeowners.py'
    call winrestview(saved_view)
endfunc

" set the codeowners file type
augroup au_set_ft_codeowners
    autocmd!
    autocmd! BufNewFile,BufReadPost,BufFilePost,VimEnter,BufNew,BufEnter,FileType CODEOWNERS set ft=codeowners
augroup end

augroup ag_fmt_codeowners
    autocmd!
    autocmd! BufWritePost CODEOWNERS silent call RetabTable()
augroup end

call DebugPrint('41.9-tables.vimrc: end')

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
