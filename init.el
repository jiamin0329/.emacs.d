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
(setq inhibit-startup-message t)
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


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("e1ef2d5b8091f4953fe17b4ca3dd143d476c106e221d92ded38614266cea3c8b" "d74c5485d42ca4b7f3092e50db687600d0e16006d8fa335c69cf4f379dbd0eee" "2a749c20af891c16571527d07976bbcf2bf31819fa7d322942b73386019f4d58" "9efb2d10bfb38fe7cd4586afb3e644d082cbcdb7435f3d1e8dd9413cbe5e61fc" default)))
 '(package-selected-packages
   (quote
    (elpy clang-format company-c-headers helm-gtags helm-projectile helm-swoop helm cmake-ide htmlize counsel-projectile projectile swiper smartparens info-colors doom-modeline doom-themes ace-window use-package)))
 '(powerline-default-separator (quote curve))
 '(powerline-gui-use-vcs-glyph t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 6.0 :foreground "magenta"))))
 '(mode-line ((t (:foreground "green" :background "purple" :box nil))))
 '(powerline-active0 ((t (:inherit mode-line :background "purple3"))))
 '(powerline-active1 ((t (:inherit mode-line :background "gray50"))))
 '(powerline-active2 ((t (:inherit mode-line :background "purple1")))))
