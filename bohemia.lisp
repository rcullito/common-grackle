(loop for i
      from 0
      do (print i)
      when (= i 5)
        return 'pumpkin)

(loop for x below 10
      for y below 10
      collect (+ x y))

(loop for x
        on '(1 3 5)
      do (print x))

