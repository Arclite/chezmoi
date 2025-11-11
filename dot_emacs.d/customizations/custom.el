;; Custom utility functions

(defun new-migration (name)
  (interactive "New migration name: ")
  (find-file (concat (format-time-string "%y%m%d%H%M%S") "-" name ".sql")))

;; UUID Generation
(defun uuidgen ()
  "Insert a UUID at cursor point."
  (interactive)
  (insert
   (replace-regexp-in-string
    "\n\\'" ""
    (downcase (shell-command-to-string "uuidgen")))))

;; General settings
(menu-bar-mode -1)
(setq tab-width 4)

;; Add commands for resizing windows
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<up>") 'shrink-window)
(global-set-key (kbd "S-C-<down>") 'enlarge-window)

;; Configure JSON mode
(use-package json-mode
  :mode "\\.geojson\\'")

;; Configure Ruby mode for fastlane files
(use-package ruby-mode
  :ensure nil  ;; built-in package
  :mode (("Fastfile\\'" . ruby-mode)
         ("Appfile\\'" . ruby-mode)
         ("Deliverfile\\'" . ruby-mode)
         ("Matchfile\\'" . ruby-mode)))

;; Key bindings for uncommon characters
(global-set-key (kbd "M-_") (lambda () (interactive) (insert-char #x2014)))

;; Ligature support
(let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
               (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
               (36 . ".\\(?:>\\)")
               (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
               (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
               (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
               (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
               (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
               (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
               (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
               (48 . ".\\(?:x[a-zA-Z]\\)")
               (58 . ".\\(?:::\\|[:=]\\)")
               (59 . ".\\(?:;;\\|;\\)")
               (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
               (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
               (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
               (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
               (91 . ".\\(?:]\\)")
               (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
               (94 . ".\\(?:=\\)")
               (119 . ".\\(?:ww\\)")
               (123 . ".\\(?:-\\)")
               (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
               (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)")
               )
             ))
 (dolist (char-regexp alist)
   (set-char-table-range composition-function-table (car char-regexp)
                         `([,(cdr char-regexp) 0 font-shape-gstring]))))
