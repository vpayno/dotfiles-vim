"
" ~/.vim/vimrc.d/99.82-securemodelines.vimrc
"

" https://www.vim.org/scripts/script.php?script_id=1876

call DebugPrint('99.82-securemodelines.vimrc: start')

" plugin always enabled
let g:_enable_secure_modelines = g:enable

" except when
augroup au_disable_secure_modelines
    autocmd!
    autocmd FileType gitcommit,gitrebase,netrw,qf let g:_enable_secure_modelines = g:disable
augroup end

function! ReloadModeLine()
    if get(g:, 'reload_mode_line', v:false)
        let g:reload_mode_line = v:true
        set modeline | doautocmd BufRead
    else
        let g:reload_mode_line = v:false
    endif
endfunction

if g:_enable_secure_modelines
    packadd! securemodelines
endif

let g:secure_modelines_allowed_items = [
    \ 'expandtab',   'et',   'noexpandtab', 'noet',
    \ 'filetype',    'ft',
    \ 'foldmethod',  'fdm',
    \ 'readonly',    'ro',   'noreadonly', 'noro',
    \ 'rightleft',   'rl',   'norightleft', 'norl',
    \ 'shiftwidth',  'sw',
    \ 'softtabstop', 'sts',
    \ 'syntax',
    \ 'tabstop',     'ts',
    \ 'textwidth',   'tw',
\ ]

" Set to true to warn when a modeline attempts to set any other option.
let g:secure_modelines_verbose = g:disable

" Number of lines to check. Defaults to 5.
let g:secure_modelines_modelines = 5

" If defined &modeline will not be unset.
" let g:secure_modelines_leave_modeline = g:enable

call DebugPrint('99.82-securemodelines.vimrc: end')

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
