;;; helm-file-matcher.el --- Custom matching for helm-projectile-find-file -*- lexical-binding: t; -*-
;;
;; Replaces helm's fuzzy matcher for the projectile file sources with one that:
;;
;; 1. Prefers contiguous matches.  "MetricChart" ranks
;;    MetricChartDetailView.swift above MetricChangeArtifact.swift, because
;;    the first contains the query as one unbroken run.
;; 2. Treats "/" (and whitespace) in the query as separators.  Each piece is
;;    matched on its own, in order, so "Tuist/MetricChart" matches
;;    Tuist/ProjectDescriptionHelpers/Modules/MetricChartDetailView.swift.
;; 3. Prefers matches near the end of the path.  Pieces are matched
;;    right-to-left, taking the last occurrence, and a match inside the file
;;    name beats one in a directory name.
;;
;; Each piece is smart-case: case-insensitive unless it contains an uppercase
;; letter.

(require 'cl-lib)
(require 'subr-x)

(defvar pado/hfm--candidates nil
  "Vector of [DISPLAY REAL PLAIN REVERSED REVERSED-DOWNCASED SLASH] entries.
SLASH is the index of the last \"/\" in PLAIN, or -1.")

(defun pado/hfm--boundary-p (str i)
  "Non-nil if index I of STR starts a word."
  (or (= i 0)
      (let ((prev (aref str (1- i)))
            (cur (aref str i)))
        (or (memq prev '(?/ ?_ ?- ?. ?\s))
            (and (<= ?a prev ?z) (<= ?A cur ?Z))))))

(defun pado/hfm--match-piece (rev piece-rev start)
  "Match reversed PIECE-REV in reversed string REV, searching from START.
Returns a list of (POS . LEN) chunks in reversed coordinates, or nil.
Greedily takes the longest contiguous run each step; if that paints itself
into a corner, falls back to a plain char-by-char match."
  (let ((m (length piece-rev))
        (pos start) (i 0) chunks)
    (while (and i (< i m))
      (let ((k (- m i)) found)
        (while (and (> k 0) (not found))
          (if-let* ((j (string-search (substring piece-rev i (+ i k)) rev pos)))
              (setq found (cons j k))
            (setq k (1- k))))
        (if found
            (setq chunks (cons found chunks)
                  pos (+ (car found) (cdr found))
                  i (+ i (cdr found)))
          (setq i nil))))
    (if i
        (nreverse chunks)
      ;; Fallback: earliest position for every char.
      (setq pos start i 0 chunks nil)
      (while (and i (< i m))
        (if-let* ((j (string-search (string (aref piece-rev i)) rev pos)))
            (progn
              (if (and chunks (= j (+ (caar chunks) (cdar chunks))))
                  (setcdr (car chunks) (1+ (cdar chunks)))
                (push (cons j 1) chunks))
              (setq pos (1+ j) i (1+ i)))
          (setq i nil)))
      (and i (nreverse chunks)))))

(defun pado/hfm--score-piece (plain chunks last-piece slash)
  "Score CHUNKS, a list of (START . END) in PLAIN, sorted ascending."
  (let* ((start (caar chunks))
         (end (cdar (last chunks)))
         (len (cl-loop for (s . e) in chunks sum (- e s)))
         (gap (- end start len))
         (score 0))
    ;; Fragmentation is the main penalty.
    (cl-decf score (* 50 (1- (length chunks))))
    (cl-decf score (min gap 20))
    ;; Spreading one piece across directories breaks the name apart.
    (when (string-search "/" (substring plain start end))
      (cl-decf score 50))
    (when (pado/hfm--boundary-p plain start)
      (cl-incf score 15))
    (dolist (c (cdr chunks))
      (when (pado/hfm--boundary-p plain (car c))
        (cl-incf score 5)))
    (when (and last-piece (> start slash))
      (cl-incf score 25)                ; in the file name
      (when (= start (1+ slash))
        (cl-incf score 10)))            ; at the start of the file name
    score))

(defun pado/hfm--match (entry pieces)
  "Match PIECES against ENTRY.  Returns (SCORE DIST LEN CHUNKS) or nil."
  (let* ((plain (aref entry 2))
         (n (length plain))
         (slash (aref entry 5))
         (pos 0) (score 0) (all-chunks nil) (dist nil)
         (last-piece t))
    ;; Pieces are matched right-to-left so the last piece claims the
    ;; occurrence closest to the end of the path.
    (cl-loop for (piece-rev . fold) in pieces
             for rev = (aref entry (if fold 4 3))
             for rchunks = (pado/hfm--match-piece rev piece-rev pos)
             unless rchunks return (setq score nil)
             do (let ((chunks (nreverse
                               (mapcar (lambda (c)
                                         (cons (- n (car c) (cdr c))
                                               (- n (car c))))
                                       rchunks))))
                  (when last-piece
                    (setq dist (- n (cdar (last chunks)))))
                  (cl-incf score (pado/hfm--score-piece plain chunks last-piece slash))
                  (setq all-chunks (append chunks all-chunks)
                        pos (let ((c (car (last rchunks)))) (+ (car c) (cdr c)))
                        last-piece nil)))
    (when score
      (list score dist n all-chunks))))

(defun pado/hfm--prefilter (rev-down chars)
  "Cheap necessary condition: CHARS (reversed, downcased) occur in order."
  (let ((pos 0))
    (cl-loop for c across chars
             always (setq pos (when-let* ((j (string-search (string c) rev-down pos)))
                                (1+ j))))))

(defun pado/hfm--parse (pattern)
  "Split PATTERN into pieces, last first, as (REVERSED . CASE-FOLD) pairs."
  (nreverse
   (mapcar (lambda (p)
             (let ((fold (string= p (downcase p))))
               (cons (reverse p) fold)))
           (split-string pattern "[/[:space:]]+" t))))

(defun pado/hfm--highlight (display chunks)
  (let ((s (copy-sequence display)))
    (dolist (c chunks s)
      (when (<= (cdr c) (length s))
        (add-face-text-property (car c) (cdr c) 'helm-match nil s)))))

(defun pado/hfm-candidates ()
  "Dynamic candidates function: match and rank against `helm-pattern'."
  (let ((pattern (string-trim helm-pattern)))
    (if (string-empty-p pattern)
        (cl-loop for e across pado/hfm--candidates
                 collect (cons (aref e 0) (aref e 1)))
      (let* ((pieces (pado/hfm--parse pattern))
             (chars (reverse (downcase (replace-regexp-in-string
                                        "[/[:space:]]+" "" pattern))))
             (results
              (cl-loop for e across pado/hfm--candidates
                       for m = (and (pado/hfm--prefilter (aref e 4) chars)
                                    (pado/hfm--match e pieces))
                       when m collect (cons m e))))
        (setq results
              (sort results
                    (lambda (a b)
                      (let ((ma (car a)) (mb (car b)))
                        (cond ((/= (nth 0 ma) (nth 0 mb)) (> (nth 0 ma) (nth 0 mb)))
                              ((/= (nth 1 ma) (nth 1 mb)) (< (nth 1 ma) (nth 1 mb)))
                              ((/= (nth 2 ma) (nth 2 mb)) (< (nth 2 ma) (nth 2 mb)))
                              (t (string< (aref (cdr a) 2) (aref (cdr b) 2))))))))
        (cl-loop for (m . e) in results
                 collect (cons (pado/hfm--highlight (aref e 0) (nth 3 m))
                               (aref e 1)))))))

(defun pado/hfm-init ()
  "Collect project files once per helm session."
  (setq pado/hfm--candidates
        (when (projectile-project-p)
          (with-temp-buffer
            (hack-dir-local-variables-non-file-buffer)
            (vconcat
             (mapcar (lambda (pair)
                       (let* ((plain (substring-no-properties (car pair)))
                              (rev (reverse plain)))
                         (vector (car pair) (cdr pair) plain rev (downcase rev)
                                 (or (cl-position ?/ plain :from-end t) -1))))
                     (helm-projectile--files-display-real
                      (projectile-current-project-files)
                      (projectile-project-root))))))))

(defun pado/hfm-install ()
  "Rebuild helm-projectile's file sources to use this matcher."
  (setq helm-source-projectile-files-list
        (helm-make-source "Projectile files" 'helm-source-projectile-file
          :init #'pado/hfm-init
          :candidates #'pado/hfm-candidates
          :match-dynamic t
          :fuzzy-match nil
          :nohighlight t)
        helm-source-projectile-files-other-window-list
        (helm-make-source "Projectile files" 'helm-source-projectile-file-other-window
          :init #'pado/hfm-init
          :candidates #'pado/hfm-candidates
          :match-dynamic t
          :fuzzy-match nil
          :nohighlight t)
        helm-source-projectile-files-other-frame-list
        (helm-make-source "Projectile files" 'helm-source-projectile-file-other-frame
          :init #'pado/hfm-init
          :candidates #'pado/hfm-candidates
          :match-dynamic t
          :fuzzy-match nil
          :nohighlight t)))
