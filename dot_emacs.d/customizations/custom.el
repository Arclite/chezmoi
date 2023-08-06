(defun new-migration (name) 
  (interactive "New migration name: ")
  (find-file (concat (format-time-string "%y%m%d%H%M%S") "-" name ".sql")))

(menu-bar-mode -1)

(setq tab-width 4)

(set-face-attribute 'default nil
                    :family "InputMonoNarrow"
                    :height 180
                    :weight 'ultra-light)

;; Improve Org mode
(setq org-replace-disputed-keys t)
(setq org-startup-indented t)
(setq org-tags-column 0)

;; Add commands for resizing windows
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<up>") 'shrink-window)
(global-set-key (kbd "S-C-<down>") 'enlarge-window)

;; UUID Generation
(defun uuidgen ()
  "Insert a UUID at cursor point."
  (interactive)
  (insert
   (replace-regexp-in-string
    "\n\\'" ""
    (downcase (shell-command-to-string "uuidgen")))))

;; Custom file types
(add-to-list 'auto-mode-alist '("\\.geojson\\'" . json-mode))

(add-to-list 'auto-mode-alist '("Fastfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Appfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Deliverfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Matchfile\\'" . ruby-mode))

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
