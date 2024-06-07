"
" ~/.vim/vimrc.d/45.0-rust.vimrc
"

" https://github.com/racer-rust/vim-racer.git
" https://github.com/racer-rust/racer
" https://github.com/rust-lang/rust.vim
" https://github.com/Canop/nvim-bacon

" https://github.com/fannheyward/coc-rust-analyzer
" :CocInstall coc-rust-analyzer

if _enable_rust
    call DebugPrint('45.0-rust.vimrc: start')

    function! ConfigureFileTypeRust()
        if g:_enable_rust_bacon
            if has('nvim')
                packadd! nvim-bacon

                " add 'export_locations = true' to 'bacon.prefs'

                nnoremap ! :BaconLoad<CR>:w<CR>:BaconNext<CR>
                nnoremap , :BaconList<CR>
            endif
        endif

        if g:_enable_ale_rust

            let g:ale_rust_analyzer_executable = 'rust-analyzer'
            " let g:ale_rust_analyzer_config = {}

            let g:ale_rust_cargo_use_check = v:true
            let g:ale_rust_cargo_check_all_targets = v:false
            let g:ale_rust_cargo_check_tests = v:true
            let g:ale_rust_cargo_check_examples = v:true
            let g:ale_rust_cargo_default_feature_behavior = 'all'
            " let g:ale_rust_cargo_include_features = ''
            let g:ale_rust_cargo_avoid_whole_workspace = v:true

            let g:ale_rust_cargo_use_clippy = g:enable
            " let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')
            " let g:ale_rust_cargo_clippy_options = '--all-features --future-incompat-report'

            let g:ale_rust_cargo_use_check = g:enable
            let g:ale_rust_cargo_check_tests = g:enable
            let g:ale_rust_cargo_check_examples = g:enable
            " let g:ale_rust_cargo_default_feature_behavior = 'all'

            " let g:ale_rust_cargo_target_dir = ''

            if g:_enable_ale_rust_fixers
                let g:ale_fixers.rust = ['rustfmt']
            else
                let g:ale_fixers.rust = []
            endif

            if g:_enable_ale_rust_linters
                let g:ale_linters.rust = ['analyzer', 'cargo']
            else
                let g:ale_linters.rust = []
            endif

        elseif g:_enable_rust_coc
            " highlight CocFloating ctermbg=grey

            inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

            nnoremap <silent> K :call ShowDocumentation()<CR>

            function! ShowDocumentation()
                if CocAction('hasProvider', 'hover')
                    call CocActionAsync('doHover')
                else
                    call feedkeys('K', 'in')
                endif
            endfunction

            nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
            nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
            inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
            inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
            vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
            vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

        else

            if g:_enable_rust_rustvim
                packadd! rust.vim

                " rust.vim options
                let g:rustfmt_autosave = g:enable
                let g:rust_cargo_check_benches = g:disable
                let g:rust_fold = g:enable
                let g:rust_bang_comment_leader = g:enable

                if g:_enable_ale
                    " https://github.com/dense-analysis/ale/blob/master/doc/ale-rust.txt
                    let g:ale_rust_cargo_use_check = g:enable
                    let g:ale_rust_cargo_check_tests = g:enable
                    let g:ale_rust_cargo_check_examples = g:enable
                    let g:ale_rust_cargo_default_feature_behavior = 'all'

                    " let g:ale_rust_cargo_use_clippy = v:true
                    " let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')

                    if g:_enable_ale_rust_fixers
                        let g:ale_fixers.rust = ['rustfmt']
                    else
                        let g:ale_fixers.rust = []
                    endif

                    if g:_enable_ale_rust_linters
                        let g:ale_linters.rust = ['rustc']
                    else
                        let g:ale_linters.rust = []
                    endif

                    let g:ale_linters_ignore.rust = []
                endif

                " Send clipboard to rust playpen.
                if has('macunix')
                    let g:rust_clip_command = 'pbcopy'
                else
                    let g:rust_clip_command = 'xclip -selection clipboard'
                endif

            elseif g:_enable_rust_vimracer
                packadd! vim-racer

                set hidden
                let g:racer_cmd = '/home/vpayno/.cargo/bin/racer'
                let g:racer_experimental_completer = 1  " shoe the complete function definition
                let g:racer_insert_paren = 1    " insert parenthesis in the completion

                augroup Racer
                    autocmd!
                    autocmd FileType rust nmap <buffer> gd         <Plug>(rust-def)
                    autocmd FileType rust nmap <buffer> gs         <Plug>(rust-def-split)
                    autocmd FileType rust nmap <buffer> gx         <Plug>(rust-def-vertical)
                    autocmd FileType rust nmap <buffer> gt         <Plug>(rust-def-tab)
                    autocmd FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)
                augroup END

            else
                augroup ag_rust_rustfmt
                    autocmd!
                    autocmd! BufWritePost * if &filetype==#'rust' | RustFmt | :e | endif
                augroup end

                packadd! tagbar

                " https://alpha2phi.medium.com/setting-up-neovim-for-rust-debugging-termdebug-and-vimspector-df749e1ba47c
                " termdebugger is included with vim >=8.1
                packadd! termdebug
                let termdebugger='rust-gdb'

            endif
        endif
    endfunction

    augroup ag_rust_setup
        autocmd!
        autocmd BufEnter,BufRead,FileType * if &filetype==#'rust' | call ConfigureFileTypeRust() | endif
    augroup end

    augroup au_rust_ft_set
        autocmd!
        autocmd BufNewFile,BufRead *.rs set filetype=rust
    augroup end

    call DebugPrint('45.0-rust.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
