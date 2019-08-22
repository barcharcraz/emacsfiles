;;;; emacs init file

;;; set global defaults

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(prefer-coding-system 'utf-8)

(setq exec-path (append '("c:/cygwin64/bin") exec-path))
(setq inhibit-splash-screen t)
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(add-hook 'org-mode-hook
	  (lambda () (add-hook 'completion-at-point-functions 'pcomplete-completions-at-point nil t)))
				     
(when (file-exists-p custom-file)
  (load custom-file))
;(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
;;; set up package.el
(setq package-enable-at-startup nil)
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("org" . "https://orgmode.org/elpa/") t)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package use-package
  :ensure t
  :config
  (setq use-package-always-defer t))

;;; other

(use-package magit
  :ensure t
  :defer t)

(use-package tabbar
  :ensure t
  :demand t
  :config (tabbar-mode))

;(use-package which-key
;  :ensure t
;  :demand t
;  :config (which-key-mode))

(use-package general
  :demand t
  :ensure t)


;;; evil

(use-package evil
  :ensure t
  :init (setq evil-want-keybinding nil)
  :demand t
  :config (evil-mode 1))

(use-package evil-collection
  :ensure t
  :requires evil
  :demand t
  :config
  (evil-collection-init))

(use-package treemacs-evil
  :ensure t
  :demand t
  :after treemacs)
;;; completion

(use-package company
  :ensure t
  :general
  ("C-<SPC>" 'company-complete)
  :config
  (global-company-mode))

;;; interface

(use-package treemacs
  :ensure t
  :defer t
  :general
  ("<f8>" 'treemacs))

(use-package treemacs-projectile
  :ensure t
  :demand t
  :after projectile)

(use-package projectile
  :ensure t
  :demand t
  :config
  ;(setq projectile-git-submodule-command "git submodule --quiet foreach \"echo -en $path\"\\\x0\"\"")
  (setq projectile-indexing-method 'alien)
  (projectile-mode))

;;; general programming

(use-package rainbow-delimiters
  :ensure t
  :defer t
  :hook (racket-mode . rainbow-delimiters-mode))

(use-package lsp-mode
  :ensure t
  :defer t)

(use-package yasnippet
  :ensure t
  :defer t)

(use-package flycheck
  :ensure t
  :defer t)


;;; utils

(use-package esup
  :ensure t
  :defer t)

(use-package ag
  :ensure t
  :defer t
  :config
  (setq ag-executable (executable-find "ag")))


(use-package editorconfig
  :ensure t
  :demand t
  :config
  (editorconfig-mode))

;;; specific language modes

;;; racket

(use-package racket-mode
  :ensure t
  :defer t)

;;; python

(use-package elpy
  :ensure t
  :defer t)


;; cmake

(use-package cmake-mode
  :ensure t
  :defer t)

(use-package cmake-font-lock
  :ensure t
  :defer t
  :after (cmake-mode))

(use-package cmake-ide
  :ensure t
  :defer t
  :after (cmake-mode rtags))

;;; json
(use-package json-mode
  :ensure t
  :defer t)

;;; c++
(use-package clang-format
  :ensure t
  :defer t
  :general
  (:keymaps 'c-mode-base-map
	    "C-<tab>" 'clang-format-region))
(use-package rtags
  :ensure t
  :defer t)

