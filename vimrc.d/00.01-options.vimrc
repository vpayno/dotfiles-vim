"
" vimrc.d/00.00-options.vimrc
"

call DebugPrint('00.01-options.vimrc: start')

" Enable/disable my options.
let _enable_line_wrap = g:disable

" Enable/disable plugins.
let _enable_ale = g:enable
let _enable_ack = g:enable
let _enable_airline = g:enable " if disabled, lightline is used
let _enable_arduino = g:enable
let _enable_buftabline = g:enable
let _enable_calendar_vim = g:enable
let _enable_clever_f = g:enable
let _enable_conque_shell = g:disable " old, broken
let _enable_coc = g:disable
let _enable_css = g:enable " controls all of the css_ options
let _enable_css_less = g:enable
let _enable_css_color = g:enable
let _enable_dart = g:enable
let _enable_denops = g:disable " required by denops-docker
let _enable_fzf = g:enable
let _enable_docker = g:disable
let _enable_github_actions = g:enable
let _enable_golang = g:enable " requires at least Vim 8.0.1453 or Neovim 0.4.0
let _enable_golang_vimgo = g:disable " needs _enable_golang=1
let _enable_golang_govim = g:disable " needs _enable_golang=1
let _enable_haskell = g:enable
let _enable_html5_svg = g:disable
let _enable_indent_guides = g:enable
let _enable_indent_object = g:enable
let _enable_jq = g:enable	   " requires at least vim 8.1.1776 (no neovim support)
let _enable_jqplay = g:enable " requires at least vim 8.1.1776 (no neovim support)
let _enable_kite = g:disable
let _enable_lion = g:enable
let _enable_lsp = g:enable
let _enable_markdown = g:enable " also enables tabular
let _enable_nerdtree = g:disable " if disabled, netrw is used
let _enable_nerdtree_git = g:disable
let _enable_orgmode = g:disable
let _enable_other_todo_highlight = g:disable
let _enable_perl5 = g:enable
let _enable_perl6 = g:enable
let _enable_powerline = g:disable " if disabled, airline is used
let _enable_python = g:enable
let _enable_python_autopep8 = g:disable
let _enable_python_coc_pyright = g:disable
let _enable_python_isort = g:disable
let _enable_python_jedi = g:disable
let _enable_python_pymode = g:disable
let _enable_ripgrep = g:enable
let _enable_ruby = g:enable
let _enable_rust = g:enable
let _enable_rust_coc = g:disable
let _enable_rust_rustvim = g:enable
let _enable_rust_vimracer = g:disable
let _enable_salt = g:disable
let _enable_slime = g:enable
let _enable_sh = g:enable
let _enable_snipmate = g:disable " if enabled, overrides utilsnips
let _enable_syntastic = g:disable " dead, use ale instead
let _enable_tabnine = g:disable
let _enable_taboo = g:disable " if enabled, it overrides other tab plugins
let _enable_targets = g:enable
let _enable_telescope = g:enable
let _enable_termdebug = g:enable
let _enable_tmux_navigator = g:disable " not sure what the point of this plugin is
let _enable_utilsnips = g:disable " overidden by snipmate
let _enable_vim_themis = g:enable
let _enable_vim_vader = g:enable
let _enable_vimwiki = g:enable
let _enable_utils_baseconvert = g:enable
let _enable_vimspector = g:enable
let _enable_virtualenv = g:disable
let _enable_wordmotion = g:enable
let _enable_youcompleteme = g:disable
let _enable_youcompleteme_tabnine = g:disable " overrides youcompleteme and tabnine

call DebugPrint('00.01-options.vimrc: stop')

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
