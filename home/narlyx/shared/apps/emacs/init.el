;; Packages are managed by nix

;; Remove popups
(setq inhibit-splash-screen t) ; remove splash screen
(setq inhibit-startup-message t) ; remove startup screen

;; General configurations
(setq make-backup-files nil) ; stop creating backup files
(setq auto-save-list-file-prefix "~/.emacs.d/autosave/") ; hide autosave files
(setq auto-save-file-name-transforms
      '((".*" "~/.emacs.d/autosave/" t)))
(setq ring-bell-function 'ignore) ; "shut up bird"

;; Tabs
(setq tab-stop-list (number-sequence 4 200 4))
(setq tab-width 4)
(setq indent-line-function 'insert-tab) 
(setq indent-tabs-mode t
	tab-width 4)

;; Gui configurations
(menu-bar-mode -1) ; hide menubar
(tool-bar-mode -1) ; hide toolbar
(scroll-bar-mode -1) ; hide scrollbar
(global-display-line-numbers-mode t) ; line numbers

;; Icons
(require 'nerd-icons)

;; Theme
(load-theme 'kanagawa-wave t)

;; Doom modeline
(require 'doom-modeline)
(doom-modeline-mode 1)
(setq doom-modeline-height 35)
(setq doom-modeline-buffer-file-name-style 'auto)

;; Good scrolling
(require `good-scroll)
(good-scroll-mode 1)

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
(define-key evil-insert-state-map (kbd "TAB") 'tab-to-tab-stop)
