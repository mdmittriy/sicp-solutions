;Exercise 1.6.  
;Alyssa P. Hacker doesn't see why if needs to be provided as a special form. ``Why can't I just define it as an ordinary procedure in 
;terms of cond?'' she asks. Alyssa's friend Eva Lu Ator claims this can indeed be done, and she defines a new version of if:

(define (new-if predicate then-clause else-clause)
  (cond 
    (predicate then-clause)
    (else else-clause)))

;Eva demonstrates the program for Alyssa:

(new-if (= 2 3) 0 5)
5

(new-if (= 1 1) 0 5)
0

;Delighted, Alyssa uses new-if to rewrite the square-root program:

(define (sqrt-iter guess x)
  (define tolerance 0.001)
  (define good-enough? (lambda (guess x) (< (abs (- (square guess) x)) tolerance) ))
  (define improve (lambda (guess x) (/ (+ (/ x guess) guess) 2) ))

  (new-if
    (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

;What happens when Alyssa attempts to use this to compute square roots? Explain. 

(display (sqrt-iter 1 4.0))

;Answer: Since in our applicative-order model all operands are evaluated before applying the operator the last argument to new-if will be
;evaluated regardless of the predicate's value. And since it is recursive the whole function call inevitably results in the infinite loop.
