{ pkgs, ... }: {
	programs.zsh.enable = true;
	users.users.narlyx = {
		isNormalUser = true;
		initialPassword = "changeme";
		shell = pkgs.zsh;
		extraGroups = [
			"wheel"
			"audio"
			"video"
			"input"
			"render"
			"networkmanager"
			"libvirtd"
			"docker"
		];
		openssh.authorizedKeys.keys = [ ''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMXDO/fJLr/4xeoZyTzbDSOLkP3LOEvu/gSRmNRJg9wD'' ];
	};
}
