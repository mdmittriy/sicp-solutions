;Procedure from chapter 2.2.2 Hierarchichal Structures page 109.

(define (count-leaves tree)
  (cond 
    ((null? tree) 0)
    ((not (pair? tree)) 1)
    (else (+ (count-leaves (car tree))
             (count-leaves (cdr tree))))))

;tests
(display (count-leaves (list (list 1 2 3 4) (list 1 2 3) (cons 1 2))))
;9
