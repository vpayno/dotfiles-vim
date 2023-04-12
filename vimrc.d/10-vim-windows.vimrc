"
" vimrc.d/10-vim-windows.vimrc
"

" https://vim.fandom.com/wiki/Fast_window_resizing_with_plus/minus_keys


" https://vi.stackexchange.com/questions/3725/swap-the-position-of-two-windows
" hts://vi.stackexchange.com/questions/3725/swap-the-position-of-two-windows

" This needs you to use the mouse cursor to select the two windows, leaving
" the cursor on the original window.

function! WinBufSwap()
  let thiswin = winnr()
  let thisbuf = bufnr('%')
  let lastwin = winnr('#')
  let lastbuf = winbufnr(lastwin)

  exec	lastwin . ' wincmd w' .'|'.
	  \ 'buffer '. thisbuf .'|'.
	  \ thiswin .' wincmd w' .'|'.
	  \ 'buffer '. lastbuf
endfunction

command! Wswap :call WinBufSwap()
map <Leader>bs <C-c>:call WinBufSwap()<CR>

function! SwitchWindow(count) abort
	let l:current_buf = winbufnr(0)
	exe 'buffer' . winbufnr(a:count)
	exe ':count' . 'wincmd w'
	exe 'buffer' . l:current_buf
	wincmd p
endfunction

nnoremap <C-w>x :<C-u>call SwitchWindow(v:count1)<CR>

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
