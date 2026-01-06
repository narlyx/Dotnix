{ pkgs, ... }: {

  imports = [
    ../apps/vim
    ../services/ssh
    ../services/tailscale
  ];

	environment.systemPackages = with pkgs; [
    #vim
		git
		tree
	];

}

