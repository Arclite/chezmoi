;; Projectile customizations

(use-package projectile
  :init
  (projectile-mode +1)
  :bind-keymap
  ("s-p" . projectile-command-map)
  :bind (:map projectile-command-map
              ("p" . helm-projectile-switch-project))
  :config
  ;; Use hybrid indexing method
  (setq projectile-indexing-method 'hybrid)
  (setq projectile-switch-project-action 'projectile-vc)

  ;; Add eshell commander method
  (def-projectile-commander-method ?e
    "Open an *eshell* buffer for the project"
    (projectile-run-eshell))

  ;; Register Tuist project type
  (projectile-register-project-type 'tuist '("Project.swift")
                                    :project-file "Project.swift"
                                    :compile "mise run generate"))
