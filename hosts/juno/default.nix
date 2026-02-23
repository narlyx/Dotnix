{
    imports = [
        ./hardware-configuration.nix
        ../../modules/users/narlyx
        ../../modules/environments/gnome
        ../../modules/bootloaders/grub
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
}

