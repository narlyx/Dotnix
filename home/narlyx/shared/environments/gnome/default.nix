{ pkgs, ... }: {
	dconf = {
		enable = true;
		settings = {
			"org/gnome/shell" = {
				enabled-extensions = with pkgs.gnomeExtensions; [
					blur-my-shell.extensionUuid
					appindicator.extensionUuid
					panel-corners.extensionUuid
					caffeine.extensionUuid
					mpris-label.extensionUuid
				];
			};
			"org/gnome/desktop/interface" = {
				color-scheme = "prefer-dark";
				accent-color = "blue";
			};
			"org/gnome/desktop/input-sources" = {
				xkb-options = [ "esc:nocaps" ];
			};
		};
	};
}
