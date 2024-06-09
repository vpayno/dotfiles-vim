"
" ~/.vim/vimrc.d/55.0-arduino.vimrc
"
" https://github.com/stevearc/vim-arduino
" https://github.com/arduino/Arduino/blob/master/build/shared/manpage.adoc

if _enable_arduino
    call DebugPrint('55.0-arduino.vimrc: start')

    function! ConfigureFileTypeArduino()
        " Load plugins.
        packadd! vim-arduino

        " Key bindings
        "nnoremap <buffer> <leader>am :ArduinoVerify<CR>
        "nnoremap <buffer> <leader>au :ArduinoUpload<CR>
        "nnoremap <buffer> <leader>ad :ArduinoUploadAndSerial<CR>
        "nnoremap <buffer> <leader>ab :ArduinoChooseBoard<CR>
        "nnoremap <buffer> <leader>ap :ArduinoChooseProgrammer<CR>

        " :ArduinoChooseBoard - Select the type of board from a list.
        " :ArduinoChooseProgrammer - Select the programmer from a list.
        " :ArduinoChoosePort - Select the serial port from a list.
        " :ArduinoVerify - Build the sketch.
        " :ArduinoUpload - Build and upload the sketch.
        " :ArduinoSerial - Connect to the board for debugging over a serial port.
        " :ArduinoUploadAndSerial - Build, upload, and connect for debugging.
        " :ArduinoInfo - Display internal information. Useful for debugging issues with vim-arduino.

        let g:arduino_use_slime = 1

        let g:lsc_enable_autocomplete = g:enable
        let g:lsc_server_commands = {'arduino': $HOME . '/.vim/scripts/arduino-language-server'}
        let g:lsc_auto_map = v:true

        let g:LanguageClient_serverCommands = {
            \ 'arduino': [$HOME . '/.vim/scripts/arduino-language-server']
            \ }

        call ale#linter#Define('arduino', {
            \   'name': 'arduino-language-server',
            \   'lsp': 'stdio',
            \   'executable': $HOME . '/.vim/scripts/arduino-language-server',
            \   'command': '%e',
            \   'project_root': $PWD,
            \ })

        augroup au_arduino_lsp
            autocmd! User lsp_setup call lsp#register_server({
                \ 'name': 'arduino-language-server',
                \ 'cmd': {server_info->[$HOME . '/.vim/scripts/arduino-language-server']},
                \ 'whitelist': ['arduino'],
                \ })
        augroup end

        augroup au_arduino_fmt
            autocmd! BufWritePre *.ino | call KeepView('silent %!' . $HOME . '/.vim/scripts/arduino-fmt')
        augroup end

        if g:_enable_ale_arduino_fixers
            let g:ale_fixers.arduino = ['clang-format']
        else
            let g:ale_fixers.arduino = []
        endif

        if g:_enable_ale_arduino_linters
            let g:ale_linters.arduino = ['arduino-language-server']
        else
            let g:ale_linters.arduino = []
        endif

        if g:_enable_airline
            augroup au_airline
                autocmd!
                autocmd BufNewFile,BufRead *.ino let g:airline_section_x='%{ArduinoStatusLineBasic()}'
                "autocmd BufNewFile,BufRead *.ino let g:airline_section_x='%{ArduinoStatusLineVerbose()}'
            augroup end
        else
            setl statusline=%!ArduinoStatusLineBasic()
            "setl statusline=%!ArduinoStatusLineVerbose()
        endif
    endfunction

    " my_file.ino [arduino:avr:uno]
    function! ArduinoStatusLineBasic()
        return '%f [' . g:arduino_board . ']'
    endfunction

    " my_file.ino [arduino:avr:uno] [arduino:usbtinyisp] (/dev/ttyACM0:9600)
    function! ArduinoStatusLineVerbose()
        let port = arduino#GetPort()
        let line = '%f [' . g:arduino_board . '] [' . g:arduino_programmer .  ']'

        if !empty(port)
            let line = line . ' (' . port . ':' . g:arduino_serial_baud .  ')'
        endif

        return line
    endfunction

    augroup ag_arduino_setup
        autocmd!
        autocmd BufEnter,BufRead,FileType * if &filetype==#'arduino' | call ConfigureFileTypeArduino() | endif
    augroup end

    augroup au_arduino_ft_set
        autocmd!
        autocmd BufNewFile,BufRead *.ino set filetype=arduino
    augroup end

    call DebugPrint('55.0-arduino.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
