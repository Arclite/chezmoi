;; Kotlin support: kotlin-ts-mode + JetBrains kotlin-lsp via Eglot.
;;
;; Grammar: ~/.emacs.d/tree-sitter/libtree-sitter-kotlin.dylib, built from
;; https://github.com/fwcd/tree-sitter-kotlin (M-x treesit-install-language-grammar).
;;
;; LSP: https://github.com/Kotlin/kotlin-lsp, unpacked into
;; ~/.local/share/kotlin-lsp and symlinked to ~/.local/bin/kotlin-lsp
;; (-> bin/intellij-server). The Homebrew formula's download URL is broken.

(defvar pado:kotlin-lsp-program (expand-file-name "~/.local/bin/kotlin-lsp")
  "Path to the JetBrains Kotlin language server.")

(use-package kotlin-ts-mode
  :ensure t
  :mode "\\.kts?\\'"
  :custom ((kotlin-ts-mode-indent-offset 4))
  :hook ((kotlin-ts-mode . eglot-ensure)
         (kotlin-ts-mode . company-mode))
  :bind (:map kotlin-ts-mode-map
              ("C-c t t" . kotlin-ts-mode-goto-test-file)
              ("C-c t c" . kotlin-ts-mode-run-current-test-class)
              ("C-c t f" . kotlin-ts-mode-run-current-test-function)))

(with-eval-after-load 'eglot
  ;; Eglot's built-in entry points at the deprecated fwcd kotlin-language-server
  (add-to-list 'eglot-server-programs
               `(kotlin-ts-mode . (,pado:kotlin-lsp-program "--stdio"))))

;; highlight kotlinc/Gradle errors/warnings in compile buffers. Handles both
;;   e: file:///path/Foo.kt:12:5 message     (Kotlin 2.x)
;;   e: /path/Foo.kt: (12, 5): message       (Kotlin 1.x)
(add-to-list 'compilation-error-regexp-alist-alist
  '(kotlin-error "^e: \\(?:file://\\)?\\([^:\n]+\\.kts?\\):\\(?: (\\)?\\([0-9]+\\)\\(?::\\|, \\)\\([0-9]+\\)" 1 2 3 2))
(add-to-list 'compilation-error-regexp-alist-alist
  '(kotlin-warning "^w: \\(?:file://\\)?\\([^:\n]+\\.kts?\\):\\(?: (\\)?\\([0-9]+\\)\\(?::\\|, \\)\\([0-9]+\\)" 1 2 3 1))

(add-to-list 'compilation-error-regexp-alist 'kotlin-error)
(add-to-list 'compilation-error-regexp-alist 'kotlin-warning)

;; Auto-insert header (my/copyright-owner is defined in swift.el)
(with-eval-after-load 'autoinsert
  (define-auto-insert '("\\.kt\\'" . "Kotlin header")
    '(
      "Short description: "
      "//  Copyright © "
      (format-time-string "%Y")
      " "
      my/copyright-owner
      ". All rights reserved." \n \n _ \n)))
