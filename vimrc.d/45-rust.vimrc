"
" ~/.vim/vimrc.d/45-rust.vimrc
"

" https://github.com/racer-rust/vim-racer.git
" https://github.com/racer-rust/racer
" https://github.com/rust-lang/rust.vim

call DebugPrint("45-rust.vimrc: start")

" Automatically run rustfmt when saving a buffer.
let g:rustfmt_autosave = 1

" Send clipboard to rust playpen.
" let g:rust_clip_command = 'xclip -selection clipboard'

set hidden
let g:racer_cmd = "/home/vpayno/.cargo/bin/racer"
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

call DebugPrint("45-rust.vimrc: end")
