;; Modeline cleanup — kill always-on minor-mode lighters and trim Eglot's
;; segments down to the ones that actually surface useful info conditionally.

(use-package diminish
  :ensure t)

;; Diminish minor modes whose lighters add nothing but noise.
;; Each is wrapped so it only runs once the owning package loads.
(with-eval-after-load 'yasnippet  (diminish 'yas-minor-mode))
(with-eval-after-load 'company    (diminish 'company-mode))
(with-eval-after-load 'which-key  (diminish 'which-key-mode))
(with-eval-after-load 'eldoc      (diminish 'eldoc-mode))
(with-eval-after-load 'autorevert (diminish 'auto-revert-mode))
(with-eval-after-load 'paredit    (diminish 'paredit-mode))
(with-eval-after-load 'ws-butler  (diminish 'ws-butler-mode))
(with-eval-after-load 'helm-mode  (diminish 'helm-mode))
(with-eval-after-load 'projectile (diminish 'projectile-mode))
(with-eval-after-load 'subword    (diminish 'subword-mode))
(with-eval-after-load 'abbrev     (diminish 'abbrev-mode))

;; Eglot: drop the always-on menu icon and session label.
;; Keep the conditional segments — they only show when there's something to say.
(with-eval-after-load 'eglot
  (setq eglot-mode-line-format
        '(eglot-mode-line-error
          eglot-mode-line-pending-requests
          eglot-mode-line-progress
          eglot-mode-line-action-suggestion)))

;; Drop the literal "Flymake" label before the counter — the [E W I] numbers
;; speak for themselves. Keep the exception segment in case Flymake itself
;; misbehaves.
(with-eval-after-load 'flymake
  (setq flymake-mode-line-format
        '(" " flymake-mode-line-exception flymake-mode-line-counters)))

;; Strip the modeline down to:
;;   <modified marker> <buffer name>  (<major mode> [process] [minor modes])  <misc-info>
;;
;; Dropped from the default format: mule-info, client, remote, frame-id, the
;; "%12b" min-width padding around the buffer name, mode-line-position (line
;; number + scroll %), project info, and VC branch.
;;
;; Kept: mode-line-modified (shows "**"/"--"/"%%"), buffer name via "%b",
;; mode-line-modes (major mode + process status + minor-mode lighters, which
;; is where Flymake's counter and Eglot's conditional segments live), and
;; mode-line-misc-info (where global "shows up sometimes" indicators land).
(setq-default mode-line-format
              '("%e "
                mode-line-modified
                " %b  "
                mode-line-modes
                mode-line-misc-info))
