;Exercise 2.30.  Define a procedure square-tree analogous to the square-list procedure of exercise 2.21. That is, square-list should behave
;as follows:


;Define square-tree both directly (i.e., without using any higher-order procedures) and also by using map and recursion. 

;No higher order procedures
(define (square-tree items)
  (cond
    ((null? items) '())
    ((not (pair? items)) (square items))
    (else (cons (square-tree (car items))
                (square-tree (cdr items))))))




;With higher-order procedures and map function

(define (high-square-tree items)
  (map (lambda (things)
               (if (not (pair? things))
                   (square things)
                   (high-square-tree things)))
       items))




;tests
(display (and (equal? (square-tree (list 1 (list 2 (list 3 4) 5) (list 6 7))) 
                                   '(1 (4 (9 16) 25) (36 49)))
              (equal? (high-square-tree (list 1 (list 2 (list 3 4) 5) (list 6 7))) 
                                   '(1 (4 (9 16) 25) (36 49)))
                ))
