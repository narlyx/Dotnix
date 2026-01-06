{
	boot.loader.grub = {
		enable = true;
		efiSupport = true;
		efiInstallAsRemovable = true;
		device = "nodev";
	};
	boot.loader.efi.efiSysMountPoint = "/boot";
}
