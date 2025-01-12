{ config, lib, pkgs, ... }:

{
  # Enabling tmux
  programs.tmux = {
    enable = true;
    extraConfig = ''
      ${builtins.readFile ../../dotfiles/tmux/tmux.conf}
      run-shell ${pkgs.tmuxPlugins.vim-tmux-navigator}/share/tmux-plugins/vim-tmux-navigator/vim-tmux-navigator.tmux
    '';
  };
}
