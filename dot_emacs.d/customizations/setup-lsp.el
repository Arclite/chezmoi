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

(require 'eglot)

;;; Swift

(add-to-list 'eglot-server-programs 
             `(swift-mode . (,(pado:sourcekit-lsp-path-xcrun-pwsh))))

(add-hook 'swift-mode-hook 'eglot-ensure)
(add-hook 'swift-mode-hook 'company-mode)

;;; TypeScript

(add-to-list 'eglot-server-programs
             '((typescript-mode) "typescript-language-server" "--stdio"))
(add-to-list 'eglot-server-programs
             '((typescript-ts-mode) "typescript-language-server" "--stdio"))
(add-to-list 'eglot-server-programs
             '((tsx-ts-mode) "typescript-language-server" "--stdio"))

(add-hook 'typescript-mode-hook 'eglot-ensure)
(add-hook 'typescript-mode-hook 'company-mode)
(add-hook 'typescript-mode-hook 'tree-sitter-hl-mode)

(add-hook 'typescript-ts-mode-hook 'eglot-ensure)
(add-hook 'typescript-ts-mode-hook 'company-mode)

(add-hook 'tsx-ts-mode-hook 'eglot-ensure)
(add-hook 'tsx-ts-mode-hook 'company-mode)

;;;  Astro

(define-derived-mode astro-mode web-mode "astro")
(setq auto-mode-alist
      (append '((".*\\.astro\\'" . astro-mode))
              auto-mode-alist))
(add-to-list 'eglot-server-programs
             '(astro-mode . ("astro-ls" "--stdio"
                             :initializationOptions
                             (:typescript (:tsdk "./node_modules/typescript/lib")))))
(add-hook 'astro-mode-hook 'eglot-ensure)
(add-hook 'astro-mode-hook 'company-mode)
(add-hook 'astro-mode-hook 'tree-sitter-hl-mode)
