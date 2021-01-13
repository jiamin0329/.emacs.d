;; default indent/offset
(setq c-basic-offset 4 c-indent-level 4)
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
;; disable flymake
(defun diable-flymake-cmode()
  (add-hook 'flymake-mode nil))
(add-hook 'c-mode-common-hook 'disable-flymake-cmode)
(add-hook 'c-mode-hook 'disable-flymake-cmode)
(add-hook 'c++-mode-hook 'disable-flymake-cmode)
;; enable company mode for c/c++
(add-hook 'c++-mode-hook 'global-company-mode)
(add-hook 'c-mode-hook 'global-company-mode)
;; enable cc mode
(use-package cc-mode
  :ensure t)
;; clang-format
(use-package clang-format
  :ensure t
  :bind
  (("C-c i" . clang-format-region)
   ("C-c u" . clang-format-buffer)))

(defun clang-hook ()
  (local-set-key [tab] 'clang-format-region))

(add-hook 'c-mode-common-hook 'clang-hook)
(add-hook 'c-mode-hook 'clang-hook)
(add-hook 'c++-mode-hook 'clang-hook)

(setq clang-format-executable "/usr/local/bin/clang-format")
(setq clang-format-fallback-style "llvm")

(provide 'init-cmode)
