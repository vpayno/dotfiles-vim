"
" vimrc.d/00.13-tags.vimrc
"

call DebugPrint('runtime! vimrc.d/00.13-tags.vimrc: start')

set tags=./tags,~/.vimrc/tags

" Used to create tags file.
command! MakeTags !ctags -R .

augroup au_gen_tags
	autocmd BufWritePost * call IsCodeFile() | silent! !ctags --exclude=@${HOME}/.vim/.ctagsignore -R .
augroup end

call DebugPrint('runtime! vimrc.d/00.13-tags.vimrc: end')

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
