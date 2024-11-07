;;===========================================================
;; Python support
;;===========================================================
(use-package anaconda-mode
  :ensure t)

(use-package pyenv-mode
  :ensure t)

(use-package pyvenv
  :ensure t
  :init
  (setenv "WORKON_HOME" "/Users/jiaminxu/anaconda3/envs")
  (pyvenv-mode 1)
  (pyvenv-tracking-mode 1))

(use-package python-mode
  :ensure t
  :hook
  (python-mode . lsp-deferred)
  :config
  ;;(setq python-shell-interpreter "/Users/jiaminxu/anaconda3/envs/engineering/bin/python")
  (add-hook 'python-mode-hook #'lsp)
  (add-hook 'python-mode-hook #'anaconda-mode)
  (setq python-indent-offset 4)
  (setq python-indent-guess-indent-offset 0)
  (setq python-indent-guess-indent-offset-verbose 0))

;;===========================================================
;; Syntax highlight for languages
;;===========================================================
;; Package
;;(use-package tree-sitter
;;  :ensure t)
;;
;;(use-package tree-sitter-langs
;;  :ensure t)

;; Hook tree-sitter-hl-mode to replace the regex-based highlighting
;; provided by font-lock-mode with tree-based syntax highlighting.
(add-hook 'python-mode-hook #'tree-sitter-hl-mode)
(add-hook 'c-mode-hook #'tree-sitter-hl-mode)
(add-hook 'c++-mode-hook #'tree-sitter-hl-mode)

;;===========================================================
;; Language Server Protocal
;;===========================================================
;; For vue mode: vue2 ==> npm install -g vls
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
  (python-mode . lsp)
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

;;===========================================================
;; Company mode
;;===========================================================
(use-package company
  :after lsp-mode
  :hook (lsp-mode . company-mode)
  :custom
  (company-transformers '(company-sort-by-backend-importance))
  (company-idle-delay 0)
  (company-echo-delay 0)
  (company-minimum-prefix-length 2)
  (company-selection-wrap-around t)
  (completion-ignore-case 0)
  (company-dabbrev-downcase nil)
  :bind
  (("C-M-c" . company-complete))
  (:map company-active-map
        ("C-n" . company-select-next)
        ("C-p" . company-select-previous)
        ("C-s" . company-filter-candidates)
        ("C-i" . company-complete-selection)
        ([tab] . company-complete-selection))
  (:map company-search-map
        ("C-n" . company-select-next)
        ("C-p" . company-select-previous))
  :init
  (global-company-mode t)
  :config
  (defun my-sort-uppercase (candidates)
    (let (case-fold-search
          (re "\\`[[:upper:]]*\\'"))
      (sort candidates
            (lambda (s1 s2)
              (and (string-match-p re s2)
                   (not (string-match-p re s1)))))))
  (push 'my-sort-uppercase company-transformers))

;; for c/c++
(use-package company-c-headers
  :ensure t
  :config
  (add-to-list 'company-backends 'company-c-headers))


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

(provide 'init-programming)
