"
" ~/.vim/vimrc.d/60.0-gentoo.vimrc
"

" https://github.com/gentoo/gentoo-syntax

if _enable_gentoo
    call DebugPrint('60.0-gentoo.vimrc: start')

    " Load plugins.
    packadd! gentoo-syntax

    " with ale, automatically enables pkgcheck if installed
    " let g:syntastic_ebuild_checkers = ['pkgcheck']
    " let g:syntastic_sh_checkers = ['sh', 'checkbashisms']

    call DebugPrint('60.0-gentoo.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
