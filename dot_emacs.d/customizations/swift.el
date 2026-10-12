;; swift-ts-mode and its grammar must be a MATCHED PAIR — the package probes the
;; grammar for an exact version-marker node, and newer grammars change node
;; structure (e.g. operator_declaration) that older package queries can't read.
;; Pinned pair: package v0.5.2  <->  tree-sitter-swifter grammar v0.9.21.
;; The grammar is a prebuilt dylib in ~/.emacs.d/tree-sitter/libtree-sitter-swift.dylib
;; from https://codeberg.org/woolsweater/tree-sitter-swifter/releases/tag/v0.9.21
;; (arch-specific: arm64/swift.dylib renamed to libtree-sitter-swift.dylib).
;; Do NOT bump the grammar past v0.9.21 without also bumping :rev below.
(use-package swift-ts-mode
  :vc (:url "https://codeberg.org/woolsweater/swift-ts-mode.git"
       :rev "v0.5.2")
  :ensure t
  :mode "\\.swift\\'"
  :custom ((swift-ts-basic-offset 4)
           (swift-ts-switch-case-offset 0)
           (swift-ts:align-multiline-string nil))
  :hook ((swift-ts-mode . eglot-ensure)
         (swift-ts-mode . company-mode)))

;; highlight xcbeautify errors/warnings in compile buffers
(add-to-list 'compilation-error-regexp-alist-alist
  '(xcbeautify-error "^❌ \\([^:]*\\):\\([0-9]*\\):\\([0-9]*\\):" 1 2 3 2))
(add-to-list 'compilation-error-regexp-alist-alist
  '(xcbeautify-warning "^⚠️ \\([^:]*\\):\\([0-9]*\\):\\([0-9]*\\):" 1 2 3 1))

(add-to-list 'compilation-error-regexp-alist 'xcbeautify-error)
(add-to-list 'compilation-error-regexp-alist 'xcbeautify-warning)

;; Auto-insert header
(defvar my/copyright-owner "Geoff Pado"
  "Name to use in copyright headers. Can be set via dir-locals.")
(put 'my/copyright-owner 'safe-local-variable #'stringp)

(use-package autoinsert
  :ensure nil ;; built-in package
  :init
  (auto-insert-mode 1)
  :config
  (setq auto-insert-query nil)
  (define-auto-insert '("\\.swift\\'" . "Swift header")
    '(
      "Short description: "
      "//  Copyright © "
      (format-time-string "%Y")
      " "
      my/copyright-owner
      ". All rights reserved." \n \n _ \n)))

;; highlight strings files
(use-package c-mode
  :ensure nil ;; built-in package
  :mode "\\.strings\\'")

(use-package flowdeck
  :vc (:url "git@github.com:Arclite/flowdeck.el.git"
       :branch "trunk")
  :ensure t
  :bind (:map projectile-command-map
              ("x f" . flowdeck-menu)
              ("x r" . flowdeck-run)
              ("x b" . flowdeck-build)
              ("x t" . flowdeck-test)))
