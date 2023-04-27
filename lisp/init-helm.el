(use-package helm
  :ensure t
  :init
  (progn
    (require 'helm-grep)
    (helm-mode 1)
    ;; setup help local keys
    (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
    (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
    (define-key helm-map (kbd "C-z")  'helm-select-action)
    ;; override global key binds
    (global-set-key (kbd "C-x b") 'helm-buffers-list)
    (global-set-key (kbd "C-x C-f") 'helm-find-files)
    (global-set-key (kbd "M-x") 'helm-M-x)
    ;; remap global key binds
    (define-key global-map [remap find-tag] 'helm-etags-select)
    ))

(provide 'init-helm)
