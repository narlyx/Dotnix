{ pkgs, ... }: {
	programs.ghostty = {
		enable = true;
		settings = {
			theme = "Catppuccin Frappe";
			background-opacity = 0.9;
			background-blur-radius = 20;
			font-family = "Fira Code";
			font-size = 11;
			cursor-style = "bar";
			cursor-opacity = 0.75;
			gtk-titlebar = true;
			macos-option-as-alt = true;
			mouse-hide-while-typing = true;
			confirm-close-surface = false;
			window-decoration = "server";
			window-padding-x = 10;
			window-padding-y = 10;
			window-padding-balance = true;
			auto-update = "check";
			auto-update-channel = "stable";
			#shell-integration-features = "ssh-terminfo,ssh-env";
			shell-integration-features = "ssh-env";
		};
	};
}
