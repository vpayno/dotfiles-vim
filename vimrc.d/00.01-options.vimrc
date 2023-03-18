"
" vimrc.d/00.00-options.vimrc
"

call DebugPrint('runtime! vimrc.d/00.01-options.vimrc: start')

" Enable/disable my options.
let _enable_line_wrap = g:Disable

" Enable/disable plugins.
let _enable_ack = g:Enable
let _enable_airline = g:Enable " if disabled, lightline is used
let _enable_arduino = g:Enable
let _enable_buftabline = g:Enable
let _enable_calendar_vim = g:Enable
let _enable_conque_shell = g:Disable " old, broken
let _enable_conquerofcompletion = g:Enable
let _enable_css = g:Enable " controls all of the css_ options
let _enable_css_less = g:Enable
let _enable_css_color = g:Enable
let _enable_dart = g:Enable
let _enable_denops = g:Disable " required by denops-docker
let _enable_docker = g:Disable
let _enable_github_actions = g:Enable
let _enable_golang = g:Enable " requires at least Vim 8.0.1453 or Neovim 0.4.0
let _enable_golang_govim = g:Disable " needs _enable_golang=1
let _enable_haskell = g:Enable
let _enable_html5_svg = g:Disable
let _enable_indent_guides = g:Enable
let _enable_jq = g:Enable	   " requires at least vim 8.1.1776 (no neovim support)
let _enable_jqplay = g:Enable " requires at least vim 8.1.1776 (no neovim support)
let _enable_kite = g:Disable
let _enable_lsp = g:Disable
let _enable_markdown = g:Enable " also enables tabular
let _enable_nerdtree = g:Disable " if disabled, netrw is used
let _enable_nerdtree_git = g:Disable
let _enable_orgmode = g:Disable
let _enable_other_todo_highlight = g:Disable
let _enable_perl5 = g:Disable
let _enable_perl6 = g:Disable
let _enable_powerline = g:Disable " if disabled, airline is used
let _enable_python = g:Enable
let _enable_python_autopep8 = g:Disable
let _enable_python_coc_pyright = g:Enable
let _enable_python_isort = g:Disable
let _enable_python_jedi = g:Disable
let _enable_python_pymode = g:Disable
let _enable_ripgrep = g:Enable
let _enable_ruby = g:Disable
let _enable_salt = g:Disable
let _enable_slime = g:Enable
let _enable_snipmate = g:Disable " if enabled, overrides utilsnips
let _enable_tabnine = g:Disable
let _enable_taboo = g:Disable " if enabled, it overrides other tab plugins
let _enable_telescope = g:Enable
let _enable_termdebug = g:Enable
let _enable_tmux_navigator = g:Disable " not sure what the point of this plugin is
let _enable_utilsnips = g:Disable " overidden by snipmate
let _enable_vim_themis = g:Enable
let _enable_vim_vader = g:Enable
let _enable_vimwiki = g:Enable
let _enable_utils_baseconvert = g:Enable
let _enable_vimspector = g:Enable
let _enable_virtualenv = g:Disable
let _enable_youcompleteme = g:Disable
let _enable_youcompleteme_tabnine = g:Disable " overrides youcompleteme and tabnine

call DebugPrint('runtime! vimrc.d/00.01-options.vimrc: stop')

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
