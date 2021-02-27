"
" ~/.vim/vimrc.d/06-securemodelines.vimrc
"

" https://www.vim.org/scripts/script.php?script_id=1876

let g:secure_modelines_allowed_items = [
	\ "textwidth",   "tw",
	\ "softtabstop", "sts",
	\ "tabstop",     "ts",
	\ "shiftwidth",  "sw",
	\ "expandtab",   "et",   "noexpandtab", "noet",
	\ "filetype",    "ft",
	\ "foldmethod",  "fdm",
	\ "readonly",    "ro",   "noreadonly", "noro",
	\ "rightleft",   "rl",   "norightleft", "norl"
\ ]

" Set to true to warn when a modeline attempts to set any other option.
let g:secure_modelines_verbose = 0

" Number of lines to check. Defaults to 5.
let g:secure_modelines_modelines = 5

" If defined &modeline will not be unset.
" let g:secure_modelines_leave_modeline = 1
