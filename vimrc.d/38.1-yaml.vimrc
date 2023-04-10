"
" ~/.vim/vimrc.d/38.1-yaml.vimrc
"
" https://www.arthurkoziel.com/setting-up-vim-for-yaml/
" https://github.com/stephpy/vim-yaml
"

if &filetype==#'yaml'
	call DebugPrint('38.1-yaml.vimrc: start')

	packadd! vim-yaml

	let g:yaml_limit_spell g:disable

	call DebugPrint('38.1-yaml.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
