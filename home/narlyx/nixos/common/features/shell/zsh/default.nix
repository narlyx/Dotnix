{pkgs, ...}: {
  home.packages = with pkgs; [
    zoxide
    eza
    bat
    fzf
    libnotify
  ];

  programs.zsh = {
    # Enabling zsh
    enable = true;

    # Plugins
    antidote = {
      enable = true;
      plugins = [
        "zsh-users/zsh-syntax-highlighting"
        "zsh-users/zsh-completions"
        "zsh-users/zsh-autosuggestions"
        "MichaelAquilina/zsh-auto-notify"
        "MichaelAquilina/zsh-you-should-use"
        "getantidote/use-omz"
        "ohmyzsh/ohmyzsh path:lib"
        "ohmyzsh/ohmyzsh path:plugins/git"
      ];
    };

    # Configuration
    initExtraFirst = ''
      eval "$(zoxide init zsh)"
    '';
    initExtra = ''

    '';

    # Aliases
    shellAliases = {
      "cls" = "clear";
      "cd" = "z";
      "l" = "eza --oneline --icons --git";
      "ls" = "eza --oneline --icons --git";
      "la" = "eza --oneline -ah --icons --git";
      "ll" = "eza -lah --icons --git";
      "tree" = "eza --tree --icons --ignore-glob='.git'";
      "cat" = "bat";
      "fzf" = "fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'";
    };

    # History
    history = {
      size = 5000;
      save = 5000;
      ignoreAllDups = true;
      ignoreDups = true;
      ignoreSpace = true;
      share = true;
      append = true;
    };
  };
}
