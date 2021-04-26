;Exercise 2.27.  Modify your reverse procedure of exercise 2.18 to produce a deep-reverse procedure that takes a list as argument and returns
;as its value the list with its elements reversed and with all sublists deep-reversed as well. For example,

(define (deep-reverse items)
  (define (iter items result)
    (if (null? items) 
        result
        (if (list? (car items)) 
            (iter (cdr items) (cons (deep-reverse (car items)) result))
            (iter (cdr items) (cons (car items) result)))))
  (iter items '()))

;tests
(display (and
           (equal? (deep-reverse (list (list (list 1 2)))) '(((2 1))))
           (equal? (deep-reverse (list (list 1 2) (list 3 4))) '((4 3) (2 1)))
           (equal? (deep-reverse (list (list (list 1 2) (list 3 4)))) '(((4 3) (2 1))) )))

