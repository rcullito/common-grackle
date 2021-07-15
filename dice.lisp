(defparameter *num-players* 2)
(defparameter *max-dice* 3)
(defparameter *board-size* 2)
(defparameter *board-hexnum* (* *board-size* *board-size*))

(defun board-array (lst)
  (make-array *board-hexnum* :initial-contents lst))


(defun gen-board ()
  (board-array
   (loop for n below *board-hexnum*
         collect (list (random *num-players*)
                       (1+ (random *max-dice*))))))

(defun player-letter (n)
  (code-char (+ 97 n)))


(defun draw-board (board)
  (loop for y below *board-size*
        do (progn (fresh-line)
                  (loop repeat (- *board-size* y)
                        do (princ "  "))
                  (loop for x below *board-size*
                        for hex = (aref board (+ x (* *board-size* y)))
                        do (format t "~a-~a " (player-letter (first hex))
                                   (second hex))))))




(defun board-attack (board player src dst dice)
  (board-array
   (loop for pos from 0
         for hex across board
         collect (cond ((eq pos src) (list player 1))
                       ((eq pos dst) (list player (1- dice)))
                       (t hex)))))

(defparameter *foo* (let ((x 18))
                      (lambda ()
                        x)))

(funcall *foo*)

(let ((line-number 0))
  (defun my-print (x)
    (print line-number)
    (print x)
    (incf line-number)
    nil))


(defun my-length-1 (lst)
  (if lst
      (1+ (my-length-1 (cdr lst)))
      0))



(defparameter *biglist* (loop for i below 100000 collect 'x))




(defun my-length-2 (lst)
  (labels ((f (lst acc)
             (if lst
                 (f (cdr lst) (1+ acc)) ;; (1+ 0) will happen *before* we call f, so this is efficient
                 acc)))
    (f lst 0)))

;; (my-length-2 '(fie foh fum))

(compile 'my-length-2)

(my-length-2 *biglist*)

