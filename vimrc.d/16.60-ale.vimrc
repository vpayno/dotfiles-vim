"
" ~/.vim/vimrc.d/16.60-ale.vimrc
"
" https://github.com/dense-analysis/ale

" vint: -ProhibitEncodingOptionAfterScriptEncoding
set encoding=utf-8
scriptencoding utf-8
" vint: +ProhibitEncodingOptionAfterScriptEncoding

if _enable_ale
    call DebugPrint('16.60-ale.vimrc: start')

    " Must be set before ale is loaded.
    let g:ale_completion_enabled = g:enable

    let g:ale_set_balloons = g:enable
    let g:ale_cursor_detail = g:enable
    let g:ale_detail_to_floating_preview = g:enable
    let g:ale_disable_lsp = g:enable " or auto

    " test this to see if it slows down the editor
    let g:ale_echo_cursor = g:enable

    "set completeopt=menu,menuone,preview,noselect,noinsert
    "set omnifunc=ale#completion#OmniFunc

    let g:ale_set_quickfix = g:enable

    " automatically open and close the quickfix list window
    let g:ale_open_list = g:enable

    " only run linters on save?
    let g:ale_lint_on_save = g:enable

    " only run fixers on save?
    let g:ale_fix_on_save = g:enable

    let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰', '│', '─']
    " let g:ale_floating_window_border = repeat([''], 8)

    " enable lint status line
    " Set this. Airline will handle the rest.
    let g:airline#extensions#ale#enabled = 1

    function! LinterStatus() abort
        let l:counts = ale#statusline#Count(bufnr(''))

        let l:all_errors = l:counts.error + l:counts.style_error
        let l:all_non_errors = l:counts.total - l:all_errors

        return l:counts.total == 0 ? 'OK' : printf(
        \   '%dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
    endfunction

    set statusline=%{LinterStatus()}

    " https://github.com/dense-analysis/ale/tree/master/autoload/ale/fixers
    let g:ale_fixers = {
        \   '*': ['remove_trailing_lines', 'trim_whitespace'],
        \}

    let g:ale_linters = {
        \   'vim': ['vint'],
        \   'xml': ['xmllint'],
        \}

    let g:ale_linters_ignore = {}

    " Only run linters named in ale_linters settings.
    let g:ale_linters_explicit = g:disable

    let g:ale_echo_msg_error_str = 'E'
    let g:ale_echo_msg_warning_str = 'W'
    "let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
    let g:ale_echo_msg_format = '[%linter%] (%code) %%s [%severity%]'

    let g:LanguageClient_useVirtualText = g:enable

    " let g:ale_popup_menu_enabled = g:enable
    let g:ale_hover_cursor = g:enable
    let g:ale_hover_to_preview = ! g:ale_hover_cursor
    let g:ale_hover_to_floating_preview = g:ale_hover_to_preview
    let g:ale_hover_cursor = g:enable
    let g:ale_set_balloons = g:enable

    augroup ag_ale_hover_cursor
        autocmd!
        autocmd CursorHold * ALEHover
    augroup END

    packadd! ale

    if g:false

        let g:ale_fixers = {
            \   '*': ['remove_trailing_lines', 'trim_whitespace'],
            \   'javascript': ['eslint'],
            \   'vim': ['vint'],
            \}

        let g:ale_lint_on_save = g:enable
        if g:ale_lint_on_save
            " Write this in your vimrc file
            let g:ale_lint_on_text_changed = 'never'
            let g:ale_lint_on_insert_leave = g:disable
            " You can disable this option too
            " if you don't want linters to run on opening a file
            let g:ale_lint_on_enter = g:disable
        else
            let g:ale_lint_on_enter = g:enable
        endif

        " Disable whitespace warnings
        let g:ale_warn_about_trailing_whitespace = g:disable

        " default, current, disabled
        " let g:ale_virtualtext_cursor = 'current'

        let g:ale_sign_error = '>>'
        let g:ale_sign_warning = '--'

        "highlight clear ALEErrorSign
        "highlight clear ALEWarningSign

        let g:ale_sign_column_always = g:enable
        let g:ale_set_highlights = g:enable

        if _enable_coc
            let g:ale_disable_lsp = g:enable
        endif

        nmap <silent> <C-k> <Plug>(ale_previous_wrap)
        nmap <silent> <C-j> <Plug>(ale_next_wrap)
        nmap <silent> <C-e> <Plug>(ale_next_wrap)

        " call deoplete#custom#option('sources', {
        " \ '_': ['ale', 'foobar'],
        " \})

        let g:ale_completion_autoimport = g:enable

        let g:ale_set_loclist = g:disable
        let g:ale_set_quickfix = ! g:ale_set_loclist

        " This can be useful if you are combining ALE with
        " some other plugin which sets quickfix errors, etc.
        let g:ale_keep_list_window_open = g:enable

        let g:ale_list_vertical = g:enable
    endif

    call DebugPrint('16.60-ale.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
