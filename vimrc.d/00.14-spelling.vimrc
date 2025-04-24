"
" vimrc.d/00.14-spelling.vimrc
"

call DebugPrint('00.14-spelling.vimrc: start')

" set spellfile=$HOME/spell/en.utf-8.add
let &spellfile = g:MYVIMDIR . '/spell/en.utf-8.add'

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

command! ToggleSpelling call ToggleSpelling()

:highlight SpellBad cterm=underline ctermfg=black ctermbg=LightGrey

if _enable_ale
    " disable cspell by default (it's really annoying)
    let g:ale_cspell_executable = 'true'

    let g:ale_cspell_options = 'lint --config ' . g:MYVIMDIR . '/.vim/configs/cspell.config.yaml --no-progress --show-suggestions'

    function! CSpellAddAllToDictionary()
        let l:words = systemlist('cspell lint --config ' . g:MYVIMDIR . '/.vim/configs/cspell.config.yaml --no-progress --words-only --unique ' . @% . ' 2>/dev/null | sort --ignore-case')
        echom 'Adding [' . join(l:words, ', ') . '] to custom cspell dictionary'
        call writefile(l:words, g:MYVIMDIR . '/configs/cspell-custom_dictionary.txt', 'a')
    endfunction

    let g:CSpellEnabledFlag = v:false

    function! CSpellToggle()
        if g:CSpellEnabledFlag
            let g:CSpellEnabledFlag = v:false
            let g:ale_cspell_executable = 'true'
        else
            let g:CSpellEnabledFlag = v:true
            let g:ale_cspell_executable = 'cspell'
        endif
    endfunction

    command! CSpellToggle call CSpellToggle()
endif

call DebugPrint('00.14-spelling.vimrc: end')

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
