;; set some performance values
(setq read-process-output-max (* 1024 1024))
(setq gc-cons-threshold 100000000)

;; allow customizing Projectile commands

(put 'projectile-project-compilation-cmd 'safe-local-variable #'stringp)
(put 'projectile-project-run-cmd 'safe-local-variable #'stringp)

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
(add-to-list 'eglot-server-programs
             '((typescript-mode) "typescript-language-server" "--stdio"))

(add-hook 'swift-mode-hook 'eglot-ensure)
(add-hook 'swift-mode-hook 'company-mode)
(add-hook 'typescript-mode-hook 'eglot-ensure)
(add-hook 'typescript-mode-hook 'company-mode)
(add-hook 'typescript-mode-hook 'tree-sitter-hl-mode)

;; add ANSI color to compilation
(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (ansi-color-apply-on-region compilation-filter-start (point)))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)
