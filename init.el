(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

(set-frame-font "<font-name> <font-size>" nil t)

(global-display-line-numbers-mode)
(setq inhibit-startup-message t)
(setq-default major-mode 'text-mode)
(windmove-default-keybindings)
(setq make-backup-files nil)
(blink-cursor-mode -1)
(pixel-scroll-mode 1)

(setq viper-mode -1)
(require 'viper)
(keymap-global-set "M-p" 'viper-scroll-down)
(keymap-global-set "M-n" 'viper-scroll-up)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(require 'smartparens-config)
(smartparens-global-mode)

(require 'move-text)
(move-text-default-bindings)

(require 'tree-sitter)
(require 'tree-sitter-langs)
(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(tron-legacy))
 '(custom-safe-themes
   '("821c37a78c8ddf7d0e70f0a7ca44d96255da54e613aa82ff861fe5942d3f1efc" "18d1131ad6ff8e8e34287d6de9299faba4f1b03874278463fb6f38e3abe65bdc" "7c5182027c75624182f005b17ca82bd729bcd72dd0e87cf2029cbeb85083889d" default))
 '(package-selected-packages
   '(move-text tron-legacy-theme org-contrib org-modern elixir-mode smartparens yasnippet lsp-mode rust-mode naysayer-theme zig-mode tree-sitter-langs tree-sitter autothemer)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
