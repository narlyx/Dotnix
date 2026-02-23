{ pkgs, ... }: {
    services.emacs = {
        enable = true;
        defaultEditor = true;
    };
    programs.emacs = {
        enable = true;
        package = pkgs.emacs;
        extraPackages = epkgs: with epkgs; [

            # Backend
            use-package
            evil
            good-scroll
            nerd-icons
            kanagawa-themes
            doom-modeline

            # Languages
            nix-mode
        ];
        extraConfig = builtins.readFile ./init.el;
    };
}
