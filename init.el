
;; do this first so it's not wierd
;; when the gui elements disappear
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; tell use package to always just install packages
;; this makes it like Vim's managers (plugged and friends)
(setq use-package-always-ensure t)

(use-package no-littering)
(use-package use-package-chords
  :config (key-chord-mode 1))
(use-package evil
  :config (evil-mode 1))
(use-package evil-mc
  :config
  (global-evil-mc-mode 1))

(use-package helm
  :bind ("M-x" . helm-M-x)
  :config (helm-mode 1))

(use-package helm-projectile)
(use-package helm-descbinds
  :config (helm-descbinds-mode))
(use-package which-key
  :config (which-key-mode))
(use-package company
  :config
  (global-company-mode)
  (company-tng-configure-default)
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 2))
(use-package company-irony
  :after company
  :config (add-to-list 'company-backends 'company-irony))
(use-package company-irony-c-headers
  :after company
  :config (add-to-list 'company-backends 'company-irony-c-headers))
(use-package company-c-headers
  :config (add-to-list 'company-backends 'company-c-headers))
(use-package company-quickhelp
  :after company
  :config (company-quickhelp-mode 1))
(use-package helm-company
  :bind (:map company-mode-map
	 ("S-SPC" . helm-company)
	 :map company-active-map
	 ("S-SPC" . helm-company)))
(use-package company-math
  :config
  (add-to-list 'company-backends 'company-math-symbols-unicode)
  (add-to-list 'company-backends 'company-math-symbols-latex))
(use-package flycheck)
(use-package meson-mode)
(use-package irony
  :hook ((c++-mode . irony-mode)
	 (c-mode . irony-mode)
	 (irony-mode . irony-cdb-autosetup-compile-options)))
(use-package nim-mode
  :hook (nim-mode-hook . nimsuggest-mode))
(use-package paradox)
(use-package esup)
(use-package projectile)
(use-package treemacs
  :chords
  ("\\]" . treemacs-toggle)
  ("\\\\" . treemacs))

(use-package treemacs-evil)
(use-package treemacs-projectile)
(use-package magit)
(use-package ace-window
  :chords ("pp" . ace-window))
(use-package dashboard
  :config (dashboard-setup-startup-hook))
(use-package mode-icons
  :config (mode-icons-mode))
(use-package tabbar-ruler)
(use-package telephone-line
  :config
  (require 'telephone-line-config)
  (telephone-line-evil-config))
(use-package systemd)
(use-package helm-systemd)
(use-package flx)
(use-package helm-flx
  :config (helm-flx-mode +1))
(use-package company-flx
  :config (company-flx-mode +1))
(use-package doom-themes
  :config
  (doom-themes-visual-bell-config)
  (doom-themes-org-config))


(key-chord-define-global ";k" 'kill-buffer)
(key-chord-define-global ";j" 'switch-to-buffer)

