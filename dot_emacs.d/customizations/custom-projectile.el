(setq projectile-switch-project-action 'projectile-commander)

(def-projectile-commander-method ?e
  "Open an *eshell* buffer for the project"
  (projectile-run-eshell))
