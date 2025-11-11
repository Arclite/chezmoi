;; Configure Python with tree-sitter mode and LSP

;; Remap python-mode to use tree-sitter version
(add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode))

;; Configure Python with Eglot and Company
(use-package python
  :ensure nil  ;; built-in package
  :hook ((python-ts-mode . eglot-ensure)
         (python-ts-mode . company-mode))
  :config
  (add-to-list 'eglot-server-programs `(python-ts-mode . ("pylsp"))))
