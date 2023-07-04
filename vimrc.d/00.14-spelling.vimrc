"
" vimrc.d/00.14-spelling.vimrc
"

call DebugPrint('00.14-spelling.vimrc: start')

set spellfile=$HOME/.vim/spell/en.utf-8.add

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

:highlight SpellBad cterm=underline ctermfg=black ctermbg=LightGrey

if _enable_ale
    let g:ale_cspell_options = 'lint --config ~/.vim/configs/cspell.config.yaml --no-progress --show-suggestions'

    function! CSpellAddAllToDictionary()
        let l:words = systemlist('cspell lint --config ~/.vim/configs/cspell.config.yaml --no-progress --words-only --unique ' . @% . ' 2>/dev/null | sort --ignore-case')
        echom 'Adding [' . join(l:words, ', ') . '] to custom cspell dictionary'
        call writefile(l:words, $HOME . '/.vim/configs/cspell-custom_dictionary.txt', 'a')
    endfunction
endif

call DebugPrint('00.14-spelling.vimrc: end')

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
