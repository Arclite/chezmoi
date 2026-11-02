;; Agent Shell for communicating with Claude Code

(use-package shell-maker
  :ensure t)

(use-package acp
  :vc (:url "https://github.com/xenodium/acp.el"))

(use-package agent-shell
  :vc (:url "https://github.com/xenodium/agent-shell")
  :ensure t
  :ensure-system-package ((claude . "curl -fsSL https://claude.ai/install.sh | bash")
                          (claude-agent-acp . "npm i -g @agentclientprotocol/claude-agent-acp"))
  :config
  (setq agent-shell-header-style nil
        agent-shell-preferred-agent-config (agent-shell-anthropic-make-claude-code-config)
        agent-shell-anthropic-default-session-mode-id "plan"
        agent-shell-context-sources '(files region error)))
