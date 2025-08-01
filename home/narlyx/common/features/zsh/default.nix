{pkgs, ...}: {
  home.packages = with pkgs; [
    eza
    bat
    fzf
  ];

  home.file.".zimrc".text = ''
    zmodule zsh-users/zsh-syntax-highlighting
    zmodule zsh-users/zsh-autosuggestions
    zmodule zsh-users/zsh-completions
    zmodule MichaelAquilina/zsh-auto-notify
    zmodule MichealAquilina/zsh-you-should-use
    zmodule ohmyzsh/ohmyzsh --root plugins/git
  '';

  programs.zsh = {
    enable = true;

    initContent = ''
      # Zim vars
      ZIM_CONFIG_FIEL=~/.zimrc
      ZIM_HOME=~/.zim

      # Downloading Zim if not present
      if [[ ! -e ''${ZIM_HOME}/zimfw.zsh ]]; then
        curl -fsSL --create-dirs -o ''${ZIM_HOME}/zimfw.zsh \
          https://github.com/zimfw/zimfw/release/latest/download/zimfw.zsh
      fi

      # Zim auto updates
      if [[ ! ''${ZIM_HOME}/init.zsh -nt ''${ZIM_CONFIG_FILE:-''${ZDOTDIR:-''${HOME}}/.zimrc} ]]; then
        source ''${ZIM_HOME}/zimfw.zsh init
      fi

      # Loading Zim modules
      source ''${ZIM_HOME}/init.zsh 
    '';

     history  = {
       size = 5000;
       save = 5000;
       ignoreAllDups = true;
       ignoreSpace = true;
       share = true;
       append = true;
     };

     shellAliases = {
       "reload-shell" = "source ~/.zshrc";
       "reload-system" = "sudo nixos-rebuild switch --flake ~/Dotnix";
       "reload-home" = "home-manager switch --flake ~/Dotnix -b bak";
       "cls" = "clear";
       "rd" = "rmdir";
       "l" = "eza --oneline --icons --git";
       "ls" = "eza --oneline --icons --git";
       "la" = "eza --oneline -ah --icons --git";
       "ll" = "eza -lah --icons --git";
       "tree" = "eza --tree --icons --ignore-glob='.git'";
       "cat" = "bat";
       "fzf" = "fzf --preview 'bat --color=always --sytle=numbers --line-rage:500 {}'";
    };
  };
}
