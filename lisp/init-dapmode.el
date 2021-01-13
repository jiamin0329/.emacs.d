(use-package dap-mode
  :custom
  (dap-lldb-debug-program `("/Users/xujiamin/.emacs.d/lanza.lldb-vscode-0.2.2/bin/darwin/bin/lldb-vscode"))
  :config
  (dap-mode 1)
  (dap-tooltip-mode 1)
  (require 'dap-lldb)
  (use-package dap-ui
      :ensure nil
      :config
      (dap-ui-mode 1)))

(provide 'init-dapmode)

