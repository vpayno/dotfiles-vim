"
" ~/vimrc.d/41.0-markdown.vimrc
"
" https://travis-ci.org/godlygeek/tabular
" https://travis-ci.org/plasticboy/vim-markdown

if _enable_markdown
    call DebugPrint('41.0-markdown.vimrc: [vim-markdown] start')

    function! ConfigureFileTypeMarkdown()
        " Load plugins.
        packadd! tabular      " must load before vim-markdown
        packadd! vim-markdown

        let g:vim_markdown_math = g:enable
        let g:vim_markdown_toc_autofit = g:disable
        let g:vim_markdown_strikethrough = g:enable
        let g:vim_markdown_auto_insert_bullets = g:disable
        let g:vim_markdown_new_list_item_indent = g:disable

        let g:vim_markdown_conceal = g:disable

        "let g:vim_markdown_folding_disabled = g:enable
        let g:vim_markdown_folding_level = 6
        let g:vim_markdown_folding_style_pythonic = g:enable
        "let g:vim_markdown_override_foldtext = g:disable
    endfunction

    augroup ag_markdown_setup
        autocmd!
        autocmd BufEnter,BufRead,FileType * if &filetype==#'markdown' | call ConfigureFileTypeMarkdown() | endif
    augroup end

    augroup au_markdown_ft_set
        autocmd!
        autocmd BufNewFile,BufRead *.md set filetype=markdown
    augroup end

    call DebugPrint('41.0-markdown.vimrc: [vim-markdown] end')
endif

if _enable_ale
    call DebugPrint('41.0-markdown.vimrc: [ale] start')

    let g:ale_fixers.markdown = ['textlint']
    let g:ale_linters.markdown = ['markdownlint']
    let g:ale_markdown_markdownlint_options = '--config ~/.vim/configs/markdownlint.json'
    let g:ale_linters_ignore.markdown = []

    call DebugPrint('41.0-markdown.vimrc: [ale] end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
