(setq org-replace-disputed-keys t)
(setq org-startup-indented t)
(setq org-tags-column 0)

;; Add agenda shortcuts
(global-set-key "\C-ca" 'org-agenda)
(setq org-agenda-custom-commands
      '(("v" tags-todo "+v1")))

;; Fixes for org-mode keybindings
(add-hook 'emacs-startup-hook
          '(lambda ()
             (define-key function-key-map "\e[1;10A" [M-S-up])
             (define-key function-key-map "\e[1;10B" [M-S-down])
             (define-key function-key-map "\e[1;10C" [M-S-right])
             (define-key function-key-map "\e[1;10D" [M-S-left])))
