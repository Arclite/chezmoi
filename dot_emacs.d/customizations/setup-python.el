(add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode))
(add-to-list 'eglot-server-programs `(python-ts-mode . ("pylsp")))

(add-hook 'python-ts-mode-hook 'eglot-ensure)
(add-hook 'python-ts-mode-hook 'company-mode)
