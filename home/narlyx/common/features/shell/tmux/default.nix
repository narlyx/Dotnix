{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    extraConfig = ''
      # True color
      set -g default-terminal "tmux-256color"
      set -ag terminal-overrides ",xterm-256color:RGB"

      # Turn on Xterm Keys for modifier keys pass through
      set -s extended-keys on
      set-option -g xterm-keys on
      set -as terminal-features 'xterm*:extkeys'
      # Allow-passthrough for advanced features
      set-option -g allow-passthrough on

      # Changing prefix
      unbind C-b
      set -g prefix C-Space
      bind C-Space send-prefix

      # Reload config
      bind R source-file ~/.config/tmux/tmux.conf \; display-message -p "\nTMUX environment reloaded.\n\nDone, press ESCAPE to continue."

      # Enabling mouse
      set -g mouse on

      # Window indexing and names
      set -g base-index 1
      setw -g pane-base-index 1
      set -g renumber-windows on
      set-option -g allow-rename off

      # Window resizing
      set-option -w -g aggressive-resize on

      # Creating new session
      bind S command-prompt -p "New Session:" "new-session -A -s '%%'"

      # Open new panes with current directory
      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"

      # Copy and paste
      setw -g mode-keys vi
      set -s copy-command 'wl-copy'
      bind P paste-buffer
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi V send-keys -X rectangle-toggle
      unbind -T copy-mode-vi Enter
      bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'wl-copy'
      bind-key -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel 'wl-copy'
      bind-key -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel 'wl-copy'

      # Look and feel
      set -g status-position bottom
      #set -g status-justify "absolute-centre"
      set -g status-justify "left"
      set -g status-interval 1
      set -g status-left-length 0
      set -g status-left '#[bg=#414559]  #S #[bg=default] '
      set -g status-right '#[bg=#414559]  %H:%M:%S #[bg=default] '

      set -g window-status-format "#[bg=#838ba7]#[fg=#232634]  #I #[bg=#414559]#[fg=#c6d0f5] #W "
      set -g window-status-current-format "#[bg=#8caaee]#[fg=#232634]  #I #[bg=#414559]#[fg=#c6d0f5] #W "

      set -g status-fg "#c6d0f5"
      set -g status-bg "#303446"

      set -g pane-active-border-style "fg=#8caaee"
      set -g pane-border-style "fg=#303446"

      # Plugins
      run-shell ${pkgs.tmuxPlugins.vim-tmux-navigator}/share/tmux-plugins/vim-tmux-navigator/vim-tmux-navigator.tmux
    '';
  };
}
