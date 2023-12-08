;; Set a custom prompt
(setq eshell-prompt-function
      (lambda ()
        (concat
         (car (last (split-string (eshell/pwd) "/" t)))
         (propertize " »" 'face `(:foreground "#b6b3eb"))
         (propertize " " 'face 'default))))

(setq eshell-prompt-regexp "^[^»]* » ")
