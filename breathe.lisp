(defparameter *gap* "    ")

(defun left-column (txt delim)
  (let ((end-of-left-column (search delim txt)))
    (subseq txt 0 end-of-left-column)))

(defun right-column (txt delim)
  (let* ((adjustment (length *gap*))
         ;; TODO, need to add a case here for the line
         ;; after W. Fritts
         ;; where we will not find anything from a backwards search
         ;; because there is only a first column
        (beginning-of-right-column (+ (search delim txt :from-end :backward)
                                      adjustment)))
    (subseq txt beginning-of-right-column)))

(with-open-file (my-stream "sample.txt" :direction :input)
  ;; todo split on blank space, and acc the left in one var and the right in another
  (loop
    (let ((current-line (read-line my-stream)))
     (when current-line
       (let* ((first-line (left-column current-line *gap*))
              (second-line (right-column current-line *gap*)))
         (print second-line))))))
