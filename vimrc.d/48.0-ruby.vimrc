"
" ~/.vim/vimrc.d/48.0-ruby.vimrc
"
" https://github.com/vim-ruby/vim-ruby
" https://github.com/tpope/vim-bundler
" https://github.com/tpope/vim-rails
" https://github.com/tpope/vim-rake

if (&filetype==#'ruby' && _enable_ruby)
	call DebugPrint('48.0-ruby.vimrc: start')

	" Load plugins.
	packadd! vim-ruby
	packadd! vim-rake
	packadd! vim-rails
	packadd! vim-bundler

	call DebugPrint('48.0-ruby.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
