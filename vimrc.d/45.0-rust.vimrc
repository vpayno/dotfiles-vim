"
" ~/.vim/vimrc.d/45.0-rust.vimrc
"

" https://github.com/racer-rust/vim-racer.git
" https://github.com/racer-rust/racer
" https://github.com/rust-lang/rust.vim

call DebugPrint('45.0-rust.vimrc: start')

" Automatically run rustfmt when saving a buffer.
let g:rustfmt_autosave = 1

" Send clipboard to rust playpen.
" let g:rust_clip_command = 'xclip -selection clipboard'

set hidden
let g:racer_cmd = '/home/vpayno/.cargo/bin/racer'
let g:racer_experimental_completer = 1  " shoe the complete function definition
let g:racer_insert_paren = 1  " insert parenthesis in the completion

augroup Racer
	autocmd!
	autocmd FileType rust nmap <buffer> gd         <Plug>(rust-def)
	autocmd FileType rust nmap <buffer> gs         <Plug>(rust-def-split)
	autocmd FileType rust nmap <buffer> gx         <Plug>(rust-def-vertical)
	autocmd FileType rust nmap <buffer> gt         <Plug>(rust-def-tab)
	autocmd FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)
augroup END

packadd! tagbar

" https://alpha2phi.medium.com/setting-up-neovim-for-rust-debugging-termdebug-and-vimspector-df749e1ba47c
" termdebugger is included with vim >=8.1
packadd! termdebug
let termdebugger='rust-gdb'

call DebugPrint('45.0-rust.vimrc: end')

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
