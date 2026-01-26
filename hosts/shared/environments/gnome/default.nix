{ pkgs, ... }: {

	# Configuration
	services.displayManager.gdm.enable = true;
	services.desktopManager.gnome.enable = true;
	services.gnome.core-developer-tools.enable = false;
	services.gnome.games.enable = false;
	environment.gnome.excludePackages = with pkgs; [
		gnome-tour
		gnome-user-docs
		# baobab
		# decibels
		cheese
		# eog
		epiphany
		gedit
		# simple-scan
		# totem
		yelp
		evince
		geary
		seahorse
		papers
		snapshot
		gnome-calculator
		gnome-calendar
		gnome-clocks
		gnome-contacts
		gnome-font-viewer
		gnome-logs
		gnome-maps
		gnome-music
		gnome-photos
		gnome-weather
		gnome-terminal
		gnome-text-editor
		# gnome-disk-utility
		gnome-connections
	];

	# Other modules
	imports = [

		../../services/distrobox
		../../services/printing

	];

	# Services
	services.flatpak.enable = true;

	# Packages
	environment.systemPackages = with pkgs; [

		gnomeExtensions.blur-my-shell
		gnomeExtensions.appindicator
		gnomeExtensions.panel-corners
		gnomeExtensions.caffeine

		nextcloud-client

	];

}
