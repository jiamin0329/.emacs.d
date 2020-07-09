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

;; org-mode settings
(setq org-confirm-babel-evaluate nil)
(setq org-indent-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (elpy clang-format company-c-headers helm-gtags helm-projectile helm-swoop helm cmake-ide htmlize counsel-projectile projectile swiper smartparens info-colors doom-modeline doom-themes ace-window use-package)))
 '(powerline-gui-use-vcs-glyph t))
