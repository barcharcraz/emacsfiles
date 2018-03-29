
;; do this first so it's not wierd
;; when the gui elements disappear

;;; Code:
; (menu-bar-mode -1)
; (tool-bar-mode -1)
; (toggle-scroll-bar -1)

(let ((bootstrap-file (concat user-emacs-directory "straight/bootstrap.el"))
      (bootstrap-version 2))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))


(straight-use-package 'use-package)

;; tell use package to always just install packages
;; this makes it like Vim's managers (plugged and friends)
(setq straight-use-package-by-default t)

(use-package gnome-emacs-utils
  :straight (gnome-emacs-utils
	     :type git
	     :host github
	     :repo "federicomenaquintero/gnome-emacs-utils"))

(use-package lice)
(use-package no-littering)
(use-package use-package-chords
  :config (key-chord-mode 1))
(use-package yasnippet)

(use-package rainbow-delimiters
  :hook
  (c-mode . rainbow-delimiters-mode)
  (c++-mode . rainbow-delimiters-mode)
  (python-mode . rainbow-delimiters-mode))
(use-package evil
  :config (evil-mode 1))
(use-package evil-mc
  :config
  (global-evil-mc-mode 1))
(use-package evil-org
  :after org
  :hook
  (org-mode . evil-org-mode)
  (evil-org-mode . evil-org-set-key-theme)
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))
;; (use-package helm
;;   :bind ("M-x" . helm-M-x)
;;   :config (helm-mode 1))

;; (use-package helm-projectile)
;; (use-package helm-systemd)
;; (use-package helm-descbinds
;;   :config (helm-descbinds-mode))

(use-package ivy
  :config
  (ivy-mode 1)
  (setq ivy-initial-inputs-alist nil)
  :custom
  (ivy-use-virtual-buffers t)
  (ivy-count-format "(%d/%d) "))
	     
(use-package counsel
  :config (counsel-mode))
(use-package counsel-projectile
  :config (counsel-projectile-mode))
(use-package which-key
  :config (which-key-mode))


(use-package company
  :custom-face
  (company-tooltip ((t (:inherit (fixed-pitch)))))
  :config
  (global-company-mode)
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 2))
(use-package company-c-headers
  :config (add-to-list 'company-backends 'company-c-headers))
(use-package company-irony
  :after company
  :config (add-to-list 'company-backends 'company-irony))
(use-package company-irony-c-headers
  :after company
  :config (add-to-list 'company-backends 'company-irony-c-headers))
(use-package company-quickhelp
  :after company
  :config (company-quickhelp-mode 1))


;; (use-package helm-company
;;   :bind (:map company-mode-map
;; 	 ("S-SPC" . helm-company)
;; 	 :map company-active-map
;; 	 ("S-SPC" . helm-company)))

(use-package company-math
  :config
  (add-to-list 'company-backends 'company-math-symbols-unicode)
  (add-to-list 'company-backends 'company-math-symbols-latex))
(use-package flycheck
  :config (global-flycheck-mode))
(use-package flycheck-irony
  :hook (flycheck-mode . flycheck-irony-setup))
(use-package meson-mode)
(use-package irony
  :hook ((c++-mode . irony-mode)
	 (c-mode . irony-mode)
	 (irony-mode . irony-cdb-autosetup-compile-options)))
(use-package clang-format)
(use-package markdown-mode)
(use-package fish-mode)
(use-package fish-completion
  :hook (fish-mode-hook . fish-completion-mode))
(use-package nim-mode
  :hook (nim-mode-hook . nimsuggest-mode))
(use-package d-mode)
(use-package glsl-mode)
(use-package elpy
  :init
  (setq elpy-rpc-python-command "python3")
  (setq python-shell-interpreter "ipython3")
  (setq python-shell-interpreter-args "-i --simple-prompt")
  :config
  (elpy-enable))
(use-package paradox)
(use-package esup)
(use-package projectile
  :config (projectile-mode))
(use-package treemacs
  :chords ("\\\\" . treemacs-toggle))
(use-package treemacs-evil)
(use-package treemacs-projectile
  :chords ("\\p" . treemacs-projectile))
(use-package magit)
(use-package ace-window
  :bind (:map evil-normal-state-map
  	("SPC s" . ace-window)))
(use-package dashboard
  :config (dashboard-setup-startup-hook))
(use-package mode-icons
  :config (mode-icons-mode))
(use-package all-the-icons)
(use-package all-the-icons-ivy
  :config (all-the-icons-ivy-setup))
(use-package tabbar-ruler
  :config
  (tabbar-ruler-group-by-projectile-project))

(use-package elscreen
  :custom
  (elscreen-prefix-key (kbd "C-b")))
;; (use-package telephone-line
;;   :config
;;   (require 'telephone-line-config)
;;   (telephone-line-evil-config))

(use-package powerline
  :after evil
  :config (powerline-center-evil-theme))

(use-package systemd)
(use-package flx)
;; (use-package helm-flx
;;   :config (helm-flx-mode +1))

(use-package company-flx
  :config (company-flx-mode +1))
(use-package doom-themes
  :config
  (doom-themes-visual-bell-config)
  (doom-themes-org-config))
(use-package indent-guide
  :hook
  (c++-mode . indent-guide-mode)
  (c-mode . indent-guide-mode)
  (python-mode . indent-guide-mode)
  (emacs-lisp-mode . indent-guide-mode))
(require 'bind-key)
(bind-key "SPC j" 'switch-to-buffer evil-normal-state-map)
(bind-key "SPC k" 'kill-buffer evil-normal-state-map)
(bind-key "SPC SPC" 'keyboard-quit evil-normal-state-map)
(custom-set-faces '(default ((t (:family "DejaVu Sans")))))
(desktop-save-mode 1)
(provide 'init)
;;; init.el ends here
