;; Sets up exec-path-from shell
;; https://github.com/purcell/exec-path-from-shell

;; Custom function for PowerShell support
(defun set-exec-path-from-powershell ()
  "Set up Emacs' `exec-path' and PATH environment variable to match
that used by the user's shell.

This is particularly useful under Mac OS X and macOS, where GUI
apps are not started from a shell."
  (let ((path-from-shell
         (replace-regexp-in-string
          "[ \t\n]*$" ""
          (with-temp-buffer
            (call-process (getenv "SHELL") nil t nil "-l" "-i" "-c" "Write-Output $Env:PATH")
            (buffer-string)))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(defun set-exec-path-from-shell ()
  (setq exec-path-from-shell-debug t)
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-envs
   '("PATH")))

(defun exec-path-from-shell--standard-shell-p--including-pwsh (shell)
  "Return non-nil iff SHELL supports the standard ${VAR-default} syntax."
  (not (string-match "\\(fish\\|t?csh\\|pwsh\\)$" shell)))
;; (advice-add 'exec-path-from-shell--standard-shell-p :override #'exec-path-from-shell--standard-shell-p--including-pwsh)

;; Configure exec-path-from-shell package
(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
  :config
  ;; Use PowerShell-specific function if PowerShell is the shell
  (if (string-match "\\(pwsh\\)$" (getenv "SHELL"))
      (set-exec-path-from-powershell)
    (set-exec-path-from-shell))
  (let ((shims (expand-file-name "~/.local/share/mise/shims")))
    (setenv "PATH" (concat shims path-separator (getenv "PATH")))
    (add-to-list 'exec-path shims)))

;; Configure ripgrep executable path
(use-package rg
  :config
  (setq rg-executable "/opt/homebrew/bin/rg"))

;; Fix C compiler environment variable
(setenv "CC" "/usr/bin/clang")
