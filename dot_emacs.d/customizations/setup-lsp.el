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
  :custom
  (compilation-always-kill t)
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
               '((tsx-ts-mode) "typescript-language-server" "--stdio")))

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

;; Configure dape (Debug Adapter)
(use-package dape
  :ensure t
  :custom
  (dape-cwd-function #'projectile-project-root)
  :config
  (add-to-list 'dape-configs
               '(xcede
                 modes (swift-mode swift-ts-mode)
                 ensure dape-ensure-command
                 command (expand-file-name "~/.local/bin/xcede")
                 command-cwd dape-command-cwd
                 :type "Swift"
                 :request "launch"
                 :cwd dape-cwd
                 :program "xcede:")))

;; Configure flymake visuals
(use-package flymake
  :ensure nil ;; built-in package
  :custom
  (flymake-show-diagnostics-at-end-of-line 'fancy))
