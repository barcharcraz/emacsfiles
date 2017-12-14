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
(setq use-package-always-ensure t)
(use-package no-littering)
(use-package evil
  :config (evil-mode 1))

(use-package helm
  :bind ("M-x" . helm-M-x)
  :config (helm-mode 1))

(use-package helm-descbinds
  :config (helm-descbinds-mode))

(use-package company
  :config
  (global-company-mode)
  (company-tng-configure-default))
(use-package helm-company
  :bind (:map company-mode-map
	 ("S-SPC" . helm-company)
	 :map company-active-map
	 ("S-SPC" . helm-company)))

(use-package dashboard
  :config (dashboard-setup-startup-hook))
(use-package all-the-icons)
(use-package powerline)
(use-package spaceline)
(use-package spaceline-all-the-icons
  :after spaceline
  :config (spaceline-all-the-icons-theme))
