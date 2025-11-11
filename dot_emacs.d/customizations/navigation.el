;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.

;; "When several buffers visit identically-named files,
;; Emacs must give the buffers distinct names. The usual method
;; for making buffer names unique adds '<2>', '<3>', etc. to the end
;; of the buffer names (all but one of them).
;; The forward naming method includes part of the file's directory
;; name at the beginning of the buffer name
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Uniquify.html
(use-package uniquify
  :ensure nil  ;; built-in package
  :config
  (setq uniquify-buffer-name-style 'forward))

;; Turn on recent file mode so that you can more easily switch to
;; recently edited files when you first start emacs
(use-package recentf
  :ensure nil  ;; built-in package
  :config
  (setq recentf-save-file (concat user-emacs-directory ".recentf"))
  (setq recentf-max-menu-items 40)
  (recentf-mode 1))
