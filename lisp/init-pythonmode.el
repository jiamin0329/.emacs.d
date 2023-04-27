(use-package python-mode
  :ensure t
  :hook (python-mode . lsp-deferred)
  :custom
  ;; NOTE: Set these if Python 3 is called "python3" on your system!
  ;; (python-shell-interpreter "python3")
  ;; (dap-python-executable "python3")
  (dap-python-debugger 'debugpy)
  :config
  (require 'dap-python))

(setq python-indent-offset 4)
(setq python-indent-guess-indent-offset 0)
(setq python-indent-guess-indent-offset-verbose 0)
;; enable company mode for python
(add-hook 'python-mode 'global-company-mode)
(provide 'init-pythonmode)
