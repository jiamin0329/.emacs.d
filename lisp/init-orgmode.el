;;===========================================================
;; org-mode
;;===========================================================
(use-package org
  :ensure t
  :init
  (setq org-src-fontify-natively t)
  :config
  (add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
  ;; set plantuml and active Org-babel languages
  (org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t)))
  (setq org-plantuml-jar-path (expand-file-name "~/.emacs.d/plantuml-1.2023.1.jar"))
  ;; do NOT ask for babel evalutae
  (setq org-confirm-babel-evaluate nil)
  (setq org-indent-mode t))
;; provide orgmode
(provide 'init-orgmode)
