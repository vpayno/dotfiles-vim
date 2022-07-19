"
" ~/.vim/vimrc
"

" !has("compatible") or has("eval") or has("autocmd")
if version >= 500

    " Enable(1)/disable(0) debug mode.
    let g:_debug_mode = 0

    " Enable/disable my options.
    let _enable_line_wrap = 0

    " Enable/disable plugins.
    let _enable_ack = 1
    let _enable_airline = 1 " if disabled, lightline is used
    let _enable_arduino = 1
    let _enable_buftabline = 1
    let _enable_calendar_vim = 1
    let _enable_conque_shell = 0 " old, broken
    let _enable_conquerofcompletion = 0
    let _enable_css = 1 " controls all of the css_ options
    let _enable_css_less = 1
    let _enable_denops = 0 " required by denops-docker
    let _enable_docker = 0
    let _enable_golang = 1 " requires at least Vim 8.0.1453 or Neovim 0.4.0
    let _enable_golang_govim = 0 " needs _enable_golang=1
    let _enable_html5_svg = 0
    let _enable_indent_guides = 1
    let _enable_jq = 1     " requires at least vim 8.1.1776 (no neovim support)
    let _enable_jqplay = 1 " requires at least vim 8.1.1776 (no neovim support)
    let _enable_kite = 0
    let _enable_lsp = 1
    let _enable_markdown = 1 " also enables tabular
    let _enable_nerdtree = 0 " if disabled, netrw is used
    let _enable_nerdtree_git = 0
    let _enable_other_todo_highlight = 0
    let _enable_orgmode = 0
    let _enable_perl5 = 0
    let _enable_perl6 = 0
    let _enable_powerline = 0 " if disabled, airline is used
    let _enable_python_autopep8 = 0
    let _enable_python_isort = 0
    let _enable_python_jedi = 0
    let _enable_python_pymode = 0
    let _enable_ripgrep = 1
    let _enable_ruby = 0
    let _enable_salt = 0
    let _enable_slime = 1
    let _enable_snipmate = 0 " if enabled, overrides utilsnips
    let _enable_tabnine = 0
    let _enable_taboo = 0 " if enabled, it overrides other tab plugins
    let _enable_telescope = 1
    let _enable_tmux_navigator = 0 " not sure what the point of this plugin is
    let _enable_utilsnips = 0 " overidden by snipmate
    let _enable_vimwiki = 1
    let _enable_youcompleteme = 0
    let _enable_youcompleteme_tabnine = 0 " overrides youcompleteme and tabnine
    let _enable_virtualenv = 0

    " Helper Functions.
    function! DebugPrint(message)
        if g:_debug_mode
            echom "DEBUG:" a:message
        endif
    endfunction

    if g:_debug_mode
        call DebugPrint("You can use :messages to show statusline messages.")
        call DebugPrint("You can use :scriptnames to show loaded plugins.")
        call DebugPrint("You can use :function to list all functions.")
    endif

    call DebugPrint("runtime! vimrc.d/*.vimrc: start")

    " VIM & NEOVIM: Load the extra configs.
    runtime! vimrc.d/*.vimrc

    " NEOVIM: Load the extra configs.
    if has("nvim")
        runtime! vimrc.d/*.nvimrc
    endif

    if !has("nvim")
        "set pythonthreedll=/home/vpayno/.pyenv/versions/3.9.1/lib/libpython3.9.a
        set pythonthreedll=/home/vpayno/.pyenv/versions/3.10.2/lib/libpython3.so
    endif

    call DebugPrint("runtime! vimrc.d/*.vimrc: end")

endif
