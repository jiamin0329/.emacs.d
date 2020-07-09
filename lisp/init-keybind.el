;;===========================================================
;; key binding
;;===========================================================
(global-set-key (kbd "C-x m") 'set-mark-command)

;; set F1 to open init.el
(defun open-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f1>") 'open-init-file)
;; set F2 to open shell mode
(global-set-key (kbd "<f2>") 'vterm)

;; create a new line
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "S-<return>") 'comment-indent-new-line)

(provide 'init-keybind)
