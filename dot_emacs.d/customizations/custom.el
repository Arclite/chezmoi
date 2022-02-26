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

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

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
