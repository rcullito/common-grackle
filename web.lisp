(define-condition foo () ()
  (:report (lambda (condition stream)
             (princ "Stop FOOing around, numbskull!" stream))))


(defun bad-function ()
  (error 'foo))



(defun http-char (c1 c2 &optional (default #\Space))
  (let ((code (parse-integer
               (coerce (list c1 c2) 'string)
               :radix 16
               :junk-allowed t)))
    (if code
        (code-char code)
        default)))


(defun decode-param (s)
  (labels ((f (lst)
             (when lst
               (case (car lst)
                 (#\% (progn
                        (print (car lst))
                        (cons (http-char (cadr lst) (caddr lst))
                             (f (cdddr lst)))))
                 (#\+ (cons #\space (f (cdr lst))))
                 (otherwise (progn
                              (print (car lst))
                              (cons (car lst) (f (cdr lst))))))))) ;; bug makes total sense becuase we
    ;; were just returning the cdr without passing the cdr back to f
    (coerce (f (coerce s 'list)) 'string)))

;; The function cxyr is a composition of the function cxr with cyr. So, for example, (cadr foo) is equivalent to (car (cdr foo)), etc. Up to 3 letters, a or d, may appear between the c and the r.
(decode-param "foo%3F")
(decode-param "foo+bar")
(decode-param "foo")
