{ pkgs, ... }:

{
  programs.zsh.enable = true;

  users.users.narlyx = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" "libvirtd" ];
    shell = pkgs.zsh;
  };
}
