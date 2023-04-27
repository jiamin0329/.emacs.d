;;===========================================================
;; key binding
;;===========================================================
(global-set-key (kbd "C-x m") 'set-mark-command)

;; set F1 to open init.el
(defun open-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(defun load-init-file ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f1>") 'open-init-file)
(global-set-key (kbd "<f12>") 'load-init-file)
;; set F2 to open shell mode
(if (eq system-type 'darwin)
    (global-set-key (kbd "<f2>") 'vterm))
(if (eq system-type 'windows-nt)
    (global-set-key (kbd "<f2>") 'eshell))
;; create a new line
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "S-<return>") 'comment-indent-new-line)

(global-set-key (kbd "C-c c") 'comment-line)
(global-set-key (kbd "C-c C-c") 'comment-region)

(provide 'init-keybind)
