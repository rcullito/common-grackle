

(defmacro let1 (var val &body body)
  `(let ((,var ,val))
     ,@body))

(macroexpand
 '(let1 foo 18
   (+ foo 2)))

(defmacro split (val yes no)
  (let1 g (gensym)
    `(let1 ,g ,val
       (if ,g
           (let ((head (car ,g))
                 (tail (cdr ,g)))
             ,yes)
           ,no))))



(macroexpand
 '(split '(2 3)
        (format nil "This can be split into ~a and ~a" head tail)
        (format nil "This cannot be split.")))

(split '()
       (format nil "This can be split into ~a and ~a" head tail)
       (format nil "This cannot be split."))


(defun pairs (lst)
  (labels ((f (lst acc)
             (split lst
                    (if tail
                        (f (cdr tail) (cons (cons head (car tail)) acc))
                        (reverse acc))
                    (reverse acc))))
    (f lst nil)))

(cadr '(2 3))


(pairs '(a b c d e f))

(defmacro recurse (vars &body body)
  (let1 p (pairs vars)
    `(labels ((self ,(mapcar #'car p)
                ,@body))
       (self ,@(mapcar #'cdr p)))))

;; recurse will do 2 things
;; a) provide access to a function called self within its body, which tees up the pairs list for args and vals passed in at the outset
;; b) executes the body at least once with the fresh bindings

;; so to start, let's see if we can take advantage of recurse just with the bindings
;; but keep in mind that everything with the comma is flopped so we end up with a function self, which just takes  name and calls subseq on that name

(macroexpand
 '(recurse (name "lambadoodle")
   (when (> (length name) 4)
     (fresh-line)
     (print (subseq name 0 4))
     (self (subseq name 1)))))

(recurse (age 19 convertible 'porsche)
  (if (eq convertible 'porsche)
      (progn
        (fresh-line)
        (print 'town)
        (self 30 'honda))
      (progn
        (fresh-line)
        (print 'pasture))))


;; so we should go through once and call convertible with 'porsche, printing 'town
;; then we call ourselves recursively with honda, and we should print pasture and be done :)

(princ "hello")

(get-output-stream-string *standard-output*)




