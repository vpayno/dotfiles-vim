"
" vimrc.d/44.0-python.vimrc
"
" https://github.com/davidhalter/jedi
" https://github.com/davidhalter/jedi-vim
" https://github.com/python-mode/python-mode
" https://github.com/tell-k/vim-autopep8

autocmd! BufWritePost *.py | execute 'silent !pyfmt --vim %' | :e

if (!_enable_kite && !_enable_youcompleteme) && _enable_python_pymode
	call DebugPrint("44.0-python.vimrc: start [python-mode]")

	" Load plugins.
	packadd! python-mode

	" Supported languages are: ada, c, chill, csc, forth, groovy, icon, java, lpc, mel, nqc, nroff, ora, pascal, plm, plsql, python and ruby. The c settings also apply to cpp.
	"let c_space_errors = 0
	"let ada_space_errors = 1
	"let chill_space_errors = 1
	"let csc_space_errors = 1
	"let forth_space_errors = 1
	"let groovy_space_errors = 1
	"let icon_space_errors = 1
	"let java_space_errors = 1
	"let lpc_space_errors = 1
	"let nroff_space_errors = 1
	"let ora_space_errors = 1
	"let pascal_space_errors = 1
	"let plsql_space_errors = 1
	"let python_space_errors = 1
	"let ruby_space_errors = 1
	"let java_space_errors = 1

	" pyflakes
	let g:khuno_ignore="E501"

	"
	" pymode options
	"

	" Pylint configuration file
	let g:pymode_lint_config = '$HOME/.pylintrc'

	let g:pymode_options_max_line_length = 120

	" OPTION: g:pymode_folding -- bool. Disable python-mode folding for pyfiles.
	"call pymode#Default("g:pymode_folding", 0)

	" OPTION: g:pymode_syntax -- bool. Enable python-mode syntax for pyfiles.
	"call pymode#Default("g:pymode_syntax", 1)

	" OPTION: g:pymode_indent -- bool. Enable/Disable pymode PEP8 indentation
	"call pymode#Default("g:pymode_indent", 1)

	" OPTION: g:pymode_utils_whitespaces -- bool. Remove unused whitespaces on save
	"call pymode#Default("g:pymode_utils_whitespaces", 1)

	" OPTION: g:pymode_options -- bool. To set some python options.
	"call pymode#Default("g:pymode_options", 1)

	" OPTION: g:pymode_updatetime -- int. Set updatetime for async pymode's operation
	"call pymode#Default("g:pymode_updatetime", 1000)

	" OPTION: g:pymode_lint_ignore -- string. Skip errors and warnings (e.g.  E4,W)
	"call pymode#Default("g:pymode_lint_ignore", "E501")

	call DebugPrint("44.0-python.vimrc: end [python-mode]")

elseif _enable_python_jedi

	call DebugPrint("44.0-python.vimrc: start [jedi-vim]")

	" https://github.com/davidhalter/jedi-vim

	" Load plugins.
	packadd! jedi-vim

	set omnifunc=jedi#completions
	set completeopt=menuone,longest,preview

	" let g:jedi#auto_initialization = 0

	" There are also some VIM options (like completeopt and key defaults) which are automatically initialized, but you can skip this:
	" let g:jedi#auto_vim_configuration = 0

	" You can make jedi-vim use tabs when going to a definition etc:
	" let g:jedi#use_tabs_not_buffers = 1

	" If you are a person who likes to use VIM-splits, you might want to put this in your .vimrc:
	" let g:jedi#use_splits_not_buffers = "left"

	" This options could be "left", "right", "top", "bottom" or "winwidth". It will decide the direction where the split open.
	" Jedi automatically starts the completion, if you type a dot, e.g. str., if you don't want this:
	" let g:jedi#popup_on_dot = 0

	" Jedi selects the first line of the completion menu: for a better typing-flow and usually saves one keypress.
	" let g:jedi#popup_select_first = 0

	" Jedi displays function call signatures in insert mode in real-time, highlighting the current argument. The call signatures can be displayed as a pop-up in the buffer (set to 1 by default (with the conceal feature), 2 otherwise), which has the advantage of being easier to refer to (but is a hack with many drawbacks since it changes the buffer's contents), or in Vim's command line aligned with the function call (set to 2), which can improve the integrity of Vim's undo history.
	" let g:jedi#show_call_signatures = "1"

	" Here are a few more defaults for actions, read the docs (:help jedi-vim) to get more information. If you set them to "", they are not assigned.
	let g:jedi#goto_command = "<leader>d"
	let g:jedi#goto_assignments_command = "<leader>g"
	let g:jedi#goto_stubs_command = "<leader>s"
	let g:jedi#goto_definitions_command = "<leader>D"
	let g:jedi#documentation_command = "K"
	let g:jedi#usages_command = "<leader>n"
	let g:jedi#completions_command = "<C-Space>"
	let g:jedi#rename_command = "<leader>r"

	" An example for setting up your project:
	" let g:jedi#environment_path = "/usr/bin/python3.9"

	" jedi-vim tries its best to guess your virtual env. If you want to work with a specific virtual environment however, you can point jedi-vim towards it:
	" let g:jedi#environment_path = "venv"

	" Finally, if you don't want completion, but all the other features, use:
	" let g:jedi#completions_enabled = 0

	call DebugPrint("44.0-python.vimrc: end [jedi-vim]")

else

	call DebugPrint("44.0-python.vimrc: start [omnicomplete]")

	" https://stackabuse.com/vim-for-python-development/
	set omnifunc=syntaxcomplete#Complete

	call DebugPrint("44.0-python.vimrc: end [omnicomplete]")

endif

if _enable_python_autopep8
	call DebugPrint("44.0-python.vimrc: start [autopep8]")

	" Load plugins.
	packadd! vim-autopep8

	call DebugPrint("44.0-python.vimrc: end [autopep8]")
endif

if _enable_python_isort
	call DebugPrint("44.0-python.vimrc: start [isort]")

	" Load plugins.
	packadd! vim-isort

	"let g:vim_isort_map = '<C-i>'
	let g:vim_isort_map = ''

	let g:vim_isort_config_overrides = {
		\ 'include_trailing_comma': 1,
		\ 'multi_line_output': 3
		\}

	let g:vim_isort_python_version = 'python3'

	call DebugPrint("44.0-python.vimrc: end [isort]")
endif
