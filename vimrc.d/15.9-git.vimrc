"
" ~/.vim/vimrc.d/15.9-git.vimrc
"

call DebugPrint('15.9-git.vimrc: start')

augroup au_git
    autocmd!
    autocmd BufNewFile,BufRead,BufEnter .git/COMMIT_EDITMSG set filetype=gitcommit | set nomodeline | set paste
augroup end

call DebugPrint('15.9-git.vimrc: end')

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
