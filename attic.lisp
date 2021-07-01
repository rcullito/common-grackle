(defparameter *nodes* '((living-room (you are in the living room. a wizard is snoring on the couch))
                        (garden (you are in a beautiful garden. there is a well in front of you))
                        (attic (you are in the attic. there is a giant welding torch in the corner.))))


(defparameter *edges* '((living-room (garden west door)
                                    (attic upstairs ladder))
                       (garden (living-room east door))
                        (attic (living-room downstairs ladder))))

(defparameter *objects* '(whiskey bucket frog chain))

(defparameter *object-locations* '((whiskey living-room)
                                   (bucket living-room)
                                   (frog garden)
                                   (chain garden)))

(defun describe-location (location nodes)
  (cadr (assoc location nodes)))


(defun describe-path (edge)
  `(there is a , (caddr edge) going , (cadr edge) from here.))

(defun describe-paths (location edges)
  (apply #'append (mapcar #'describe-path (cdr (assoc location edges)))))

;; cdr will always return a list, so we need another car on top of that to get the actual element
(cadr (assoc 'frog *object-locations*))

