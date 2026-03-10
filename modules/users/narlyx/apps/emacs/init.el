;; NOTE: Packages/plugins are managed by Nix

;; ### EMACS CONFIG ###
;; General
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq make-backup-files nil)
(setq auto-save-list-file-prefix "~/.emacs.d/autosave/") ; hide autosave files somewhere else
(setq auto-save-file-name-transforms
      '((".*" "~/.emacs.d/autosave/" t)))
(setq ring-bell-function 'ignore) ; "shut up bird"
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode t)

;; Indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default standard-indent 4)

;; ### PLUGINS ###
;; Evil
(setq evil-want-C-i-jump nil) ; restore tab functionality
(require 'evil)
(evil-mode 1)

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
(require 'good-scroll)
(good-scroll-mode 1)

;; Cua bindings
(cua-mode -1)
(setq cua-enable-cursor-indications t)
(setq cua-auto-tabify-rectablges nil)
(setq cua-keep-region-after-copy t)

;; ### MODES ###
;; Org
(require 'org)

;; Nix
(require 'nix-mode)
(add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode))
(add-hook 'nix-mode-hook
          (lambda ()
            (setq-local indent-tabs-mode nil)    ;; Don't use tabs for indentation
            (setq-local tab-width 4)             ;; Set tab width to 4 spaces
            (setq-local standard-indent 4)))     ;; Set default indentation to 4 spaces
