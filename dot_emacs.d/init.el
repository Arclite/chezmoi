;;;;
;; Packages
;;;;

;; Start a server so multiple clients will use the same app
(server-start)

;; Really disable Org mode keys
(setq org-replace-disputed-keys t)

;; Define package repositories
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)

;; Download the ELPA archive description if needed.
;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
(when (not package-archive-contents)
  (package-refresh-contents))

;; The packages you want installed. You can also install these
;; manually with M-x package-install
;; Add in your own as you wish:
(defvar my-packages
  '(;; makes handling lisp expressions much, much easier
    ;; Cheatsheet: http://www.emacswiki.org/emacs/PareditCheatsheet
    paredit

    ;; key bindings and code colorization for Clojure
    ;; https://github.com/clojure-emacs/clojure-mode
    clojure-mode

    ;; extra syntax highlighting for clojure
    clojure-mode-extra-font-locking

    ;; allow ido usage in as many contexts as possible. see
    ;; customizations/navigation.el line 23 for a description
    ;; of ido
    ido-completing-read+

    ;; Enhances M-x to allow easier execution of commands. Provides
    ;; a filterable list of possible commands in the minibuffer
    ;; http://www.emacswiki.org/emacs/Smex
    smex

    ;; project navigation
    projectile

    ;; colorful parenthesis matching
    rainbow-delimiters

    ;; edit html tags like sexps
    tagedit

    ;; Clojure REPL
    cider

    ;; HTML editing mode
    web-mode

    ;; Swift LSP support
    lsp-mode
    lsp-ui
    lsp-sourcekit

    ;; fuzzy searching everywhere
    helm
    helm-projectile
    ))

;; On OS X, an Emacs instance started from the graphical user
;; interface will have a different environment than a shell in a
;; terminal window, because OS X does not run a shell during the
;; login. Obviously this will lead to unexpected results when
;; calling external utilities like make from Emacs.
;; This library works around this problem by copying important
;; environment variables from the user's shell.
;; https://github.com/purcell/exec-path-from-shell
(if (eq system-type 'darwin)
    (add-to-list 'my-packages 'exec-path-from-shell))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


;; Place downloaded elisp files in ~/.emacs.d/vendor. You'll then be able
;; to load them.
;;
;; For example, if you download yaml-mode.el to ~/.emacs.d/vendor,
;; then you can add the following code to this file:
;;
;; (require 'yaml-mode)
;; (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
;; 
;; Adding this code will make Emacs enter yaml mode whenever you open
;; a .yml file
(add-to-list 'load-path "~/.emacs.d/vendor")
(require 'cider)

;;;;
;; Customization
;;;;

;; Add a directory to our load path so that when you `load` things
;; below, Emacs knows where to look for the corresponding file.
(add-to-list 'load-path "~/.emacs.d/customizations")

;; Sets up exec-path-from-shell so that Emacs will use the correct
;; environment variables
(load "shell-integration.el")

;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.
(load "navigation.el")

;; These customizations change the way emacs looks and disable/enable
;; some user interface elements
(load "ui.el")

;; These customizations make editing a bit nicer.
(load "editing.el")

;; Hard-to-categorize customizations
(load "misc.el")

;; For editing lisps
(load "elisp-editing.el")

;; Language-specific
(load "setup-clojure.el")
(load "setup-js.el")
(load "setup-lsp.el")

(load "custom.el")
(load "custom-chewy.el")
(load "custom-eshell.el")
(load "custom-org.el")
(load "custom-helm.el")
(load "custom-projectile.el")
(load "tuist.el")

;; React bindings
(load "react.el")

(windmove-default-keybindings)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector [base00 base08 base0B base0A base0D base0E base0D base05])
 '(ansi-term-color-vector
   [unspecified base00 base08 base0B base0A base0D base0E base0D base05] t)
 '(coffee-tab-width 2)
 '(custom-enabled-themes '(base16-railscasts-dark))
 '(custom-safe-themes
   '("37f03344f4149084c114cc1dd22e84a39c461215bc5efa3b2e4436b262a684c3" "903f968f15cd2a31384aed15b19b0829fb522d55d65f57cbf537db7aa68284cc" "ffc1dd6a72e95bb96ae716294ad50626c1591bfb8bcf5b469b2715633393e1be" "e4a10b7efcc9a000640f3bf6c8fb6aaecd2b45dc8d0f9b9da5b76e0608e35afb" "58e3eee748d46010260d186de83dac3e604bbd1ba82f612505c1cb81016bc686" "4cc014287035b11d1f8d45af1ff18f3509496a760650d16c7771ac9bdf16b1a6" "1157a4055504672be1df1232bed784ba575c60ab44d8e6c7b3800ae76b42f8bd" "a44c10ddb98f92b1a2954605fbe33a2580018f84a9b7600bafd0e7b923e9934c" "0605cbf76b2036159589662fcb805f977eda290544fe05bd9336922deadfc26e" "85fd911e2772c640a4be63b9cb376f582a83b99da254062fee08a937e49d824b" "da73cda4430237a57b8f5b296b4d9b0a33149917d7b9419962cc1ac77ad6b5a5" "bea399ca68076b5278cfdd3f100716b6695f0cb50ca1eda9bce2da3530d69de1" "9fa9cf341cb811544a2348419da617581683f861df7340f2f651808a60ab2303" "f696a206c980e4c8babfe108dd5b8300d8fa8c4b6b3408d9093e7f5f1309b203" "4d43dd26ce70b600effa888b16b01f061bd9c82de04145e7916142b02e9f3667" "cf08ae4c26cacce2eebff39d129ea0a21c9d7bf70ea9b945588c1c66392578d1" "3380a2766cf0590d50d6366c5a91e976bdc3c413df963a0ab9952314b4577299" "0c3b1358ea01895e56d1c0193f72559449462e5952bded28c81a8e09b53f103f" "228a2fe88daadae6644e67483feb69fe13b8c7af67e1739a88a97f1469a12b24" "53dac8a9bcbec9508b679952b480fa6326ec6def585329f62fcc6298ed1fd38f" "448ec45244de9474c05c97e4c03999f5d2a04d250970d92ad5f7d4a2154f5e55" "df528560ee637b4e275d097ec6ec17f9e4dabc9377c70809ee0a630164690eea" "d96587ec2c7bf278269b8ec2b800c7d9af9e22d816827639b332b0e613314dfd" "eae831de756bb480240479794e85f1da0789c6f2f7746e5cc999370bbc8d9c8a" default))
 '(fci-rule-color "#393939")
 '(flycheck-lua-executable "/Users/pado/.asdf/shims/luac")
 '(flymake-luac-program "/Users/pado/.asdf/installs/lua/5.4.3/bin/luac")
 '(org-agenda-files '("~/Development/iOS/PlaygroundShare/shareplay.org"))
 '(org-startup-truncated nil)
 '(package-selected-packages
   '(typescript-mode tree-sitter-langs bazel helm-projectile helm eglot powershell go-mode docker flycheck flymake-quickdef flymake-lua lua-mode counsel-jq json-mode docker-compose-mode magit dash dracula-theme ac-cider cider yaxception yaml-mode web-mode tagedit swift-mode spinner sourcekit smex seq restclient relative-line-numbers rainbow-delimiters queue projectile paredit org markdown-mode log4e js2-mode javap-mode inf-ruby ido-ubiquitous exec-path-from-shell elm-mode dockerfile-mode company color-theme clojure-mode-extra-font-locking base16-theme android-mode adaptive-wrap))
 '(swift-mode:parenthesized-expression-offset 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
