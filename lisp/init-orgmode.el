;;===========================================================
;; org-mode
;;===========================================================
(require 'org)
(setq org-src-fontify-natively t)
(setq org-src-block-faces '(("c++" (:background "#000000"))))

;; set plantuml and active Org-babel languages
(org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t)))
(setq org-plantuml-jar-path (expand-file-name "~/.emacs.d/plantuml.jar"))

;; htmlize package for html output
(use-package htmlize
  :ensure t)

;; do NOT ask for babel evalutae
(setq org-confirm-babel-evaluate nil)
(setq org-indent-mode t)

(provide 'init-orgmode)
