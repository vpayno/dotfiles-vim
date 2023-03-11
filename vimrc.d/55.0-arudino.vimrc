"
" ~/.vim/vimrc.d/55.0-arduino.vimrc
"
" https://github.com/stevearc/vim-arduino
" https://github.com/arduino/Arduino/blob/master/build/shared/manpage.adoc

if _enable_arduino
	call DebugPrint('55.0-arduino.vimrc: start')

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

	if _enable_airline
		augroup au_airline
			autocmd!
			autocmd BufNewFile,BufRead *.ino let g:airline_section_x='%{ArduinoStatusLineBasic()}'
			"autocmd BufNewFile,BufRead *.ino let g:airline_section_x='%{ArduinoStatusLineVerbose()}'
		augroup end
	else
		setl statusline=%!ArduinoStatusLineBasic()
		"setl statusline=%!ArduinoStatusLineVerbose()
	endif

	call DebugPrint('55.0-arduino.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:noet:ts=4:sw=4:ai:
