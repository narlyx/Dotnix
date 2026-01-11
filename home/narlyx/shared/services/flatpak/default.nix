{ config, pkgs, ... }: let
	grep = pkgs.gnugrep;
	desiredFlatpaks = [
	];
in {
  	home.activation.flatpakManagement = ''
		# Flathub
		${pkgs.flatpak}/bin/flatpak remote-add --if-not-exists flathub \
			https://flathub.org/repo/flathub.flatpakrepo

		# List of installed Flatpaks
		installedFlatpaks=$(${pkgs.flatpak}/bin/flatpak list --app --columns=application)

		# Removing old Flatpaks
		for installed in $installedFlatpaks; do
			if ! echo ${toString desiredFlatpaks} | ${grep}/bin/grep -q $installed; then
				echo "Removing $installed because it's not in the desiredFlatpaks list."
				${pkgs.flatpak}/bin/flatpak uninstall -y --noninteractive $installed
			fi
		done

		# Installing neded Flatpaks
		for app in ${toString desiredFlatpaks}; do
			echo "Ensuring $app is installed."
			${pkgs.flatpak}/bin/flatpak install -y flathub $app
		done

		# Remove unused Flatpaks
		${pkgs.flatpak}/bin/flatpak uninstall --unused -y

		# Update installed Flatpaks
		${pkgs.flatpak}/bin/flatpak update -y

	'';
}
