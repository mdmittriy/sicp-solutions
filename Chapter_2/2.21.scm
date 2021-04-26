;Exercise 2.21.  The procedure square-list takes a list of numbers as argument and returns a list of the squares of those numbers.
;Here are two different definitions of square-list. Complete both of them by filling in the missing expressions:

(define (square-list items)
    (if (null? items)
        '()
        (cons (square (car items)) (square-list (cdr items)))))

(define (map items function)
  (if (null? items)
      '()
      (cons 
          (function (car items))
          (map (cdr items) function))))

(define (square-list-map items)
    (map items square))

;tests
(display (and
           (equal? (square-list (list 1 2 3 4 5 6)) (square-list-map (list 1 2 3 4 5 6)))
           (equal? (square-list (list 1 2 9 4 5 -6)) (square-list-map (list 1 2 9 4 5 -6)))
           ))

