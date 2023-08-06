(deftheme base16-railscasts-dark
  "Created 2023-08-06.")

(custom-theme-set-variables
 'base16-railscasts-dark
 '(ansi-color-names-vector ["#2b2b2b" "#da4939" "#a5c261" "#ffc66d" "#6d9cbe" "#b6b3eb" "#6d9cbe" "#e6e1dc"])
 '(ansi-term-color-vector [unspecified "#2b2b2b" "#da4939" "#a5c261" "#ffc66d" "#6d9cbe" "#b6b3eb" "#6d9cbe" "#e6e1dc"]))

(custom-theme-set-faces
 'base16-railscasts-dark
 '(border ((t (:background "#5a647e"))))
 '(border-glyph ((t (nil))))
 '(cursor ((t (:background "#da4939"))))
 '(fringe ((t (:background "#3a4055"))))
 '(gui-element ((t (:background "#5a647e" :foreground "#f4f1ed"))))
 '(highlight ((t (:background "#272935"))))
 '(link ((t (:foreground "#6d9cbe"))))
 '(link-visited ((t (:foreground "#b6b3eb"))))
 '(minibuffer-prompt ((t (:foreground "#6d9cbe"))))
 '(mode-line ((t (:background "#3a4055" :foreground "#d4cfc9" :box nil))))
 '(mode-line-buffer-id ((t (:foreground "#b6b3eb" :background nil))))
 '(mode-line-emphasis ((t (:foreground "#f4f1ed" :slant italic))))
 '(mode-line-highlight ((t (:foreground "#b6b3eb" :box nil :weight bold))))
 '(mode-line-inactive ((t (:background "#272935" :foreground "#5a647e" :box nil))))
 '(region ((t (:background "#3a4055"))))
 '(secondary-selection ((t (:background "#5a647e"))))
 '(error ((t (:foreground "#da4939" :weight bold))))
 '(warning ((t (:foreground "#cc7833" :weight bold))))
 '(success ((t (:foreground "#a5c261" :weight bold))))
 '(header-line ((t (:inherit mode-line :foreground "#b6b3eb" :background nil))))
 '(font-lock-builtin-face ((t (:foreground "#519f50"))))
 '(font-lock-comment-delimiter-face ((t (:foreground "#3a4055"))))
 '(font-lock-comment-face ((t (:foreground "#5a647e"))))
 '(font-lock-constant-face ((t (:foreground "#cc7833"))))
 '(font-lock-doc-face ((t (:foreground "#d4cfc9"))))
 '(font-lock-doc-string-face ((t (:foreground "#5a647e"))))
 '(font-lock-function-name-face ((t (:foreground "#6d9cbe"))))
 '(font-lock-keyword-face ((t (:foreground "#b6b3eb"))))
 '(font-lock-negation-char-face ((t (:foreground "#a5c261"))))
 '(font-lock-preprocessor-face ((t (:foreground "#6d9cbe"))))
 '(font-lock-regexp-grouping-backslash ((t (:foreground "#ffc66d"))))
 '(font-lock-regexp-grouping-construct ((t (:foreground "#b6b3eb"))))
 '(font-lock-string-face ((t (:foreground "#a5c261"))))
 '(font-lock-type-face ((t (:foreground "#ffc66d"))))
 '(font-lock-variable-name-face ((t (:foreground "#519f50"))))
 '(font-lock-warning-face ((t (:foreground "#da4939"))))
 '(linum ((t (:background "#272935" :foreground "#5a647e"))))
 '(match ((t (:foreground "#6d9cbe" :background "#272935" :inverse-video t))))
 '(isearch ((t (:foreground "#ffc66d" :background "#272935" :inverse-video t))))
 '(isearch-lazy-highlight-face ((t (:foreground "#519f50" :background "#272935" :inverse-video t))))
 '(isearch-fail ((t (:background "#272935" :inherit font-lock-warning-face :inverse-video t))))
 '(flymake-warnline ((t (:underline "#cc7833" :background "#272935"))))
 '(flymake-errline ((t (:underline "#da4939" :background "#272935"))))
 '(clojure-test-failure-face ((t (:background nil :inherit flymake-warnline))))
 '(clojure-test-error-face ((t (:background nil :inherit flymake-errline))))
 '(clojure-test-success-face ((t (:background nil :foreground nil :underline "#a5c261"))))
 '(clojure-keyword ((t (:foreground "#ffc66d"))))
 '(clojure-parens ((t (:foreground "#f4f1ed"))))
 '(clojure-braces ((t (:foreground "#a5c261"))))
 '(clojure-brackets ((t (:foreground "#ffc66d"))))
 '(clojure-double-quote ((t (:foreground "#519f50" :background nil))))
 '(clojure-special ((t (:foreground "#6d9cbe"))))
 '(clojure-java-call ((t (:foreground "#b6b3eb"))))
 '(mmm-code-submode-face ((t (:background "#5a647e"))))
 '(mmm-comment-submode-face ((t (:inherit font-lock-comment-face))))
 '(mmm-output-submode-face ((t (:background "#5a647e"))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#b6b3eb"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#6d9cbe"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#519f50"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#a5c261"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#ffc66d"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#cc7833"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#da4939"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#5a647e"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "#e6e1dc"))))
 '(ido-subdir ((t (:foreground "#d4cfc9"))))
 '(ido-first-match ((t (:foreground "#cc7833" :weight bold))))
 '(ido-only-match ((t (:foreground "#da4939" :weight bold))))
 '(ido-indicator ((t (:foreground "#da4939" :background "#272935"))))
 '(ido-virtual ((t (:foreground "#d4cfc9"))))
 '(which-func ((t (:foreground "#6d9cbe" :background nil :weight bold))))
 '(trailing-whitespace ((t (:background "#519f50" :foreground "#ffc66d"))))
 '(whitespace-empty ((t (:foreground "#da4939" :background "#ffc66d"))))
 '(whitespace-hspace ((t (:background "#d4cfc9" :foreground "#d4cfc9"))))
 '(whitespace-indentation ((t (:background "#ffc66d" :foreground "#da4939"))))
 '(whitespace-line ((t (:background "#272935" :foreground "#bc9458"))))
 '(whitespace-newline ((t (:foreground "#d4cfc9"))))
 '(whitespace-space ((t (:background "#272935" :foreground "#d4cfc9"))))
 '(whitespace-space-after-tab ((t (:background "#ffc66d" :foreground "#da4939"))))
 '(whitespace-space-before-tab ((t (:background "#cc7833" :foreground "#da4939"))))
 '(whitespace-tab ((t (:background "#d4cfc9" :foreground "#d4cfc9"))))
 '(whitespace-trailing ((t (:background "#da4939" :foreground "#ffc66d"))))
 '(show-paren-match ((t (:background "#6d9cbe" :foreground "#5a647e"))))
 '(show-paren-mismatch ((t (:background "#cc7833" :foreground "#5a647e"))))
 '(paren-face-match ((t (:foreground nil :background nil :inherit show-paren-match))))
 '(paren-face-mismatch ((t (:foreground nil :background nil :inherit show-paren-mismatch))))
 '(paren-face-no-match ((t (:foreground nil :background nil :inherit show-paren-mismatch))))
 '(paren-face ((t (:foreground "#d4cfc9" :background nil))))
 '(sh-heredoc ((t (:foreground nil :inherit font-lock-string-face :weight normal))))
 '(sh-quoted-exec ((t (:foreground nil :inherit font-lock-preprocessor-face))))
 '(slime-highlight-edits-face ((t (:weight bold))))
 '(slime-repl-input-face ((t (:weight normal :underline nil))))
 '(slime-repl-prompt-face ((t (:underline nil :weight bold :foreground "#b6b3eb"))))
 '(slime-repl-result-face ((t (:foreground "#a5c261"))))
 '(slime-repl-output-face ((t (:foreground "#6d9cbe" :background "#272935"))))
 '(csv-separator-face ((t (:foreground "#cc7833"))))
 '(diff-added ((t (:foreground "#a5c261"))))
 '(diff-changed ((t (:foreground "#ffc66d"))))
 '(diff-removed ((t (:foreground "#da4939"))))
 '(diff-header ((t (:background "#272935"))))
 '(diff-file-header ((t (:background "#3a4055"))))
 '(diff-hunk-header ((t (:background "#272935" :foreground "#b6b3eb"))))
 '(ediff-even-diff-A ((t (:foreground nil :background nil :inverse-video t))))
 '(ediff-even-diff-B ((t (:foreground nil :background nil :inverse-video t))))
 '(ediff-odd-diff-A ((t (:foreground "#d4cfc9" :background nil :inverse-video t))))
 '(ediff-odd-diff-B ((t (:foreground "#d4cfc9" :background nil :inverse-video t))))
 '(eldoc-highlight-function-argument ((t (:foreground "#a5c261" :weight bold))))
 '(undo-tree-visualizer-default-face ((t (:foreground "#f4f1ed"))))
 '(undo-tree-visualizer-current-face ((t (:foreground "#a5c261" :weight bold))))
 '(undo-tree-visualizer-active-branch-face ((t (:foreground "#da4939"))))
 '(undo-tree-visualizer-register-face ((t (:foreground "#ffc66d"))))
 '(font-latex-bold-face ((t (:foreground "#a5c261"))))
 '(font-latex-doctex-documentation-face ((t (:background "#5a647e"))))
 '(font-latex-italic-face ((t (:foreground "#a5c261"))))
 '(font-latex-math-face ((t (:foreground "#cc7833"))))
 '(font-latex-sectioning-0-face ((t (:foreground "#ffc66d"))))
 '(font-latex-sectioning-1-face ((t (:foreground "#ffc66d"))))
 '(font-latex-sectioning-2-face ((t (:foreground "#ffc66d"))))
 '(font-latex-sectioning-3-face ((t (:foreground "#ffc66d"))))
 '(font-latex-sectioning-4-face ((t (:foreground "#ffc66d"))))
 '(font-latex-sectioning-5-face ((t (:foreground "#ffc66d"))))
 '(font-latex-sedate-face ((t (:foreground "#519f50"))))
 '(font-latex-string-face ((t (:foreground "#ffc66d"))))
 '(font-latex-verbatim-face ((t (:foreground "#cc7833"))))
 '(font-latex-warning-face ((t (:foreground "#da4939"))))
 '(diredp-compressed-file-suffix ((t (:foreground "#6d9cbe"))))
 '(diredp-dir-heading ((t (:foreground nil :background nil :inherit heading))))
 '(diredp-dir-priv ((t (:foreground "#519f50" :background nil))))
 '(diredp-exec-priv ((t (:foreground "#6d9cbe" :background nil))))
 '(diredp-executable-tag ((t (:foreground "#da4939" :background nil))))
 '(diredp-file-name ((t (:foreground "#ffc66d"))))
 '(diredp-file-suffix ((t (:foreground "#a5c261"))))
 '(diredp-flag-mark-line ((t (:background nil :inherit highlight))))
 '(diredp-ignored-file-name ((t (:foreground "#d4cfc9"))))
 '(diredp-link-priv ((t (:background nil :foreground "#b6b3eb"))))
 '(diredp-mode-line-flagged ((t (:foreground "#da4939"))))
 '(diredp-mode-line-marked ((t (:foreground "#a5c261"))))
 '(diredp-no-priv ((t (:background nil))))
 '(diredp-number ((t (:foreground "#ffc66d"))))
 '(diredp-other-priv ((t (:background nil :foreground "#b6b3eb"))))
 '(diredp-rare-priv ((t (:foreground "#da4939" :background nil))))
 '(diredp-read-priv ((t (:foreground "#a5c261" :background nil))))
 '(diredp-symlink ((t (:foreground "#b6b3eb"))))
 '(diredp-write-priv ((t (:foreground "#ffc66d" :background nil))))
 '(term-color-black ((t (:foreground "#3a4055" :background "#2b2b2b"))))
 '(term-color-white ((t (:foreground "#e6e1dc" :background "#f9f7f3"))))
 '(term-color-red ((t (:foreground "#da4939" :background "#da4939"))))
 '(term-color-yellow ((t (:foreground "#ffc66d" :background "#ffc66d"))))
 '(term-color-green ((t (:foreground "#a5c261" :background "#a5c261"))))
 '(term-color-cyan ((t (:foreground "#519f50" :background "#519f50"))))
 '(term-color-blue ((t (:foreground "#6d9cbe" :background "#6d9cbe"))))
 '(term-color-magenta ((t (:foreground "#b6b3eb" :background "#b6b3eb"))))
 '(magit-branch ((t (:foreground "#a5c261"))))
 '(magit-header ((t (:inherit nil :weight bold))))
 '(magit-item-highlight ((t (:inherit highlight :background nil))))
 '(magit-log-graph ((t (:foreground "#d4cfc9"))))
 '(magit-log-sha1 ((t (:foreground "#b6b3eb"))))
 '(magit-log-head-label-bisect-bad ((t (:foreground "#da4939"))))
 '(magit-log-head-label-bisect-good ((t (:foreground "#a5c261"))))
 '(magit-log-head-label-default ((t (:foreground "#ffc66d" :box nil :weight bold))))
 '(magit-log-head-label-local ((t (:foreground "#6d9cbe"))))
 '(magit-log-head-label-remote ((t (:foreground "#a5c261"))))
 '(magit-log-head-label-tags ((t (:foreground "#519f50" :box nil :weight bold))))
 '(magit-section-title ((t (:inherit diff-hunk-header))))
 '(link ((t (:foreground nil :underline t))))
 '(widget-button ((t (:underline t))))
 '(widget-field ((t (:background "#5a647e" :box (:line-width 1 :color "#f4f1ed")))))
 '(compilation-column-number ((t (:foreground "#ffc66d"))))
 '(compilation-line-number ((t (:foreground "#ffc66d"))))
 '(compilation-message-face ((t (:foreground "#6d9cbe"))))
 '(compilation-mode-line-exit ((t (:foreground "#a5c261"))))
 '(compilation-mode-line-fail ((t (:foreground "#da4939"))))
 '(compilation-mode-line-run ((t (:foreground "#6d9cbe"))))
 '(grep-context-face ((t (:foreground "#d4cfc9"))))
 '(grep-error-face ((t (:foreground "#da4939" :weight bold :underline t))))
 '(grep-hit-face ((t (:foreground "#6d9cbe"))))
 '(grep-match-face ((t (:foreground nil :background nil :inherit match))))
 '(regex-tool-matched-face ((t (:foreground nil :background nil :inherit match))))
 '(mm/master-face ((t (:inherit region :foreground nil :background nil))))
 '(mm/mirror-face ((t (:inherit region :foreground nil :background nil))))
 '(org-agenda-structure ((t (:foreground "#b6b3eb"))))
 '(org-agenda-date ((t (:foreground "#6d9cbe" :underline nil))))
 '(org-agenda-done ((t (:foreground "#a5c261"))))
 '(org-agenda-dimmed-todo-face ((t (:foreground "#d4cfc9"))))
 '(org-block ((t (:foreground "#cc7833"))))
 '(org-code ((t (:foreground "#ffc66d"))))
 '(org-column ((t (:background "#5a647e"))))
 '(org-column-title ((t (:inherit org-column :weight bold :underline t))))
 '(org-date ((t (:foreground "#b6b3eb" :underline t))))
 '(org-document-info ((t (:foreground "#519f50"))))
 '(org-document-info-keyword ((t (:foreground "#a5c261"))))
 '(org-document-title ((t (:weight bold :foreground "#cc7833" :height 1.44))))
 '(org-done ((t (:foreground "#a5c261"))))
 '(org-ellipsis ((t (:foreground "#d4cfc9"))))
 '(org-footnote ((t (:foreground "#519f50"))))
 '(org-formula ((t (:foreground "#da4939"))))
 '(org-hide ((t (:foreground "#5a647e"))))
 '(org-link ((t (:foreground "#6d9cbe"))))
 '(org-scheduled ((t (:foreground "#a5c261"))))
 '(org-scheduled-previously ((t (:foreground "#cc7833"))))
 '(org-scheduled-today ((t (:foreground "#a5c261"))))
 '(org-special-keyword ((t (:foreground "#cc7833"))))
 '(org-table ((t (:foreground "#b6b3eb"))))
 '(org-todo ((t (:foreground "#da4939"))))
 '(org-upcoming-deadline ((t (:foreground "#cc7833"))))
 '(org-warning ((t (:weight bold :foreground "#da4939"))))
 '(markdown-url-face ((t (:inherit link))))
 '(markdown-link-face ((t (:foreground "#6d9cbe" :underline t))))
 '(hl-sexp-face ((t (:background "#5a647e"))))
 '(highlight-80+ ((t (:background "#5a647e"))))
 '(py-builtins-face ((t (:foreground "#cc7833" :weight normal))))
 '(js2-warning-face ((t (:underline "#cc7833"))))
 '(js2-error-face ((t (:foreground nil :underline "#da4939"))))
 '(js2-external-variable-face ((t (:foreground "#b6b3eb"))))
 '(js2-function-param-face ((t (:foreground "#6d9cbe"))))
 '(js2-instance-member-face ((t (:foreground "#6d9cbe"))))
 '(js2-private-function-call-face ((t (:foreground "#da4939"))))
 '(js3-warning-face ((t (:underline "#cc7833"))))
 '(js3-error-face ((t (:foreground nil :underline "#da4939"))))
 '(js3-external-variable-face ((t (:foreground "#b6b3eb"))))
 '(js3-function-param-face ((t (:foreground "#6d9cbe"))))
 '(js3-jsdoc-tag-face ((t (:foreground "#cc7833"))))
 '(js3-jsdoc-type-face ((t (:foreground "#519f50"))))
 '(js3-jsdoc-value-face ((t (:foreground "#ffc66d"))))
 '(js3-jsdoc-html-tag-name-face ((t (:foreground "#6d9cbe"))))
 '(js3-jsdoc-html-tag-delimiter-face ((t (:foreground "#a5c261"))))
 '(js3-instance-member-face ((t (:foreground "#6d9cbe"))))
 '(js3-private-function-call-face ((t (:foreground "#da4939"))))
 '(nxml-name-face ((t (:foreground unspecified :inherit font-lock-constant-face))))
 '(nxml-attribute-local-name-face ((t (:foreground unspecified :inherit font-lock-variable-name-face))))
 '(nxml-ref-face ((t (:foreground unspecified :inherit font-lock-preprocessor-face))))
 '(nxml-delimiter-face ((t (:foreground unspecified :inherit font-lock-keyword-face))))
 '(nxml-delimited-data-face ((t (:foreground unspecified :inherit font-lock-string-face))))
 '(rng-error-face ((t (:underline "#da4939"))))
 '(erb-delim-face ((t (:background "#5a647e"))))
 '(erb-exec-face ((t (:background "#5a647e" :weight bold))))
 '(erb-exec-delim-face ((t (:background "#5a647e"))))
 '(erb-out-face ((t (:background "#5a647e" :weight bold))))
 '(erb-out-delim-face ((t (:background "#5a647e"))))
 '(erb-comment-face ((t (:background "#5a647e" :weight bold :slant italic))))
 '(erb-comment-delim-face ((t (:background "#5a647e"))))
 '(message-header-other ((t (:foreground nil :background nil :weight normal))))
 '(message-header-subject ((t (:inherit message-header-other :weight bold :foreground "#ffc66d"))))
 '(message-header-to ((t (:inherit message-header-other :weight bold :foreground "#cc7833"))))
 '(message-header-cc ((t (:inherit message-header-to :foreground nil))))
 '(message-header-name ((t (:foreground "#6d9cbe" :background nil))))
 '(message-header-newsgroups ((t (:foreground "#519f50" :background nil :slant normal))))
 '(message-separator ((t (:foreground "#b6b3eb"))))
 '(jabber-chat-prompt-local ((t (:foreground "#ffc66d"))))
 '(jabber-chat-prompt-foreign ((t (:foreground "#cc7833"))))
 '(jabber-chat-prompt-system ((t (:foreground "#ffc66d" :weight bold))))
 '(jabber-chat-text-local ((t (:foreground "#ffc66d"))))
 '(jabber-chat-text-foreign ((t (:foreground "#cc7833"))))
 '(jabber-chat-text-error ((t (:foreground "#da4939"))))
 '(jabber-roster-user-online ((t (:foreground "#a5c261"))))
 '(jabber-roster-user-xa ((t :foreground "#d4cfc9")))
 '(jabber-roster-user-dnd ((t :foreground "#ffc66d")))
 '(jabber-roster-user-away ((t (:foreground "#cc7833"))))
 '(jabber-roster-user-chatty ((t (:foreground "#b6b3eb"))))
 '(jabber-roster-user-error ((t (:foreground "#da4939"))))
 '(jabber-roster-user-offline ((t (:foreground "#d4cfc9"))))
 '(jabber-rare-time-face ((t (:foreground "#d4cfc9"))))
 '(jabber-activity-face ((t (:foreground "#b6b3eb"))))
 '(jabber-activity-personal-face ((t (:foreground "#519f50"))))
 '(gnus-cite-1 ((t (:inherit outline-1 :foreground nil))))
 '(gnus-cite-2 ((t (:inherit outline-2 :foreground nil))))
 '(gnus-cite-3 ((t (:inherit outline-3 :foreground nil))))
 '(gnus-cite-4 ((t (:inherit outline-4 :foreground nil))))
 '(gnus-cite-5 ((t (:inherit outline-5 :foreground nil))))
 '(gnus-cite-6 ((t (:inherit outline-6 :foreground nil))))
 '(gnus-cite-7 ((t (:inherit outline-7 :foreground nil))))
 '(gnus-cite-8 ((t (:inherit outline-8 :foreground nil))))
 '(gnus-header-content ((t (:inherit message-header-other))))
 '(gnus-header-subject ((t (:inherit message-header-subject))))
 '(gnus-header-from ((t (:inherit message-header-other-face :weight bold :foreground "#cc7833"))))
 '(gnus-header-name ((t (:inherit message-header-name))))
 '(gnus-button ((t (:inherit link :foreground nil))))
 '(gnus-signature ((t (:inherit font-lock-comment-face))))
 '(gnus-summary-normal-unread ((t (:foreground "#6d9cbe" :weight normal))))
 '(gnus-summary-normal-read ((t (:foreground "#f4f1ed" :weight normal))))
 '(gnus-summary-normal-ancient ((t (:foreground "#519f50" :weight normal))))
 '(gnus-summary-normal-ticked ((t (:foreground "#cc7833" :weight normal))))
 '(gnus-summary-low-unread ((t (:foreground "#d4cfc9" :weight normal))))
 '(gnus-summary-low-read ((t (:foreground "#d4cfc9" :weight normal))))
 '(gnus-summary-low-ancient ((t (:foreground "#d4cfc9" :weight normal))))
 '(gnus-summary-high-unread ((t (:foreground "#ffc66d" :weight normal))))
 '(gnus-summary-high-read ((t (:foreground "#a5c261" :weight normal))))
 '(gnus-summary-high-ancient ((t (:foreground "#a5c261" :weight normal))))
 '(gnus-summary-high-ticked ((t (:foreground "#cc7833" :weight normal))))
 '(gnus-summary-cancelled ((t (:foreground "#da4939" :background nil :weight normal))))
 '(gnus-group-mail-low ((t (:foreground "#d4cfc9"))))
 '(gnus-group-mail-low-empty ((t (:foreground "#d4cfc9"))))
 '(gnus-group-mail-1 ((t (:foreground nil :weight normal :inherit outline-1))))
 '(gnus-group-mail-2 ((t (:foreground nil :weight normal :inherit outline-2))))
 '(gnus-group-mail-3 ((t (:foreground nil :weight normal :inherit outline-3))))
 '(gnus-group-mail-4 ((t (:foreground nil :weight normal :inherit outline-4))))
 '(gnus-group-mail-5 ((t (:foreground nil :weight normal :inherit outline-5))))
 '(gnus-group-mail-6 ((t (:foreground nil :weight normal :inherit outline-6))))
 '(gnus-group-mail-1-empty ((t (:inherit gnus-group-mail-1 :foreground "#d4cfc9"))))
 '(gnus-group-mail-2-empty ((t (:inherit gnus-group-mail-2 :foreground "#d4cfc9"))))
 '(gnus-group-mail-3-empty ((t (:inherit gnus-group-mail-3 :foreground "#d4cfc9"))))
 '(gnus-group-mail-4-empty ((t (:inherit gnus-group-mail-4 :foreground "#d4cfc9"))))
 '(gnus-group-mail-5-empty ((t (:inherit gnus-group-mail-5 :foreground "#d4cfc9"))))
 '(gnus-group-mail-6-empty ((t (:inherit gnus-group-mail-6 :foreground "#d4cfc9"))))
 '(gnus-group-news-1 ((t (:foreground nil :weight normal :inherit outline-5))))
 '(gnus-group-news-2 ((t (:foreground nil :weight normal :inherit outline-6))))
 '(gnus-group-news-3 ((t (:foreground nil :weight normal :inherit outline-7))))
 '(gnus-group-news-4 ((t (:foreground nil :weight normal :inherit outline-8))))
 '(gnus-group-news-5 ((t (:foreground nil :weight normal :inherit outline-1))))
 '(gnus-group-news-6 ((t (:foreground nil :weight normal :inherit outline-2))))
 '(gnus-group-news-1-empty ((t (:inherit gnus-group-news-1 :foreground "#d4cfc9"))))
 '(gnus-group-news-2-empty ((t (:inherit gnus-group-news-2 :foreground "#d4cfc9"))))
 '(gnus-group-news-3-empty ((t (:inherit gnus-group-news-3 :foreground "#d4cfc9"))))
 '(gnus-group-news-4-empty ((t (:inherit gnus-group-news-4 :foreground "#d4cfc9"))))
 '(gnus-group-news-5-empty ((t (:inherit gnus-group-news-5 :foreground "#d4cfc9"))))
 '(gnus-group-news-6-empty ((t (:inherit gnus-group-news-6 :foreground "#d4cfc9"))))
 '(erc-direct-msg-face ((t (:foreground "#cc7833"))))
 '(erc-error-face ((t (:foreground "#da4939"))))
 '(erc-header-face ((t (:foreground "#f4f1ed" :background "#d4cfc9"))))
 '(erc-input-face ((t (:foreground "#a5c261"))))
 '(erc-keyword-face ((t (:foreground "#ffc66d"))))
 '(erc-current-nick-face ((t (:foreground "#a5c261"))))
 '(erc-my-nick-face ((t (:foreground "#a5c261"))))
 '(erc-nick-default-face ((t (:foreground "#b6b3eb" :weight normal))))
 '(erc-nick-msg-face ((t (:weight normal :foreground "#ffc66d"))))
 '(erc-notice-face ((t (:foreground "#d4cfc9"))))
 '(erc-pal-face ((t (:foreground "#cc7833"))))
 '(erc-prompt-face ((t (:foreground "#6d9cbe"))))
 '(erc-timestamp-face ((t (:foreground "#519f50"))))
 '(custom-variable-tag ((t (:foreground "#6d9cbe"))))
 '(custom-group-tag ((t (:foreground "#6d9cbe"))))
 '(custom-state ((t (:foreground "#a5c261"))))
 '(default ((t (:background "#2b2b2b" :foreground "#e6e1dc"))))
 '(helm-selection-line ((t (:distant-foreground "black" :inherit (highlight) :extend t))))
 '(helm-selection ((t (:extend t :background "#5a647e" :distant-foreground "black"))))
 '(helm-ff-file-extension ((t (:extend t :foreground "#b6b3eb")))))

(provide-theme 'base16-railscasts-dark)
