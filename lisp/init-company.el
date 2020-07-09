;; company
(use-package company
  :init
  (global-company-mode 1)
  (delete 'company-semantic company-backends))

(add-hook 'c++-mode-hook 'global-company-mode)
(add-hook 'c-mode-hook 'global-company-mode)

(provide 'init-company)
