"
" ~/vimrc.d/41.1-vimwiki.vimrc
"
" https://vimwiki.github.io/
" https://github.com/vimwiki/vimwiki
" https://vimwiki.github.io/vimwikiwiki/Related%20Tools.html#Related%20Tools-External%20Tools
" https://pandoc.org/MANUAL.html

if _enable_vimwiki
	call DebugPrint('41.1-vimwiki.vimrc: start')

	" These need to be set in 05-defaults.vimrc.
	" set nocompatible
	" filetype plugin on
	" syntax on

	" Load plugins.
	packadd! vimwiki

	" syntax: default, markdown, media, mediawiki
	" ext: .wiki, .md
	let g:vimwiki_list = [
		\ {
			\ 'path': '~/git_vpayno/vpayno-vimwiki/',
			\ 'syntax': 'default',
			\ 'ext': '.wiki'
		\ },
	\]

	call DebugPrint('41.1-vimwiki.vimrc: end')
endif
