(defparameter *gap* "    ")

(with-open-file (my-stream "sample.txt" :direction :input)
  ;; todo split on blank space, and acc the left in one var and the right in another
  (position #\space (read-line my-stream)))


(with-open-file (my-stream "sample.txt" :direction :input)
  ;; todo split on blank space, and acc the left in one var and the right in another
  (coerce (read-line my-stream) 'list))

(with-open-file (my-stream "sample.txt" :direction :input)
  ;; todo split on blank space, and acc the left in one var and the right in another
  (let* ((current-line (read-line my-stream))
         (end-of-left-column (search "    "  current-line))
         (beginning-of-right-column (+ (search *gap* current-line :from-end :backward) (length *gap*)))
         (first-line (subseq current-line 0 end-of-left-column))
         (second-line (subseq current-line beginning-of-right-column)))
    (cons first-line second-line)))
