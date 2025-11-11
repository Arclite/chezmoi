;; javascript / html

;; Configure JavaScript mode
(use-package js-mode
  :ensure nil  ;; built-in package
  :mode "\\.js\\'"
  :hook (js-mode . subword-mode)
  :config
  (setq js-indent-level 2))

;; Configure HTML mode
(use-package sgml-mode
  :ensure nil  ;; built-in package
  :hook (html-mode . subword-mode))

;; Configure tagedit for HTML tag editing
(use-package tagedit
  :after sgml-mode
  :hook (html-mode . tagedit-mode)
  :config
  (tagedit-add-paredit-like-keybindings))

;; Configure TypeScript with tree-sitter
(use-package typescript-mode
  :mode (("\\.ts\\'" . typescript-ts-mode)
         ("\\.tsx\\'" . tsx-ts-mode)))
