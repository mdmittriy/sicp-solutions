;Exercise 2.18.  Define a procedure reverse that takes a list as argument and returns a list of the same elements in reverse order:


;iterative way
(define (rvrs lst)
  (define (iter lst result)
    (if (null? lst)
        result
        (iter (cdr lst) (cons (car lst) result))))
    (iter lst '()))


;tests
(display (reverse (list 1 2 3 4 5)))
;(5 4 3 2 1)


;Another way to do it with helper functions
;(define (choose n lst)
;  (if (= n 1) (car lst) (choose (- n 1) (cdr lst))))
;
;(define (length lst)
;  (if (null? lst) 0 (+ 1 (length (cdr lst)))))
;
;(define (reverse lst)
;  (define (iter n lst)
;  (if (= n 1) (cons (car lst) '()) (cons (choose n lst) (iter (- n 1) lst))))
;  (iter (length lst) lst))
