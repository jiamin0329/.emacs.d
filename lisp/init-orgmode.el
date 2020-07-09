;;===========================================================
;; org-mode
;;===========================================================
(require 'org)
(setq org-src-fontify-natively t)
(setq org-src-block-faces '(("c++" (:background "#000000"))))

;; set plantuml and active Org-babel languages
(org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t)))
(setq org-plantuml-jar-path (expand-file-name "~/.emacs.d/plantuml.jar"))

;;;; use minted to highlight code in latex
;;(require 'ox-latex)
;;(add-to-list 'org-latex-packages-alist '("" "minted"))
;;(setq org-latex-listings 'minted)
;;
;;;; set latex to xelatex
;;(setq org-latex-pdf-process '("xelatex -shell-escape -interaction nonstopmode %f"
;;                              "xelatex -shell-escape -interaction nonstopmode %f"))

;; htmlize package for html output
(use-package htmlize
  :ensure t)

(provide 'init-orgmode)
