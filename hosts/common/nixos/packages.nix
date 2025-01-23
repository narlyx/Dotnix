{ pkgs, ... }:

{
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = true;
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git
  ];
}
