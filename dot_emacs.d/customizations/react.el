(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.ios.js\\'" . web-mode))

(setq web-mode-content-types-alist
      '(("jsx" . "\\.ios.js\\'")))
