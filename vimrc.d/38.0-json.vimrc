"
" ~/.vim/vimrc.d/38.0-json.vimrc
"
" https://github.com/elzr/vim-json

if &filetype==#'json'
	call DebugPrint('38.0-json.vimrc: start')

	augroup au_json
		autocmd!
		autocmd BufNewFile,BufRead *.json set filetype=json
	augroup end

	augroup ag_json_jsonfmt
		autocmd!
		autocmd! BufWritePost *.json | execute 'silent !"${HOME}"/.vim/scripts/jsonfmt --vim %' | :e
	augroup end

	" https://vi.stackexchange.com/questions/16906/how-to-format-json-file-in-vim
	function FormatJson()
		execute '%!jq --sort-keys .'
	endfunction

	command! JsonFmt %!jq --sort-keys .

	call DebugPrint('38.0-json.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
