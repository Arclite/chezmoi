(use-package swift-ts-mode
  :vc (:url "https://codeberg.org/woolsweater/swift-ts-mode.git"
       :branch "main")
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
