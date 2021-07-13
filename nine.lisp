
(defstruct person
  name
  age
  waist-size
  favorite-color)

(defparameter *bob* (make-person :name "Bob"
                                 :age 35
                                 :waist-size 32
                                 :favorite-color "blue"))

*bob*

(setf (person-age *bob*) 36)

*bob*

(defparameter *that-guy* #S(person :name "bob" :age 35 :waist-size 32 :favorite-color "blue"))

*that-guy*

(every #'numberp '(8 6 18))

(position #\p "mississippi")



(reduce (lambda (best item)
          (if (and (evenp item) (> item best))
              item
              best))
        '(7 4 6 5 2)
        :initial-value 0)


(defparameter *folks* (make-array 8))
(setf (aref *folks* 4) 'lu)

*folks*

(map 'string
     (lambda (x)
       (if (eq x #\s)
           #\S
           x))
     "this is a string")

(subseq "america" 2 6)

(let ((stuff (loop for i to 10
                   collect i)))
  (sort stuff #'>))



