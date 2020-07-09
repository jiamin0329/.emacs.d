;; company-c-headers
(use-package company-c-headers
  :ensure t
  :init
  (add-to-list 'company-backends 'company-c-headers))

;; add path to system c/c++ headers
(add-to-list 'company-c-headers-path-system "/usr/local/include/")
(add-to-list 'company-c-headers-path-system "/usr/local/include/c++/8.3.0/")
(add-to-list 'company-c-headers-path-system "/usr/local/opt/llvm/include/c++/")
(add-to-list 'company-c-headers-path-system "/usr/local/opt/llvm/include/clang/")

;; hs-minor-mode for folding source code
(add-hook 'c-mode-common-hook 'hs-minor-mode)

(use-package cc-mode
  :ensure t)

(use-package semantic
  :ensure t)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(global-semantic-stickyfunc-mode 1)

(semantic-mode 1)

(defun cedet-hook ()
  (local-set-key "\C-c\C-j" 'semantic-ia-fast-jump)
  (local-set-key "\C-c\C-s" 'semantic-ia-show-summary))

(add-hook 'c-mode-common-hook 'cedet-hook)
(add-hook 'c-mode-hook 'cedet-hook)
(add-hook 'c++-mode-hook 'cedet-hook)

;;(define-key c-mode-map  [(tab)] 'company-complete)
;;(define-key c++-mode-map  [(tab)] 'company-complete)

;; Enable EDE only in C/C++
(use-package ede
  :ensure t)

(global-ede-mode 1)


;; clang-format
(use-package clang-format
  :ensure t
  :bind
  (("C-c i" . clang-format-region)
   ("C-c u" . clang-format-buffer)))

(setq clang-format-executable "/usr/local/bin/clang-format")
(setq clang-format-fallback-style "llvm")

(provide 'init-cmode)