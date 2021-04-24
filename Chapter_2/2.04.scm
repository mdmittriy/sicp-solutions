;Exercise 2.4.  Here is an alternative procedural representation of pairs. For this representation, verify that (car (cons x y)) yields x for
;any objects x and y.
;What is the corresponding definition of cdr? (Hint: To verify that this works, make use of the substitution model of section 1.1.5.) 

(define (cons x y)
    (lambda (m) (m x y)))

(define (car z)
    (z (lambda (p q) p)))

;Let's look at the example where we use numebrs 1 2 in a pair
(cons 1 2)
;it evaluates to 
(lambda (m) (m 1 2))
;so if we use it together with car procedure
(car (cons 1 2))
;after subsitution we get this
((lambda (m) (m 1 2)) (lambda (p q) p))
;after applying the procedure with a given argument which is in turn a procedure as well we have this
((lambda (p q) p) 1 2)
;which evaluates to
1


;One way to implement cdr procedure
(define (cdr z)
  (z (lambda (p q) q)))
