(defun tuist-generate ()
  "Generate a Tuist project in the current directory"
  (interactive)
  (call-process (getenv "SHELL") nil nil nil "-l" "-i" "-c" "tuist generate"))
