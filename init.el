;;===========================================================
;; Emacs basic configurations
;; Author: Jiamin Xu
;;===========================================================

;;===========================================================
;; General Settings
;;===========================================================
;; set emacs title
(setq frame-title-format "jiamin@%b")
;; set default directory
(if (or (eq system-type 'darwin)
        (eq system-type 'gnu/linux))
    (setq default-directory "~/workdir"))
;; set auto-save directory
(setq auto-save-list-file-prefix "~/.emacs.d/var/auto-save-list/.saves-")
;; hide scroll bar
(scroll-bar-mode -1)
;; hide tool bar
(tool-bar-mode -1)
;; hide menu bar
(menu-bar-mode -1)
;; Yes-or-no-p to y-or-n-p
(fset 'yes-or-no-p 'y-or-n-p)
;; highlight parentheses
(show-paren-mode 1)
;; cursor color
;;(set-cursor-color "#00FF00")
;; cursor type
(setq-default cursor-type 'box)
;; activate auto revert mode
(global-auto-revert-mode 1)
;; remove startup message or not
(setq inhibit-startup-message t)
;; highlight current line
(global-hl-line-mode 1)
;; turn on line number and column number
(setq column-number-mode t)
(setq line-number-mode t)
(global-linum-mode t)
;; do not create backup file
(setq make-backup-files nil)
;; inhibit tab key and set tab-width to 4
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook
          (lambda ()
			(interactive)
            (setq show-trailing-whitespace 0)))
;; use utf-8 everywhere
(set-charset-priority 'unicode)
(setq locale-coding-system   'utf-8)
(set-terminal-coding-system  'utf-8)
(set-keyboard-coding-system  'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system        'utf-8)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))
;; show emacs init time
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs ready in %s with %d garbage collections."
                     (format "%.2f seconds" (float-time (time-subtract after-init-time before-init-time))) gcs-done)))
;; define garbage collection threshold
(setq gc-cons-threshold (* 50 1000 1000))
;; set transparency of window
(set-frame-parameter (selected-frame) 'alpha (list 95 50))
;; show if it is emacs mode
(if (display-graphic-p)
    (message "emacs launches in graphical mode.")
  (message "emacs launches in terminal mode."))
;;===========================================================
;; add emacs loading path
(add-to-list 'load-path "~/.emacs.d/lisp")
;; setup for use-package
(require 'init-package)
;; setup general packages
(require 'init-general)
;; setup org-mode
(require 'init-orgmode)
;; setup markdown-mode
(require 'init-markdown)
;; setup lsp-mode
(require 'init-programming)
;; setup company mode
(require 'init-company)
;; setup key binding
(require 'init-keybind)

;; to fix svg bug in v28.2
;; overriding image.el function image-type-available-p
(defun image-type-available-p (type)
  "Return t if image type TYPE is available.
   Image types are symbols like `xbm' or `jpeg'."
  (if (eq 'svg type)
      nil
    (and (fboundp 'init-image-library)
         (init-image-library type))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-semantic-insert-arguments nil)
 '(format-all-default-formatters
   '(("Assembly" asmfmt)
     ("ATS" atsfmt)
     ("Bazel" buildifier)
     ("BibTeX" emacs-bibtex)
     ("C" clang-format)
     ("C#" clang-format)
     ("C++" clang-format)
     ("Cabal Config" cabal-fmt)
     ("Clojure" zprint)
     ("CMake" cmake-format)
     ("Crystal" crystal)
     ("CSS" prettier)
     ("Cuda" clang-format)
     ("D" dfmt)
     ("Dart" dart-format)
     ("Dhall" dhall)
     ("Dockerfile" dockfmt)
     ("Elixir" mix-format)
     ("Elm" elm-format)
     ("Emacs Lisp" emacs-lisp)
     ("Erlang" efmt)
     ("F#" fantomas)
     ("Fish" fish-indent)
     ("Fortran Free Form" fprettify)
     ("GLSL" clang-format)
     ("Go" gofmt)
     ("GraphQL" prettier)
     ("Haskell" brittany)
     ("HTML" prettier)
     ("HTML+EEX" mix-format)
     ("HTML+ERB" erb-format)
     ("Java" clang-format)
     ("JavaScript" prettier)
     ("JSON" prettier)
     ("JSON5" prettier)
     ("Jsonnet" jsonnetfmt)
     ("JSX" prettier)
     ("Kotlin" ktlint)
     ("LaTeX" latexindent)
     ("Less" prettier)
     ("Literate Haskell" brittany)
     ("Lua" lua-fmt)
     ("Markdown" prettier)
     ("Nix" nixpkgs-fmt)
     ("Objective-C" clang-format)
     ("OCaml" ocp-indent)
     ("Perl" perltidy)
     ("PHP" prettier)
     ("Protocol Buffer" clang-format)
     ("PureScript" purty)
     ("Python" black)
     ("R" styler)
     ("Reason" bsrefmt)
     ("ReScript" rescript)
     ("Ruby" rufo)
     ("Rust" rustfmt)
     ("Scala" scalafmt)
     ("SCSS" prettier)
     ("Shell" shfmt)
     ("Solidity" prettier)
     ("SQL" sqlformat)
     ("Svelte" prettier)
     ("Swift" swiftformat)
     ("Terraform" terraform-fmt)
     ("TOML" prettier)
     ("TSX" prettier)
     ("TypeScript" prettier)
     ("V" v-fmt)
     ("Verilog" istyle-verilog)
     ("Vue" prettier)
     ("XML" html-tidy)
     ("YAML" prettier)
     ("Zig" zig)
     ("_Angular" prettier)
     ("_Caddyfile" caddy-fmt)
     ("_Flow" prettier)
     ("_Gleam" gleam)
     ("_Ledger" ledger-mode)
     ("_Nginx" nginxfmt)
     ("_Snakemake" snakefmt)))
 '(package-selected-packages
   '(cmake-font-lock yasnippet web-mode vue-mode vterm use-package swiper smartparens python-mode prettier-js powerline plantuml-mode pandoc-mode pandoc neotree markdown-preview-mode magit lsp-ui keyfreq json-mode js2-mode info-colors htmlize helm-swoop helm-projectile golden-ratio format-all exec-path-from-shell dracula-theme doom-themes dap-mode company-c-headers cmake-mode cmake-ide clang-format))
 '(safe-local-variable-values
   '((eval setq-local company-c-headers-path-system
           (add-to-list 'company-c-headers-path-system "/opt/homebrew/include/opencascade"))))
 '(warning-suppress-log-types '(((flymake flymake)) ((flymake flymake))))
 '(warning-suppress-types '(((flymake flymake)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(lsp-headerline-breadcrumb-path-face ((t (:inherit font-lock-string-face :foreground "gray100"))))
 '(lsp-headerline-breadcrumb-symbols-face ((t (:inherit font-lock-doc-face :foreground "gray100" :weight bold)))))
(put 'set-goal-column 'disabled nil)
