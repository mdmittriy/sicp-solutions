;Exercise 2.31.  Abstract your answer to exercise 2.30 to produce a procedure tree-map with the property that square-tree could be defined as


(define (tree-map proc items)
  (cond
    ((null? items) '())
    ((pair? items) (cons (square-tree (car items))
                         (square-tree (cdr items))))
    (else (proc items))))

(define (square-tree tree) (tree-map square tree))

;tests
(display (and (equal? (square-tree (list 1 (list 2 (list 3 4) 5) (list 6 7))) 
                                   '(1 (4 (9 16) 25) (36 49)))))
