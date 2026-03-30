(use-package swift-ts-mode
  :vc (:url "https://codeberg.org/woolsweater/swift-ts-mode.git"
       :branch "main")
  :ensure t
  :mode "\\.swift\\'"
  :hook ((swift-ts-mode . eglot-ensure)
         (swift-ts-mode . company-mode)))
