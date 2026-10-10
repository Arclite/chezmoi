;; Eshell customizations

;; Custom prompt function
(defun pado:eshell-prompt ()
  "Custom eshell prompt showing current directory name"
  (concat
   (car (last (split-string (eshell/pwd) "/" t)))
   (propertize " »" 'face `(:foreground "#b6b3eb"))
   (propertize " " 'face 'default)))

;; Function to colorize compilation buffers.
;; ansi-color keeps per-buffer state in `ansi-color-context-region'; that state
;; occasionally gets corrupted (its marker slot ends up holding a plain
;; integer), after which every `compilation-filter-hook' call throws
;; "Wrong type argument: markerp, N" until the buffer is recreated.  Binding it
;; to nil makes each call stateless -- the same immunity helm's ansi-color
;; reimplementation and envrc rely on -- so the corruption can never accumulate.
;; Tradeoff: an SGR sequence split across two output chunks won't carry over,
;; which is rare and cosmetic for compilation output.
(defun colorize-compilation-buffer ()
  (let ((inhibit-read-only t)
        (ansi-color-context-region nil))
    (ansi-color-apply-on-region compilation-filter-start (point))))

;; Configure eshell
(use-package eshell
  :ensure nil  ;; built-in package
  :hook (eshell-mode . (lambda ()
                         (setenv "TERM" "eshell")
                         (add-hook 'eshell-output-filter-functions
                                   (lambda ()
                                     (ansi-osc-apply-on-region
                                      eshell-last-output-start
                                      eshell-last-output-end))
                                   nil t)))
  :config
  (setq eshell-prompt-function 'pado:eshell-prompt)
  (setq eshell-prompt-regexp "^[^»]* » ")
  (setenv "FORCE_COLORS" "true")
  (setq comint-terminfo-terminal "eshell"))

;; Add ANSI color support to compilation buffers
(use-package ansi-color
  :ensure nil  ;; built-in package
  :hook (compilation-filter . colorize-compilation-buffer))

;; Add ANSI link support to compilation buffers
(defun linkify-compilation-buffer ()
  (let ((inhibit-read-only t))
    (condition-case nil
        (ansi-osc-apply-on-region compilation-filter-start (point))
      (error
       (setq ansi-osc--marker nil)
       (ignore-errors
         (ansi-osc-apply-on-region compilation-filter-start (point)))))))

(use-package ansi-osc
  :ensure nil
  :hook (compilation-filter . linkify-compilation-buffer))

;; Scroll compilation buffer automatically
(setq compilation-scroll-output t)
