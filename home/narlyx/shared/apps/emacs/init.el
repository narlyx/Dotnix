;; Packages are managed by nix

;; General configurations
(setq make-backup-files nil) ; stop creating ~ files
(setq ring-bell-function 'ignore) ; "shut up bird"

;; Gui configurations
(load-theme 'kanagawa-wave t) ; theme
(setq inhibit-splash-screen t) ; remove splash screen
(menu-bar-mode -1) ; hide menubar
(tool-bar-mode -1) ; hide toolbar
(scroll-bar-mode -1) ; hide scrollbar
(global-display-line-numbers-mode t) ; line numbers

;; Icons
(require 'nerd-icons)

;; Doom modeline
(require `doom-modeline)
(doom-modeline-mode 1)
(setq doom-modeline-height 35)
(setq doom-modeline-buffer-file-name-style 'auto)

;; Cua bindings
(cua-mode t)
(setq cua-enable-cursor-indications t)
(setq cua-auto-tabify-rectangles nil)
(setq cua-keep-region-after-copy t)

;; Org mode
(require 'org)

;; Evil bindings
(setq evil-want-C-i-jump nil) ; restore tab functionality within evil
(require 'evil)
(evil-mode 1)
