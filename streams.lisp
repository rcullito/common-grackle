(progn (princ "hello")
       (fresh-line)
       (princ "sir"))

(output-stream-p *standard-output*)

(output-stream-p "bob")


(write-char #\y *standard-output*)

(input-stream-p *standard-input*)

(read-char *standard-input*)


(let ((animal-noises '((dog . woof)
                       (cat . meow))))
  (cdr (assoc 'dog animal-noises)))


(with-open-file (my-stream "animal-noises.txt" :direction :input)
    (read my-stream))


(with-open-file (my-stream "data.txt"
                           :direction :output
                           :if-exists :supersede)
  (print "my-data" my-stream))

(defparameter foo (make-string-output-stream))

(princ "this will go into foo" foo)
(princ "this will also go into foo" foo)

(get-output-stream-string foo)

(with-output-to-string (*standard-output*)
  (princ "the sum of 5 and 2 ")
  (princ "is ")
  (princ (+ 5 2)))
