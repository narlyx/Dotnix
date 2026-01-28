{ pkgs, ... }: {
    services.emacs.enable = true;
    programs.emacs = {
	enable = true;
	package = pkgs.emacs-gtk;
	extraPackages = epkgs: with epkgs; [
	    use-package
	    evil
	    good-scroll
	    nerd-icons
	    kanagawa-themes
	    doom-modeline
	];
	extraConfig = builtins.readFile ./init.el;
    };
}
