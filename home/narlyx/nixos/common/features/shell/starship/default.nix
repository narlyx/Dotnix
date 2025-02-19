{lib, ...}: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      # New line before each prompt
      add_newline = true;

      # Custom format
      format = lib.concatStrings [
        "[╭─](bold white)$os$shell$directory$git_status\n"
        "[╰─](bold white)$character"
      ];

      # Prompt character
      character = {
        success_symbol = "[~#@](bold white)";
        error_symbol = "[~#@](bold red)";
      };

      # Directory
      directory = {
        format = "[$path]($style) [$read_only]($read_only_style)";
        read_only = " ";
        style = "bold blue";
        read_only_style = "bold red";
      };

      # Shell labels
      shell = {
        disabled = false;
        style = "bold purple";
        zsh_indicator = "zsh";
        nu_indicator = "nu";
        unknown_indicator = "???";
      };

      # Operating system icons
      os = {
        disabled = false;
        format = "[$symbol](bold white)";
        symbols = {
          NixOS = " ";
          Macos = " ";
          Unknown = " ";
        };
      };

      # Git status
      git_status = {
        format = "([ \\[$all_status$ahead_behind\\]]($style) )";
        style = "bold cyan";
      };
    };
  };
}
