"
" ~/.vim/vimrc.d/40.0-syntastic.vimrc
"

call DebugPrint('40.0-syntastic.vimrc: start')

let g:syntastic_check_on_open = 1

let g:syntastic_vim_checkers = ['vint']

let g:syntastic_lua_checkers = ['luac', 'luacheck']
let g:syntastic_lua_checkers = ['luacheck']
let g:syntastic_lua_luacheck_args = '--no-unused-args'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 1
map <leader>s :SyntasticCheck<CR>
map <leader>d :SyntasticReset<CR>
map <leader>e :lnext<CR>
map <leader>r :lprev<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" https://github.com/vim-syntastic/syntastic/blob/master/doc/syntastic-checkers.txt

let g:syntastic_python_checkers = ['pylint', 'pyflakes', 'python']

" let g:syntastic_ruby_checkers = ['ruby', 'flog', 'reek', 'rubocop', 'sorbet']
let g:syntastic_ruby_checkers = ['ruby', 'flog']

augroup au_syntastic
	autocmd!
	autocmd! BufWritePost *.rb | execute 'silent !rufo %' | :e
augroup end

call DebugPrint('40.0-syntastic.vimrc: end')

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
