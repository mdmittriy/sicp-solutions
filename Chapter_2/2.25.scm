;Exercise 2.25.  
;Give combinations of cars and cdrs that will pick 7 from each of the following lists:

(define list1 (list 1 3 (list 5 7) 9))
;(1 3 (5 7) 9)
(define list2 (list (list 7)))
;((7))
(define list3 (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))       
;(1 (2 (3 (4 (5 (6 7))))))


;tests
(display (and 
            (equal? (car (cdaddr list1)) 7)
            (equal? (caar list2) 7)
            (equal? (cadadr (cadadr (cadadr list3))) 7)))
