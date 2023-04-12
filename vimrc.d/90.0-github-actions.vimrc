"
" ~/.vim/vimrc.d/90.0-github-actions.vimrc
"
" https://github.com/yasuhiroki/github-actions-yaml.vim

if _enable_github_actions
	call DebugPrint('90.0-github-actions.vimrc: start')

	" Load plugins.
	packadd! github-actions-yaml.vim

	call DebugPrint('90.0-github-actions.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
