;;; init.el --- Where all the magic begins
;;
;; This file loads Org-mode and then loads the rest of our Emacs initialization from Emacs lisp
;; embedded in literate Org-mode files.

(require 'org-install)
(org-babel-load-file (expand-file-name "start.org" user-emacs-directory))
(provide 'init)
;;; init.el ends here
