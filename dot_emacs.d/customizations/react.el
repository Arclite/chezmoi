;; React Native iOS file support

(use-package web-mode
  :mode "\\.ios.js\\'"
  :config
  (add-to-list 'web-mode-content-types-alist
               '("jsx" . "\\.ios.js\\'")))
