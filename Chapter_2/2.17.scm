;Exercise 2.17.  Define a procedure last-pair that returns the list that contains only the last element of a given (nonempty) list:

(define (last-pair list)
  (if (null? (cdr list)) (car list) (last-pair (cdr list))))
  

;tests
(display (and
           (= (last-pair (list 1 2 3)) 3)
           (= (last-pair (list 1 2 4)) 4)
           (= (last-pair (list 1)) 1)
           (= (last-pair (list 1 2 3 0)) 0)))
