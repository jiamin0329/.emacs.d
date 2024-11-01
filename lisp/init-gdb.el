;; separate io buffer
(setq gdb-use-separate-io-buffer 1)

;;;; set gdb multi-windows when open
(setq gdb-many-windows t)

;;;;;; customize the gdb multi-windows
;;(defadvice gdb-setup-windows (after my-setup-gdb-windows activate)
;;  "my gdb UI"
;;  (gdb-get-buffer-create 'gdb-stack-buffer)
;;  (set-window-dedicated-p (selected-window) nil)
;;  (switch-to-buffer gud-comint-buffer)
;;  (delete-other-windows)
;;  (let ((win0 (selected-window))
;;        (win1 (split-window nil nil 'left))  ;; code and output
;;        (win2 (split-window-below (/ (* (window-height) 3) 4))));; stack
;;    (select-window win2)
;;    (gdb-set-window-buffer (gdb-stack-buffer-name))
;;    (select-window win1)
;;    (set-window-buffer
;;     win1
;;     (if gud-last-last-frame
;;         (gud-find-file (car gud-last-last-frame))
;;       (if gdb-main-file
;;           (gud-find-file gdb-main-file)
;;         ;; Put buffer list in window if we
;;         ;; can't find a source file.
;;         (list-buffers-noselect))))
;;    (setq gdb-source-window (selected-window))
;;    (let ((win3 (split-window nil (/ (* (window-height) 3) 4))))  ;; io
;;      (gdb-set-window-buffer (gdb-get-buffer-create 'gdb-inferior-io) nil win3))
;;    (select-window win0)
;;    ))
;;
;;(add-hook 'gdb-mode-hook
;;          (lambda ()
;;            (gud-tooltip-mode);;minor mode当鼠标放到变量上后，会弹出tooltip来显示变量的值
;;            (local-set-key [f11] 'gud-step);;进入函数
;;            (local-set-key [f10] 'gud-next);;不进入函数,到下一行
;;            (local-set-key "S-[f11]" 'gud-finish);;跳出函数
;;            (local-set-key [f5] 'gud-until)));;继续执行
;;
(provide 'init-gdb)
