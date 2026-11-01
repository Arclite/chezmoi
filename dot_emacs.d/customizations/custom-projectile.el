;; Projectile customizations

(use-package rg
  :init
  (rg-enable-default-bindings)
  :ensure t)

(use-package projectile
  :init
  (projectile-mode +1)
  :bind-keymap
  ("s-p" . projectile-command-map)
  :bind (:map projectile-command-map
              ("p" . helm-projectile-switch-project)
              ("s r" . rg-project))
  :custom
  (projectile-indexing-method 'hybrid) ;; Use hybrid indexing method
  (projectile-switch-project-action 'projectile-vc))
