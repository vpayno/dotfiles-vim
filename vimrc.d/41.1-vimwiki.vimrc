"
" ~/vimrc.d/41.1-vimwiki.vimrc
"
" https://vimwiki.github.io/
" https://github.com/vimwiki/vimwiki
" https://vimwiki.github.io/vimwikiwiki/Related%20Tools.html#Related%20Tools-External%20Tools
" https://pandoc.org/MANUAL.html

if _enable_vimwiki
    call DebugPrint('41.1-vimwiki.vimrc: start')

    " These need to be set in 05-defaults.vimrc.
    " set nocompatible
    " filetype plugin on
    " syntax on

    function! ConfigureFileTypeWiki()
        " Load plugins.
        packadd! vimwiki

        " syntax: default, markdown, media, mediawiki
        " ext: .wiki, .md
        let g:vimwiki_list = [
            \ {
                \ 'path': '~/git_vpayno/vpayno-vimwiki/',
                \ 'syntax': 'default',
                \ 'ext': '.wiki'
            \ },
        \]
    endfunction

    augroup ag_wiki_setup
        autocmd!
        autocmd BufEnter,BufRead,FileType * if &filetype==#'wiki' | call ConfigureFileTypeWiki() | endif
    augroup end

    augroup au_markdown_ft_set
        autocmd!
        autocmd BufNewFile,BufRead *.wiki set filetype=wiki
    augroup end

    call DebugPrint('41.1-vimwiki.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
