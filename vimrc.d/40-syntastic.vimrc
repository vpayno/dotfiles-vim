"
" ~/.vim/vimrc.d/40-syntastic.vimrc
"

call DebugPrint("40-syntastic.vimrc: start")

let g:syntastic_check_on_open = 1
let g:syntastic_lua_checkers = ["luac", "luacheck"]
let g:syntastic_lua_checkers = ["luacheck"]
let g:syntastic_lua_luacheck_args = "--no-unused-args"

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

let g:syntastic_python_checkers = ['pylint', 'pyflakes', 'python']

call DebugPrint("40-syntastic.vimrc: end")
