"
" vimrc.d/47.0-perl.vimrc
"
" https://perlmonks.org/?node_id=540167
" :LspInstallServer

if _enable_perl5 || _enable_perl6
    call DebugPrint('47.0-perl.vimrc: start')

    function! ConfigureFileTypePerl()
        " check perl code with :make
        augroup au_perl
            autocmd!
            autocmd FileType perl set makeprg=perl\ -c\ %\ $*
            autocmd FileType perl set errorformat=%f:%l:%m
            autocmd FileType perl set autowrite
        augroup end

        " comment/uncomment blocks of code (in vmode)
        vmap _c :s/^/#/gi<Enter>
        vmap _C :s/^#//gi<Enter>

        " my perl includes pod
        let perl_include_pod = 1

        " syntax color complex things like @{${"foo"}}
        let perl_extended_vars = 1

        " Tidy selected lines (or entire file) with _t:
        nnoremap <silent> _t :%!perltidy -q<Enter>
        vnoremap <silent> _t :!perltidy -q<Enter>

        " Deparse obfuscated code
        nnoremap <silent> _d :.!perl -MO=Deparse 2>/dev/null<cr>
        vnoremap <silent> _d :!perl -MO=Deparse 2>/dev/null<cr>

        if g:_enable_perl5
            call DebugPrint('47.0-perl.vimrc: start [Perl 5]')

            if !empty(glob('~/.vim/pack/upstream/opt/vim-perl/after/syntax/perl/*vim'))
                " pack/upstream/opt/vim-perl (dev %=)
                " $ ls after/syntax/perl/
                " carp.vim  dancer.vim  highlight-all-pragmas.vim  moose.vim test-more.vim  try-tiny.vim

                call system('cd pack/upstream/opt/vim-perl && make clean carp dancer highlight-all-pragmas moose test-more try-tiny; cd -')
            endif

            packadd! vim-perl

            call DebugPrint('47.0-perl.vimrc: end [Perl 5]')
        endif

        if g:_enable_perl6
            call DebugPrint('47.0-perl.vimrc: start [Perl 6]')

            packadd! vim-raku

            " convert ASCII based operators to their Unicode equivalents on the fly
            let g:raku_unicode_abbrevs = 1

            call DebugPrint('47.0-perl.vimrc: end [Perl 6]')
        endif
    endfunction

    augroup ag_perl_setup
        autocmd!
        autocmd BufEnter,BufRead,FileType * if &filetype==#'perl' | call ConfigureFileTypePerl() | endif
    augroup end

    augroup au_perl_ft_set
        autocmd!
        autocmd BufNewFile,BufRead *.pl set filetype=perl
    augroup end

    call DebugPrint('47.0-perl.vimrc: end')
endif

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
