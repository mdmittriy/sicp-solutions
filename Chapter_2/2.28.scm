;Exercise 2.28.  Write a procedure fringe that takes as argument a tree (represented as a list) and returns a list whose elements are all the
;leaves of the tree arranged in left-to-right order. For example,


(define (fringe items)
    (cond
      ((pair? items) (append (fringe (car items)) (fringe (cdr items))))
      ((null? items) '())
      (else (list items))))


;tests
(define x (list (list 1 2) (list 3 4)))
(display (and 
           (equal? (fringe '(((((1 2) 2 3 4 ))) 6 6 (7 8 9 (10)))) '(1 2 2 3 4 6 6 7 8 9 10))
           (equal? (fringe x) '(1 2 3 4))
           (equal? (fringe (list x x)) '(1 2 3 4 1 2 3 4))))

