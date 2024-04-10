"
" ~/.vim/vimrc.d/49.0-java.vimrc
"

call DebugPrint('49.0-java.vimrc: start')

if g:_enable_ale_java
    let g:ale_java_checkstyle_config = '.google_checks.xml'
    let g:ale_java_checkstyle_executable = 'checkstyle'
    let g:ale_java_checkstyle_options = ''

    " let g:ale_java_javalsp_executable = ''
    " let g:ale_java_javalsp_config = {}

    let g:ale_java_google_java_format_executable = $HOME . '.vim/scripts/google-java-format'
    " let g:ale_java_google_java_format_options = ''

    " let g:ale_linters.java = ['checkstyle', 'cspell', 'eclipselsp', 'javac', 'javalsp', 'pmd']
    let g:ale_linters.java = ['checkstyle', 'javac', 'javalsp', 'pmd']

    " let g:ale_fixers.java = ['clang-format', 'google_java_format']
    let g:ale_fixers.java = ['clang-format']

    let g:ale_java_pmd_options = '-R category/java/bestpractices.xml'
endif

call DebugPrint('49.0-java.vimrc: end')

" vim:filetype=vim:syntax=vim:et:ts=4:sw=4:ai:
