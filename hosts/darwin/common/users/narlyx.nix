{pkgs, ...}: {
  users.users.narlyx = {
    home = "/Users/narlyx";
    shell = pkgs.zsh;
  };
  programs.zsh.enable = true;
  system.activationScripts.postActivation.text = ''sudo chsh -s ${pkgs.zsh}/bin/zsh narlyx'';
} 
