{pkgs, ...}: {
  imports = [
    ../common/base
    ../common/bundles/shell.nix
    ../common/bundles/code.nix
    ../common/bundles/creative-3d.nix
    ../common/environments/i3

    ../common/features/wezterm
    ../common/features/ghostty
    ../common/features/syncthing
  ];

  home.packages = with pkgs; [
    brave
    firefox
    spotify
    vesktop
    obsidian

    strawberry
    spotdl
    yt-dlp
    ffmpeg
    rockbox-utility
  ];
}
