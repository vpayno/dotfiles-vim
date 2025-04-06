"
" vimrc.d/00.12-file_browsing.vimrc
"

call DebugPrint('00.12-file_browsing.vimrc: start')

" Search all subfolders when autocompleting file names.
set path+=**

set wildmenu

let g:netrw_banner = g:disable
let g:netrw_browse_split = 4  " 0=reuse, 1=split, 2=vsplit, 3=new, 4= previous
let g:netrw_altv = 1 " 0=left, 1=right
let g:netrw_liststyle = 3  " 0=thin, 1=long, 2=wide, 3=tree
"let g:netrw_list_hide = netrw_gitignore#Hide()
"let g:netrw_list_hide .= ',\(^\|\s\s\)\zs\.\S\+'
let g:netrw_dirhistmax = 25  " number of entries in ~/.vim/.netrwhist

" https://vi.stackexchange.com/questions/12586/exclude-some-paths-from-find-path
" let g:project_find_path = '.,' . system("git ls-tree -d HEAD --name-only | tr '\n' : | sed 's/:/**,/g'")
" autocmd VimEnter let &path = g:project_find_path
" autocmd BufReadPost * let &path = g:project_find_path

call DebugPrint('00.12-file_browsing.vimrc: end')

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
