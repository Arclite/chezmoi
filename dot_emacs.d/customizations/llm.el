;; GPTel configuration for LLM integration

(use-package gptel
  :config
  ;; Create Claude 3.5 Sonnet backend
  (setq gptel-model 'claude-3-sonnet-20240229
        gptel-backend (gptel-make-anthropic "Claude"
                        :stream t
                        :key gptel-api-key)))
