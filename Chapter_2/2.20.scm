;Exercise 2.20.
;Use this notation to write a procedure same-parity that takes one or more integers and returns a list of all the arguments that have the
;same even-odd parity as the first argument.

(define same-parity (lambda lst
  (define (create good? lst)
    (if (null? lst) '() 
      (if (good? (car lst))
          (cons (car lst) (create good? (cdr lst)))
          (create good? (cdr lst)))))
  (if (even? (car lst)) (create even? lst) (create odd? lst)))) 


;tests
(display (and
           (equal? (same-parity 1 2 3 4 5 6) (list 1 3 5))
           (equal? (same-parity 0 1 2 3 4 5 6) (list 0 2 4 6))))

