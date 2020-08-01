(setq c-basic-offset 4 c-indent-level 4)
;; company-c-headers
(use-package company-c-headers
  :ensure t
  :init
  (add-to-list 'company-backends 'company-c-headers))

;; add path to system c/c++ headers
(add-to-list 'company-c-headers-path-system "/usr/local/include/")
(add-to-list 'company-c-headers-path-system "/usr/local/include/c++/8.3.0/")
(add-to-list 'company-c-headers-path-system "/usr/local/opt/llvm/include/c++/")
(add-to-list 'company-c-headers-path-system "/usr/local/opt/llvm/include/clang/")

;; hs-minor-mode for folding source code
(add-hook 'c-mode-common-hook 'hs-minor-mode)

(use-package cc-mode
  :ensure t)

(use-package semantic
  :ensure t)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(global-semantic-stickyfunc-mode 1)

(semantic-mode 1)

;;(semantic-add-system-include "/usr/include/include")
;;(semantic-add-system-include "/usr/local/include/c++/8.3.0/")
;;(semantic-add-system-include "/usr/local/opt/llvm/include/c++/")
;;(semantic-add-system-include "/usr/local/opt/llvm/include/clang/")

;; smart complitions
(require 'semantic/ia)
(setq-mode-local c-mode semanticdb-find-default-throttle '(project unloaded system recursive))
(setq-mode-local c++-mode semanticdb-find-default-throttle '(project unloaded system recursive))

;;;; Include settings
(require 'semantic/bovine/gcc)
(require 'semantic/bovine/c)

(setq cedet-user-include-dirs (list "./" "../" 
                                    "./cfd/" "../cfd/" 
                                    "./common/"  "../common/" 
                                    "./geometry/" "../geometry/" 
                                    "./material/"  "../material/" 
                                    "./template/"  "../template/" 
                                    "./testsuite/" "../testsuite/" 
                                    "./utilities/"  "../utilities/" 
                                    "./boost/boost/" "../boost/boost/"))

(setq cedet-sys-include-dirs (list
                              "/usr/include"
                              "/usr/local/include/c++/8.3.0"
                              "/usr/local/opt/llvm/include/c++"
                              "/usr/local/opt/llvm/include/clang/"))

(let ((include-dirs cedet-user-include-dirs))
  (setq include-dirs (append include-dirs cedet-sys-include-dirs))
  (mapc (lambda (dir)
          (semantic-add-system-include dir 'c++-mode)
          (semantic-add-system-include dir 'c-mode))
        include-dirs))

(setq semantic-c-dependency-system-include-path "/usr/include/")

(require 'semantic-c nil 'noerror)

(defun cedet-hook ()
  (local-set-key "\C-c\C-j" 'semantic-ia-fast-jump)
  (local-set-key "\C-c\C-s" 'semantic-ia-show-summary))

(add-hook 'c-mode-common-hook 'cedet-hook)
(add-hook 'c-mode-hook 'cedet-hook)
(add-hook 'c++-mode-hook 'cedet-hook)

(setq company-backends (delete 'company-semantic company-backends))
;;(define-key c-mode-map  [(tab)] 'company-complete)
;;(define-key c++-mode-map  [(tab)] 'company-complete)

;; Enable EDE only in C/C++
(use-package ede
  :ensure t)

(global-ede-mode 1)

;; clang-format
(use-package clang-format
  :ensure t
  :bind
  (("C-c i" . clang-format-region)
   ("C-c u" . clang-format-buffer)))

(defun clang-hook ()
  (local-set-key "tab" 'clang-format-region))

(add-hook 'c-mode-common-hook 'clang-hook)
(add-hook 'c-mode-hook 'clang-hook)
(add-hook 'c++-mode-hook 'clang-hook)

(setq clang-format-executable "/usr/local/bin/clang-format")
(setq clang-format-fallback-style "llvm")

(provide 'init-cmode)
