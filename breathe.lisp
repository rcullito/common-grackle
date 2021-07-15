(defparameter *gap* "    ")

(defun left-column (txt delim)
  (let ((end-of-left-column (search delim txt)))
    (subseq txt 0 end-of-left-column)))

(defun right-column (txt delim)
  (let* ((adjustment (length *gap*))
        (beginning-of-right-column (+ (search delim txt :from-end :backward)
                                      adjustment)))
    (subseq txt beginning-of-right-column)))

(with-open-file (my-stream "sample.txt" :direction :input)
  ;; todo split on blank space, and acc the left in one var and the right in another
  (let* ((current-line (read-line my-stream))
         (first-line (left-column current-line *gap*))
         (second-line (right-column current-line *gap*)))
    (cons first-line second-line)))
