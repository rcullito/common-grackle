(defun add-widget (database widget)
  (cons widget database))

(defparameter *database* nil)

(defun main-loop ()
  (loop (princ "Please enter the name of a new widget:")
        (setf *database* (add-widget *database* (read)))
        (format t "The database contains the following: ~a~%" *database*)))

(defparameter *my-list* '(4 7 2 3))

(loop for n below (length *my-list*)
      do (setf (nth n *my-list*) (+ (nth n *my-list*) 2)))

*my-list*

(defun add-two (list)
  (when list ;; the when here is super important in order to end with a nil
    (cons (+ 2 (car list)) (add-two (cdr list)))))

(add-two '(2 4 6))

(mapcar (lambda (x)
          (+ x 2))
        '(4 7 2 3))


