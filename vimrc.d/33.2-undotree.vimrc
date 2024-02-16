"
" ~/vimrc.d/33.2-undotree.vimrc
"
" https://github.com/mbbill/undotree

scriptencoding utf-8

if _enable_undotree
    call DebugPrint('33.2-undotree.vimrc: start')

    let g:undotree_WindowLayout = 3 " 1-4
    let g:undotree_ShortIndicators = g:enable
    let g:undotree_SplitWidth = 24

    " Load the plugin.
    packadd! undotree

    " nnoremap <F5> :UndotreeToggle<CR>

    if _enable_undotree_persist
        if has('persistent_undo')
            let target_path = expand('~/.undodir')

            " create the directory and any parent directories
            " if the location does not exist.
            if !isdirectory(target_path)
                call mkdir(target_path, 'p', 0700)
            endif

            let &undodir=target_path
            set undofile
        endif
    endif

    call DebugPrint('33.2-undotree.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
