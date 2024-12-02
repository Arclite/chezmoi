(setq projectile-indexing-method 'hybrid)
(setq projectile-switch-project-action 'projectile-commander)

(def-projectile-commander-method ?e
  "Open an *eshell* buffer for the project"
  (projectile-run-eshell))

(projectile-register-project-type 'tuist '("Project.swift")
                                  :project-file "Project.swift"
				  :compile "burgerburgerburg generate")
