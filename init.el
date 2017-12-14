
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(when (require 'evil nil 'noerror)
  (evil-mode 1))

(when (require 'which-key nil 'noerror)
  (which-key-mode))

(when (require 'helm nil 'noerror)
  (helm-mode 1)
  (global-set-key (kbd "M-x") 'helm-M-x))

(when (require 'helm-descbinds nil 'noerror)
  (helm-descbinds-mode))

(when (require 'company nil 'noerror)
  (global-company-mode)
  (company-tng-configure-default))

(when (require 'helm-company nil 'noerror)
  (define-key company-mode-map (kbd "S-SPC") 'helm-company)
  (define-key company-active-map (kbd "S-SPC") 'helm-company))

(when (require 'dashboard nil 'noerror)
  (dashboard-setup-startup-hook))

(when (require 'powerline nil 'noerror)
  (powerline-evil-center-color-theme))

