;;========================================================================
;; General packages
;;========================================================================
;; theme
(use-package doom-themes
  :ensure t
  :config (load-theme 'doom-dracula t))
;; setup comment font and color
(set-face-attribute 'font-lock-comment-face nil :foreground "ForestGreen")
;; setup modeline
(use-package powerline
  :ensure t
  :init
  (powerline-default-theme)
  :config
  (setq powerline-default-separator (quote curve))
  (set-face-attribute 'mode-line nil
                      :foreground "#FFFFFF"
                      :background "#FF0066"
                      :box nil)
  (set-face-attribute 'mode-line-inactive nil
                      :foreground "#FFFFFF"
                      :background "#FF0066"
                      :box nil)
  (set-face-attribute 'powerline-active0 nil
                      :foreground "#FFFFFF"
                      :background "#5000B8")
  (set-face-attribute 'powerline-active1 nil
                      :foreground "#28FF28"
                      :background "#7B7B7B")
  (set-face-attribute 'powerline-active2 nil
                      :foreground "#FFFFFF"
                      :background "#5000B8"))
;; setup gloden ratio when start a new window
;;(use-package golden-ratio
;;  :ensure t
;;  :config
;;  (setq golden-ratio-adjust-factor 1.04)
;;  (golden-ratio-mode 1))
;; ace window package
(use-package ace-window
  :ensure t
  :init
  (setq ace-window 1)
  :config
  (global-set-key (kbd "C-x o") 'ace-select-window)
  (global-set-key (kbd "C-x i") 'ace-delete-window)
  (set-face-attribute  'aw-leading-char-face nil
                       :foreground "red"
                       :height 3.0))
;; info color package
(use-package info-colors
  :ensure t
  :hook ('info-selection-hook . 'info-colors-fontify-node))
;; smart parens
(use-package smartparens
  :ensure t
  :hook ('prog-mode . 'smartparens-global-mode))
;; use swiper to enhance seraching ability
(use-package swiper
  :ensure t
  :bind
  ("C-s" . swiper))
;; use vterm in OS
(use-package vterm
  :ensure t
  :config
  (setq explicit-shell-file-name "/bin/zsh"))

(use-package exec-path-from-shell
  :ensure t
  :init
  (exec-path-from-shell-initialize))
;; setup neotree to navigate current note
(use-package neotree
  :ensure t
  :init
  ;;(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (setq neo-smart-open t)
  :config
  (global-set-key (kbd "<f3>") 'neotree-toggle)
  (define-key neotree-mode-map (kbd "<f5>") 'neotree-refresh)
  (define-key neotree-mode-map (kbd "<f4>") 'neotree-hidden-file-toggle))
;; recent file
(use-package recentf
  :ensure t
  :config
  (add-to-list 'recentf-exclude "\\elpa")
  (add-to-list 'recentf-exclude "private/tmp")
  (recentf-mode)
  (global-set-key (kbd "C-x C-r") 'recentf-open-files))
;; keyfreq to analyze the key using situation
(use-package keyfreq
  :ensure t
  :init
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1)
  (setq keyfreq-excluded-commands '(self-insert-command
                                    forward-char
                                    backward-char
                                    previous-line
                                    next-line
                                    org-self-insert-command
                                    org-delete-backward-char
                                    org-return
                                    mwheel-scroll
                                    dap-tooltip-mouse-motion
                                    gud-tooltip-mouse-motion)))
;; setup helm package
(use-package helm
  :ensure t
  :init
  (progn
    (helm-mode 1)
    ;; setup help local keys
    (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
    (define-key helm-map (kbd "C-z") 'helm-select-action)
    ;; override global key binds
    (global-set-key (kbd "C-x b") 'helm-buffers-list)
    (global-set-key (kbd "C-x C-f") 'helm-find-files)
    (global-set-key (kbd "M-x") 'helm-M-x)
    ;; remap global key binds
    (define-key global-map [remap find-tag] 'helm-etags-select)))


(defvar hs-special-modes-alist
  (mapcar 'purecopy
  '((c-mode "{" "}" "/[*/]" nil nil)
    (c++-mode "{" "}" "/[*/]" nil nil)
    (bibtex-mode ("@\\S(*\\(\\s(\\)" 1))
    (java-mode "{" "}" "/[*/]" nil nil)
    (js-mode "{" "}" "/[*/]" nil))))

;; provide general settings
(provide 'init-general)
