"
" ~/.vim/vimrc.d/08.0-utils.vimrc
"
" https://github.com/vim-scripts/ConvertBase.vim

if _enable_utils_baseconvert
    call DebugPrint('08.0-utils.vimrc: start [ConvertBase]')

    " Load plugins.
    packadd! ConvertBase.vim

    call DebugPrint('08.0-utils.vimrc: end [ConvertBase]')
endif
