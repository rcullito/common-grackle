(format t "Add onion rings for only ~$ dollars more!" 1.5)


(reverse (format nil "Add onion rings for only ~$ dollars more!" 1.5))




(format nil "The number 1000 in binary is ~b" 1000)


(format nil "I am printing ~10,'xd within ten spaces of room." 1000000)


(format nil "PI can be estimated as ~,28f" pi)

(format nil "Percentages are ~,,1f percent better than fractions" 0.77)

(format nil "I wish I had ~$ dollars in my bank account" 100000.2)

(progn (format t "this is one line ~&")
       (format t "~& this is on another line"))

(format t "This will print ~5%on two lines spread far apart")

(defun random-animal ()
  (nth (random 5) '("dog" "tick" "tiger" "walrus" "kangaroo")))

(loop repeat 10
      do (format t "~5t~a ~15t~a ~25t~a~%"
                 (random-animal)
                 (random-animal)
                 (random-animal)))

(defparameter *animals* (loop repeat 10 collect (random-animal)))

*animals*

(format t "~{I see a ~a... or was it a ~a?~%~}" *animals*)


