"
" ~/.vim/vimrc.d/48.0-ruby.vimrc
"
" https://github.com/vim-ruby/vim-ruby
" https://github.com/tpope/vim-bundler
" https://github.com/tpope/vim-rails
" https://github.com/tpope/vim-rake
" :LspInstallServer

if _enable_ruby
    call DebugPrint('48.0-ruby.vimrc: start')

    function! ConfigureFileTypeRuby()
        packadd! vim-ruby
        packadd! vim-rake
        packadd! vim-rails
        packadd! vim-bundler
    endfunction

    augroup ag_ruby_setup
        autocmd!
        autocmd BufEnter,BufRead,FileType * if &filetype==#'ruby' | call ConfigureFileTypeRuby() | endif
    augroup end

    call DebugPrint('48.0-ruby.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
