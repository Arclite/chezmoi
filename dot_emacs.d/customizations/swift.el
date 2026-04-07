(use-package swift-ts-mode
  :vc (:url "https://codeberg.org/woolsweater/swift-ts-mode.git"
       :branch "main")
  :ensure t
  :mode "\\.swift\\'"
  :hook ((swift-ts-mode . eglot-ensure)
         (swift-ts-mode . company-mode)))

;; highlight xcbeautify errors/warnings in compile buffers
(add-to-list 'compilation-error-regexp-alist-alist
  '(xcbeautify-error "^❌ \\([^:]*\\):\\([0-9]*\\):\\([0-9]*\\):" 1 2 3 2))
(add-to-list 'compilation-error-regexp-alist-alist
  '(xcbeautify-warning "^⚠️ \\([^:]*\\):\\([0-9]*\\):\\([0-9]*\\):" 1 2 3 1))

(add-to-list 'compilation-error-regexp-alist 'xcbeautify-error)
(add-to-list 'compilation-error-regexp-alist 'xcbeautify-warning)
