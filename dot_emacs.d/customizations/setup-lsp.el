;; set some performance values
(setq read-process-output-max (* 1024 1024))
(setq gc-cons-threshold 100000000)

;; set up for Swift

(defun pado:sourcekit-lsp-path-xcrun-pwsh ()
  "Get the SourceKit LSP from xcrun under Powershell"
  (replace-regexp-in-string 
   "\n*$" ""
   (with-temp-buffer
     (call-process (getenv "SHELL") nil t nil "-l" "-i" "-c" "xcrun --find sourcekit-lsp")
     (buffer-string))))

(defvar eglot-server-programs ())
(add-to-list 'eglot-server-programs `(swift-mode . (,(pado:sourcekit-lsp-path-xcrun-pwsh))))
