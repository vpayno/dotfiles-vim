"
" vimrc.d/00.05-vimscript.vimrc
"
" https://github.com/iamcco/vim-language-server
"
" yarn global add vim-language-server
" npm install -g vim-language-server
" :CocInstall coc-vimlsp

call DebugPrint('00.05-vimscript.vimrc: start')

augroup au_vimscript_retab
	autocmd!
	autocmd BufReadPost * if &filetype==#'vim' | set noet | :%retab! | :w | endif
augroup end

call DebugPrint('00.05-vimscript.vimrc: end')

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
