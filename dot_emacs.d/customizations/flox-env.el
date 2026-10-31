;;; flox-env.el --- Per-project environments via direnv/Flox -*- lexical-binding: t; -*-
;;
;; Some dev projects activate a Flox developer environment through direnv
;; (.envrc runs `use flox'), which provides the PATH/env that the repo's
;; pre-commit Git hooks need.  `exec-path-from-shell' (shell-integration.el)
;; only copies the *global* shell PATH at startup, so Magit's `git' subprocess
;; can't see the project's Flox tools and the hooks fail.
;;
;; `envrc' runs `direnv export' per buffer and sets a buffer-local
;; `process-environment'/`exec-path', so commands launched from a project
;; buffer (Magit, compile, eglot, eshell) run inside that project's Flox env.
;; `inheritenv' (pulled in by envrc) carries the env into the async process
;; buffers Magit spawns.

(use-package envrc
  :ensure t
  ;; Enable AFTER exec-path-from-shell has established the global baseline.
  :hook (after-init . envrc-global-mode)
  :bind (:map envrc-mode-map
              ("C-c e" . envrc-command-map)))
