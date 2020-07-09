;;========================================================================
;; General packages
;;========================================================================
;; ace window package
(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 6.0 :foreground "magenta")))))))

;; theme
(use-package doom-themes
  :ensure t
  :config (load-theme 'doom-dracula t))

;; modeline style
;;(use-package doom-modeline
;;  :ensure t
;;  :init (doom-modeline-mode 1)
;;  :config
;;  (setq doom-modeline-height 5)
;;  (setq mode-line-percent-position t))

(use-package powerline
  :ensure t
  :init
  (powerline-default-theme)
  :config
  (custom-set-faces
   '(mode-line ((t (:foreground "green" :background "purple" :box nil))))
   ;;'(mode-line-inactive ((t (:foreground "dark green"   :background "blue"   :box nil))))
   '(powerline-active0 ((t (:inherit mode-line :background "purple3"))))
   '(powerline-active1 ((t (:inherit mode-line :background "purple2"))))
   '(powerline-active2 ((t (:inherit mode-line :background "purple1"))))
   ;;'(powerline-inactive0 ((t (:inherit mode-line-inactive :background "blue3"))))
   ;;'(powerline-inactive1 ((t (:inherit mode-line-inactive :background "blue2"))))
   ;;'(powerline-inactive2 ((t (:inherit mode-line-inactive :background "blue1"))))
  ))

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
  (("C-s" . swiper)
   ("C-r" . swiper)
   ("C-c C-r" . ivy-resume)
   ("M-x" . counsel-M-x)
   ("C-x C-f" . counsel-find-file))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-display-style 'fancy)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)))

;; use projejctile package
(use-package projectile
  :ensure t
  :init
  (projectile-global-mode)
  (setq projectile-enable-caching t))

;; use consel projectile mode
(use-package counsel-projectile
  :ensure t
  :init
  (counsel-projectile-mode))

(provide 'init-general)
