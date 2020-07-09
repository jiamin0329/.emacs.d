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
(setq default-directory "~/workdir")
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
;; do Not remove startup message
(setq inhibit-startup-message nil)
;; highlight current line
(global-hl-line-mode 1)
;; turn on line number and column number
(setq column-number-mode t)
(setq line-number-mode t)
(global-linum-mode t)
;; inhibit tab key and set tab-width to 4
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook
          (lambda ()
			(interactive)
            (setq show-trailing-whitespace 0)))

;;recursivly adding directories to load-path
;;(defun add-subdirs-to-load-path(dir)
;;  "Recursive add directories to `load-path`."
;;  (let ((default-directory (file-name-as-directory dir)))
;;    (add-to-list 'load-path dir)
;;    (normal-top-level-add-subdirs-to-load-path)))
;;
;;(let ((gc-cons-threshold most-positive-fixnum)
;;      (file-name-handler-alist nil))
;;  (add-subdirs-to-load-path "~/.emacs.d"))

;; use utf-8 everywhere
(set-charset-priority 'unicode)
(setq locale-coding-system   'utf-8)
(set-terminal-coding-system  'utf-8)
(set-keyboard-coding-system  'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system        'utf-8)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

(add-hook 'emacs-startup-hook 
          (lambda () 
            (message "Emacs ready in %s with %d garbage collections." 
                     (format "%.2f seconds" (float-time (time-subtract after-init-time before-init-time))) gcs-done)))

(setq gc-cons-threshold (* 50 1000 1000))

;; set transparency of window
(set-frame-parameter (selected-frame) 'alpha (list 95 50))

(if (display-graphic-p)
    (message "emacs launches in graphical mode.")
  (message "emacs launches in terminal mode."))
;;===========================================================
(add-to-list 'load-path "~/.emacs.d/lisp")

;; import env path from shell
(require 'exec-path-from-shell)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; setup for use-package
(require 'init-package)
;; setup general packages
(require 'init-general)
;; setup org-mode
(require 'init-orgmode)
;; setup cmake mode
(require 'init-cmake)
;; setup company mode
(require 'init-company)
;; setup helm packages
(require 'init-helm)
;; setup c/c++ mode
(require 'init-cmode)
;; setup python mode
(require 'init-pythonmode)
;; setup key binding
(require 'init-keybind)

;; settings for lldb are placed here temporarily
;;(use-package realgud-lldb
;;  :ensure t)

;; gdb settings
(setq gdb-many-windows t)

;; separate io buffer
(setq gdb-use-separate-io-buffer 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#002b36" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#839496"])
 '(custom-safe-themes
   (quote
    ("912cac216b96560654f4f15a3a4d8ba47d9c604cbc3b04801e465fb67a0234f0" "5d09b4ad5649fea40249dd937eaaa8f8a229db1cec9a1a0ef0de3ccf63523014" "2a749c20af891c16571527d07976bbcf2bf31819fa7d322942b73386019f4d58" "bc836bf29eab22d7e5b4c142d201bcce351806b7c1f94955ccafab8ce5b20208" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "be9645aaa8c11f76a10bcf36aaf83f54f4587ced1b9b679b55639c87404e2499" "e1ef2d5b8091f4953fe17b4ca3dd143d476c106e221d92ded38614266cea3c8b" "9efb2d10bfb38fe7cd4586afb3e644d082cbcdb7435f3d1e8dd9413cbe5e61fc" "3c2f28c6ba2ad7373ea4c43f28fcf2eed14818ec9f0659b1c97d4e89c99e091e" default)))
 '(fci-rule-color "#405A61")
 '(jdee-db-active-breakpoint-face-colors (cons "#073642" "#268bd2"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#073642" "#859900"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#073642" "#56697A"))
 '(objed-cursor-color "#dc322f")
 '(package-selected-packages
   (quote
    (realgud-lldb clang-format elpy company-c-headers counsel-projectile projectile yasnippet use-package smartparens pos-tip info-colors htmlize doom-themes doom-modeline counsel company-box cmake-mode cmake-ide auto-complete-clang-async auto-complete-clang ace-window)))
 '(pdf-view-midnight-colors (cons "#839496" "#002b36"))
 '(rustic-ansi-faces
   ["#002b36" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#839496"])
 '(safe-local-variable-values
   (quote
    ((company-clang-arguments "-I ./src/" "-I ./src/boost/boost/"))))
 '(vc-annotate-background "#002b36")
 '(vc-annotate-color-map
   (list
    (cons 20 "#859900")
    (cons 40 "#959300")
    (cons 60 "#a58e00")
    (cons 80 "#b58900")
    (cons 100 "#bc7407")
    (cons 120 "#c35f0e")
    (cons 140 "#cb4b16")
    (cons 160 "#cd4439")
    (cons 180 "#d03d5d")
    (cons 200 "#d33682")
    (cons 220 "#d63466")
    (cons 240 "#d9334a")
    (cons 260 "#dc322f")
    (cons 280 "#ba3f41")
    (cons 300 "#994d54")
    (cons 320 "#775b67")
    (cons 340 "#405A61")
    (cons 360 "#405A61")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 6.0 :foreground "magenta")))))

(put 'scroll-left 'disabled nil)
