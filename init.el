;;;; emacs init file

;;; set global defaults

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(prefer-coding-system 'utf-8)

(setq inhibit-splash-screen t)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(when (file-exists-p custom-file)
  (load custom-file))

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

;;; evil

(use-package evil
  :ensure t
  :demand t
  :config (evil-mode 1))

;;; completion

(use-package company
  :ensure t)


