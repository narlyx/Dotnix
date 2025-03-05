{pkgs, ...}: {
  # Dependencies
  home.packages = with pkgs; [
    xdragon
  ];

  # Configuring lf
  programs.lf = {
    enable = true;

    # Custom commands
    commands = {
      # Delete files recursively
      delete = ''%rm -r $fx'';
      delete-force = ''%rm -rf $fx'';

      # Create a new directory
      mkdir = ''
        ''${{
          printf "Directory Name: "
          read input
          mkdir $input
        }}
      '';

      # Create and open a new file
      mkfile = ''
        ''${{
          printf "File Name: "
          read input
          touch $input
        }}
      '';

      # Drag and drop
      drag = ''%${pkgs.xdragon}/bin/dragon -a -x $fx'';
    };

    # Custom keybindings
    keybindings = {
      # Removing defaults
      d = null;
      m = null;

      # Basic functions
      p = "paste";
      x = "cut";
      y = "copy";
      dd = "delete";
      dD = "delete-force";
      md = "mkdir";
      mf = "mkfile";
    };
  };
}
