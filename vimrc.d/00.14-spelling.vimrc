"
" vimrc.d/00.14-spelling.vimrc
"

call DebugPrint('00.14-spelling.vimrc: start')

let g:SpellModeFlag = g:false

function! ToggleSpelling()
    if g:SpellModeFlag
        set nospell
        let g:SpellModeFlag = g:false
    else
        set spell spelllang=en_us
        let g:SpellModeFlag = g:true
    endif
endfunction

:highlight SpellBad cterm=underline ctermfg=black ctermbg=magenta

call DebugPrint('00.14-spelling.vimrc: end')

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
