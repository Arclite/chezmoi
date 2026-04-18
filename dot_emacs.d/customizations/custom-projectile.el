;; Projectile customizations

(use-package projectile
  :init
  (projectile-mode +1)
  :bind-keymap
  ("s-p" . projectile-command-map)
  :bind (:map projectile-command-map
              ("p" . helm-projectile-switch-project))
  :custom
  (projectile-indexing-method 'hybrid) ;; Use hybrid indexing method
  (projectile-switch-project-action 'projectile-vc)

  :config
  ;; Add eshell commander method
  (def-projectile-commander-method ?e
    "Open an *eshell* buffer for the project"
    (projectile-run-eshell)))
