{ inputs, pkgs, ... }: {
    imports = [
        ./hardware-configuration.nix
        ../../modules/users/narlyx
        ../../modules/environments/gnome
        ../../modules/bootloaders/grub
        ../../modules/roles/virtualization
        ../../modules/roles/ai
        ../../modules/roles/containers
        inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t480
    ];

    boot.loader.grub.extraEntries = ''
        menuentry "Kali Linux" --class kali {
            set isofile="/kali.iso"
            search --no-floppy --file --set=root $isofile
            loopback loop $isofile
            linux (loop)/live/vmlinuz boot=live findiso=$isofile toram noswap kali-forensic-mode quiet splash
            initrd (loop)/live/initrd.img
        }
    '';

    home-manager.users.narlyx.home.packages = with pkgs; [
        spotdl
        strawberry
        virtualbox
    ];
}

