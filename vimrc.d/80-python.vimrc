"
" vimrc.d/80-python.vimrc
"
" https://github.com/davidhalter/jedi
" https://github.com/davidhalter/jedi-vim
" https://github.com/python-mode/python-mode
" https://github.com/tell-k/vim-autopep8

if _enable_python_jedi
	call DebugPrint("80-python.vimrc: start [jedi-vim]")

	" Load plugins.
	packadd! jedi-vim

	call DebugPrint("80-python.vimrc: end [jedi-vim]")
endif

if _enable_python_pymode
	call DebugPrint("80-python.vimrc: start [python-mode]")

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

	call DebugPrint("80-python.vimrc: end [python-mode]")
endif

if _enable_python_autopep8
	call DebugPrint("80-python.vimrc: start [autopep8]")

	" Load plugins.
	packadd! vim-autopep8

	call DebugPrint("80-python.vimrc: end [autopep8]")
endif
