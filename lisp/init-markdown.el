(use-package markdown-mode
  :ensure t
  :commands
  (markdown-mode gfm-mode)
  :mode
  (("README\\.md\\'" . gfm-mode)
   ("\\.md\\'" . markdown-mode)
   ("\\.markdown\\'" . markdown-mode))
  :init
  (setq markdown-command "pandoc")
  :config
  (add-hook 'markdown-mode-hook 'turn-on-auto-fill)
  (add-hook 'markdown-mode-hook 'pandoc-mode)
  (setq markdown-fontify-code-blocks-natively t)
  (setq markdown-enable-math t)
  (setq markdown-enable-wiki-links t)
  (use-package markdown-preview-mode
    :ensure t
    )
  (use-package plantuml-mode
    :ensure t
    :config
    (setq plantuml-jar-path  "~/.emacs.d/plantuml-1.2023.1.jar")
    (setq plantuml-executable-path "/opt/homebrew/bin/plantuml")
    )
  (use-package pandoc-mode
    :ensure t
    :config
    ))
(provide 'init-markdown)
