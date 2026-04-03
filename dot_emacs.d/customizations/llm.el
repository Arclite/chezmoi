;; GPTel configuration for LLM integration

(use-package gptel
  :config
  ;; Create Claude 3.5 Sonnet backend
  (setq gptel-model 'claude-3-sonnet-20240229
        gptel-backend (gptel-make-anthropic "Claude"
                        :stream t
                        :key gptel-api-key)))

;; Agent Shell for communicating with Claude Code

(use-package agent-shell
    :ensure t
    :ensure-system-package ((claude . "curl -fsSL https://claude.ai/install.sh | bash")
                            (claude-agent-acp . "npm i -g @agentclientprotocol/claude-agent-acp"))
    :config
    (setq agent-shell-header-style nil)
    (setq agent-shell-preferred-agent-config (agent-shell-anthropic-make-claude-code-config))
    (setq agent-shell-anthropic-default-session-mode-id "plan"))
