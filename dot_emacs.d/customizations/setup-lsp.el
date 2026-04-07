;; set some performance values
(setq read-process-output-max (* 1024 1024))
(setq gc-cons-threshold 100000000)

;; allow customizing Projectile commands
(put 'projectile-project-compilation-cmd 'safe-local-variable #'stringp)
(put 'projectile-project-run-cmd 'safe-local-variable #'stringp)

;; Helper function to get SourceKit LSP path under PowerShell
(defun pado:sourcekit-lsp-path-xcrun-pwsh ()
  "Get the SourceKit LSP from xcrun under Powershell"
  (replace-regexp-in-string
   "\n*$" ""
   (with-temp-buffer
     (call-process (getenv "SHELL") nil t nil "-l" "-i" "-c" "xcrun --find sourcekit-lsp")
     (buffer-string))))

;; Configure Eglot LSP client
(use-package eglot
  :config
  ;; Swift LSP configuration
  (add-to-list 'eglot-server-programs
               `(swift-ts-mode . (,(pado:sourcekit-lsp-path-xcrun-pwsh))))

  ;; TypeScript LSP configuration
  (add-to-list 'eglot-server-programs
               '((typescript-mode) "typescript-language-server" "--stdio"))
  (add-to-list 'eglot-server-programs
               '((typescript-ts-mode) "typescript-language-server" "--stdio"))
  (add-to-list 'eglot-server-programs
               '((tsx-ts-mode) "typescript-language-server" "--stdio"))
  (setq compilation-always-kill t))

;; Configure Company (completion framework)
(use-package company)

;; Configure YASnippet (code snippets)
(use-package yasnippet
  :ensure t
  :config
  (setq
   yas-verbosity 1
   yas-wrap-around-region t)

  (yas-reload-all)
  (yas-global-mode))

;; Configure TypeScript modes with Eglot and Company
(use-package typescript-mode
  :hook ((typescript-mode . eglot-ensure)
         (typescript-mode . company-mode)
         (typescript-mode . tree-sitter-hl-mode)
         (typescript-ts-mode . eglot-ensure)
         (typescript-ts-mode . company-mode)
         (tsx-ts-mode . eglot-ensure)
         (tsx-ts-mode . company-mode)))

;; Configure tree-sitter
(use-package tree-sitter)

(use-package tree-sitter-langs
  :after tree-sitter)
