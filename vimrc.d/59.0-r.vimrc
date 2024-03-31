"
" vimrc.d/59.0-r.vimrc

if _enable_r
    call DebugPrint('59.0-r.vimrc: start')

    packadd! Nvim-R

    let g:ale_r_languageserver_executable = $HOME . '/.vim/scripts/r-lsp'

    let g:ale_r_languageserver_cmd = 'languageserver::run()'
    let g:ale_r_languageserver_config = {}

    let g:ale_r_format_executable = 'rfmt'

    let g:ale_r_linter_executable = $HOME . '/.vim/scripts/r-lintr'

    let g:ale_r_lintr_options = 'lintr::linters_with_defaults()'
    let g:ale_r_lintr_lint_package = v:true

    let g:ale_linters.r = ['languageserver', 'lintr']
    let g:ale_fixers.r = ['styler']

    let g:ale_r_styler_options = 'styler::tidyverse_style'

    call DebugPrint('59.0-r.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
