(use-package elpy
  :ensure t)

(elpy-enable)

(defun my-python-mode-setup ()
  (add-hook 'post-self-insert-hook
            'electric-layout-post-self-insert-function
            nil t))

(add-hook 'python-mode-hook 'my-python-mode-setup)

(add-hook 'python-mode-hook 'lsp)

(provide 'init-pythonmode)
