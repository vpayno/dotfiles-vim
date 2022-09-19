"
" ~/.vim/vimrc.d/50.0-dart.vimrc
"
" https://github.com/dart-lang/dart-vim-plugin

" autocmd! BufWritePost *.dart | execute 'silent !dart format %' | :e
" autocmd! BufWritePost *.dart | execute '! dart format %' | :e

if _enable_dart
	call DebugPrint('50.0-dart.vimrc: start')

	" Load plugins.
	packadd! dart-vim-plugin

	let dart_html_in_string=v:true
	let g:dart_style_guide = 2
	let g:dart_format_on_save = 1

	" (discover formatter options with dartfmt -h)
	" let g:dartfmt_options =

	let g:dart_trailing_comma_indent = v:true
	let g:lsc_auto_map = v:true

	call DebugPrint('50.0-dart.vimrc: end')
endif
