(use-package python-mode
  :ensure t)

;; vue mode configuration
(use-package vue-mode
  :ensure t
  :mode "\\.vue\\'"
  :config
  (add-hook 'vue-mode-hook #'lsp))
;; javascript mode configuration
(use-package js2-mode
  :ensure t
  :mode "\\.js\\'"
  :config
  ;;(js2-include-node-externs t)
  ;;(js2-global-externs '("customElements"))
  (setq js2-highlight-level 3)
  (setq js2r-prefer-let-over-var t)
  (setq js2r-prefered-quote-type 2)
  (setq js-indent-align-list-continuation t)
  (setq global-auto-highlight-symbol-mode t)
  (setq js-indent-level 4)
  ;; patch in basic private field support
  (advice-add #'js2-identifier-start-p
              :after-until
              (lambda (c) (eq c ?#))))
;; web mode configuration
(use-package web-mode
  :ensure t
  :init
  :config
  (setq auto-mode-alist
        (append
         '(("\\.html?\\'" . web-mode)
           ("\\.phtml\\'" . web-mode)
           ("\\.tpl\\.php\\'" . web-mode)
           ("\\.jsp\\'" . web-mode)
           ("\\.as[cp]x\\'" . web-mode)
           ("\\.erb\\'" . web-mode)
           ("\\.mustache\\'" . web-mode)
           ("\\.djhtml\\'" . web-mode))
         auto-mode-alist))
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-code-indent-offset 4)
  (setq web-mode-css-indent-offset 4)
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-enable-auto-quoting t)
  (setq web-mode-enable-css-colorization t)
  (setq web-mode-enable-current-element-highlight t)
  (define-key web-mode-map (kbd "C-c C-f") 'web-mode-fold-or-unfold))
;; json mode configuration
(use-package json-mode
  :ensure t
  :config
  (add-hook 'json-mode-hook 'flycheck-mode)
  (add-hook 'json-mode-hook 'electric-pair-mode)
  (add-hook 'json-mode-hook 'prettify-symbols-mode)
  (add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode)))
;; configure cmake mode
(use-package cmake-mode
  :ensure t
  :mode ("CMakeLists\\.txt\\'" "\\.cmake\\'"))
(use-package cmake-font-lock
  :ensure t
  :after cmake-mode
  :config (cmake-font-lock-activate))
;; specify formatters for different programming languages
(use-package format-all
  :ensure t
  :bind
  ;;("<tab>" . format-all-region)
  ("C-c i" . format-all-region)
  :config
  (add-hook 'prog-mode-hook #'format-all-ensure-formatter)
  (add-to-list 'format-all-formatters '("BibTeX" emacs-bibtex))
  (add-to-list 'format-all-formatters '("C" clang-format))
  (add-to-list 'format-all-formatters '("C#" clang-format))
  (add-to-list 'format-all-formatters '("C++" clang-format))
  (add-to-list 'format-all-formatters '("CMake" cmake-format))
  (add-to-list 'format-all-formatters '("CSS" prettier))
  (add-to-list 'format-all-formatters '("Cuda" clang-format))
  (add-to-list 'format-all-formatters '("Dockerfile" dockfmt))
  (add-to-list 'format-all-formatters '("Emacs Lisp" emacs-lisp))
  (add-to-list 'format-all-formatters '("Go" gofmt))
  (add-to-list 'format-all-formatters '("HTML" prettier))
  (add-to-list 'format-all-formatters '("Java" clang-format))
  (add-to-list 'format-all-formatters '("JavaScript" prettier))
  (add-to-list 'format-all-formatters '("JSON" prettier))
  (add-to-list 'format-all-formatters '("JSON5" prettier))
  (add-to-list 'format-all-formatters '("JSX" prettier))
  (add-to-list 'format-all-formatters '("LaTeX" latexindent))
  (add-to-list 'format-all-formatters '("Markdown" prettier))
  (add-to-list 'format-all-formatters '("Objective-C" clang-format))
  (add-to-list 'format-all-formatters '("Perl" perltidy))
  (add-to-list 'format-all-formatters '("Python" black))
  (add-to-list 'format-all-formatters '("SCSS" prettier))
  (add-to-list 'format-all-formatters '("Shell" shfmt))
  (add-to-list 'format-all-formatters '("SQL" sqlformat))
  (add-to-list 'format-all-formatters '("Swift" swiftformat))
  (add-to-list 'format-all-formatters '("TypeScript" prettier))
  (add-to-list 'format-all-formatters '("Vue" prettier))
  (add-to-list 'format-all-formatters '("XML" prettier))
  (add-to-list 'format-all-formatters '("YAML" prettier)))

;; For vue mode: vue2 ==> npm -g install vls
;;               vue3 ==> npm install -g @volar/vue-language-server
;; For JavaScript: npm i -g typescript-language-server; npm i -g typescript
(use-package lsp-mode
  :ensure t
  :commands lsp
  :hook
  (js2-mode . lsp)
  (typescript-mode . lsp)
  (vue-mode . lsp)
  (c-mode . lsp)
  (c++-mode . lsp)
  :config
  (setq lsp-clients-typescript-server-args '("--stdio"))
  (setq lsp-clients-clangd-executable "/opt/homebrew/opt/llvm/bin/clangd")
  ;;setup headerline
  (setq lsp-headerline-breadcrumb-icons-enable nil)
  (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
  (setq lsp-enable-snippet nil))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :init
  (add-hook 'lsp-mode-hook 'lsp-ui-mode)
  :bind (:map lsp-ui-mode-map
              ("M-." . lsp-ui-peek-find-definitions)
              ("M-/" . lsp-ui-peek-find-references))
  :config
  (setq lsp-ui-sideline-show-diagnostics t)
  (setq lsp-ui-sideline-show-hover t)
  (setq lsp-ui-sideline-show-code-actions t)
  ;;(setq lsp-ui-sideline-update-mode 'line)
  (setq lsp-ui-sideline-delay 0.2))

(provide 'init-programming)
