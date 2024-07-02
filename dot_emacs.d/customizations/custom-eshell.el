;; Set a custom prompt
(setq eshell-prompt-function
      (lambda ()
        (concat
         (car (last (split-string (eshell/pwd) "/" t)))
         (propertize " »" 'face `(:foreground "#b6b3eb"))
         (propertize " " 'face 'default))))

(setq eshell-prompt-regexp "^[^»]* » ")

(setenv "FORCE_COLORS" "true")

(add-hook 'eshell-mode-hook
          (lambda ()
            (setenv "TERM" "eshell")))
(setq comint-terminfo-terminal "eshell")

;; add ANSI color to compilation
(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (ansi-color-apply-on-region compilation-filter-start (point)))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

