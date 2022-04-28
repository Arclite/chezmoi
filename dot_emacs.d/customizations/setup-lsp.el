;; set some performance values
(setq read-process-output-max (* 1024 1024))
(setq gc-cons-threshold 100000000)

;; set up for Swift
(eval-after-load 'lsp-mode
  (progn
    (require 'lsp-sourcekit)
    (setq lsp-sourcekit-executable
          "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp")))

(add-hook 'swift-mode-hook (lambda () (lsp)))
