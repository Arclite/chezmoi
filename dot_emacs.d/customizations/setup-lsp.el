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
  ((dape-cwd-function #'projectile-project-root)
   (dape-request-timeout 60))
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
                 :program "xcede:"))
  (add-to-list 'dape-configs
               '(playdate
                 modes (swift-mode swift-ts-mode)
                 ensure dape-ensure-command
                 command (lambda ()
                           (let* ((default-directory (dape-cwd))
                                  (swift (string-trim
                                          (shell-command-to-string "mise which swift")))
                                  (root (file-name-directory
                                         (directory-file-name
                                          (file-name-directory swift)))))
                             (expand-file-name "usr/bin/lldb-dap" root)))
                 command-cwd dape-command-cwd
                 :type "lldb-dap"
                 :request "launch"
                 :cwd dape-cwd
                 :program (lambda ()
                            (expand-file-name
                             "bin/Playdate Simulator.app/Contents/MacOS/Playdate Simulator"
                             (or (getenv "PLAYDATE_SDK_PATH")
                                 (expand-file-name "~/Developer/PlaydateSDK/"))))
                 :args (lambda ()
                         (let ((pdx (car (file-expand-wildcards
                                          (expand-file-name
                                           ".build/plugins/PDCPlugin/outputs/*.pdx"
                                           (dape-cwd))))))
                           (if pdx (vector pdx) (vector)))))))

;; Configure flymake visuals
(use-package flymake
  :ensure nil ;; built-in package
  :custom
  (flymake-show-diagnostics-at-end-of-line 'fancy))
