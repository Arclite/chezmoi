(defun tgo ()
  "Run the Tuist generate script"
  (interactive)
  (async-shell-command "./Scripts/generate.sh --open"))

(defun check ()
  "Run the check scripts"
  (interactive)
  (async-shell-command "./Scripts/swiftformat.sh")
  (async-shell-command "./Scripts/swiftlint.sh -x"))

(defun setup-java ()
  "Set the JAVA_HOME variable"
  (interactive)
  (setenv "JAVA_HOME" "/Applications/Android Studio.app/Contents/jbr/Contents/Home"))
