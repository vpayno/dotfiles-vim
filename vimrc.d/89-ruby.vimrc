"
" ~/.vim/vimrc.d/89-ruby.vimrc
"
" https://github.com/vim-ruby/vim-ruby
" https://github.com/tpope/vim-bundler
" https://github.com/tpope/vim-rails
" https://github.com/tpope/vim-rake

if _enable_ruby
	call DebugPrint("89-ruby.vimrc: start")

	" Load plugins.
	packad! vim-ruby
	packad! vim-rake
	packad! vim-rails
	packad! vim-bundler

	call DebugPrint("89-ruby.vimrc: end")
endif
