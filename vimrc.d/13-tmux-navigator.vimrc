"
" ~/.vim/vimrc.d/13-tmux-navigator.vimrc
"
" https://github.com/christoomey/vim-tmux-navigator
" https://gist.github.com/mislav/5189704

if _enable_tmux_navigator
	call DebugPrint("13-tmux-navigator.vimrc: start")

	" Load plugins.
	packadd! vim-tmux-navigator

    let g:tmux_navigator_no_mappings = 1

    " tmux.conf - start
    "   # Smart pane switching with awareness of Vim splits.
	"	# See: https://github.com/christoomey/vim-tmux-navigator
	"	is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
    "	    | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
	"	bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h'  'select-pane -L'
	"	bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j'  'select-pane -D'
	"	bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k'  'select-pane -U'
	"	bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l'  'select-pane -R'
	"	tmux_version='$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")'
	"	if-shell -b '[ "$(echo "$tmux_version < 3.0" | bc)" = 1 ]' \
    "		bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\'  'select-pane -l'"
	"	if-shell -b '[ "$(echo "$tmux_version >= 3.0" | bc)" = 1 ]' \
    "		bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\\\'  'select-pane -l'"

	"	bind-key -T copy-mode-vi 'C-h' select-pane -L
	"	bind-key -T copy-mode-vi 'C-j' select-pane -D
	"	bind-key -T copy-mode-vi 'C-k' select-pane -U
	"	bind-key -T copy-mode-vi 'C-l' select-pane -R
	"   bind-key -T copy-mode-vi 'C-\' select-pane -l

    "   bind -r C-h run "tmux select-pane -L"
    "   bind -r C-j run "tmux select-pane -D"
    "   bind -r C-k run "tmux select-pane -U"
    "   bind -r C-l run "tmux select-pane -R"
    "   bind -r C-\ run "tmux select-pane -l"
    " tmux.conf - end

    " Each instance of {Left-Mapping} or {Down-Mapping} must be replaced in
    " the above code with the desired mapping. Ie, the mapping for <ctrl-h> =>
    " Left would be created with nnoremap <silent> <c-h>
    " :TmuxNavigateLeft<cr>.
    " nnoremap <silent> {Left-Mapping} :TmuxNavigateLeft<cr>
    " nnoremap <silent> {Down-Mapping} :TmuxNavigateDown<cr>
    " nnoremap <silent> {Up-Mapping} :TmuxNavigateUp<cr>
    " nnoremap <silent> {Right-Mapping} :TmuxNavigateRight<cr>
    " nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

    " 1 -> :update (current buffer when dirty)
    " 2 -> :wall (write all buffers)
    let g:tmux_navigator_save_on_switch = 2

    " Disable tmux navigator when zooming the Vim pane.
    " let g:tmux_navigator_disable_when_zoomed = 1

    " If the tmux window is zoomed, keep it zoomed when moving from Vim to
    " another pane.
    " let g:tmux_navigator_preserve_zoom = 1

	call DebugPrint("13-tmux-navigator.vimrc: end")
endif
