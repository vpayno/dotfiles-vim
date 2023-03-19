"
" vimrc.d/00.13-tags.vimrc
"

call DebugPrint('00.13-tags.vimrc: start')

set tags=./tags

" Used to create tags file.
command! MakeTags !ctags --exclude=@${HOME}/.vim/.ctagsignore -R .

augroup au_gen_tags
	autocmd BufWritePost * call IsCodeFile() | silent! !ctags --exclude=@${HOME}/.vim/.ctagsignore -R .
augroup end

call DebugPrint('00.13-tags.vimrc: end')

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
