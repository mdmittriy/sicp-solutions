;Exercise 1.7.  
;The good-enough? test used in computing square roots will not be very effective for finding the square roots of very small numbers. Also,
;in real computers, arithmetic operations are almost always performed with limited precision. This makes our test inadequate for very large
;numbers. 
;Explain these statements, with examples showing how the test fails for small and large numbers. 

(define improve (lambda (x guess)
  (/ (+ (/ x guess) guess) 2) ))

(define tolerance 0.001)

(define sq-root (lambda (x)
  (define good-enough? (lambda (x guess) 
    (< (abs (- (square guess) x)) tolerance) ))

  (define iter-sq-root (lambda (x guess)
    (if (good-enough? x guess) 
      guess 
      (iter-sq-root x (improve x guess)))
  ))
  (iter-sq-root x 1)
))

(display (sq-root 0.0000001))
(newline)
(display (sqrt 0.0000001))

;When applying our implemented function sq-root to very small numbers the answer heavily depends on the value of tolerance that we provide.  

(newline)
(newline)
(newline)
;(display (sq-root 1000000.0))
(newline)
(newline)
;(display (sqrt 1000000.0))
(newline)
(newline)

;Whereas for large numbers due to the way arithmetic is implemented in the computer the value is never lower than provided tolerance and
;thus computing a square root of a large number results in infinite loop.

;An alternative strategy for implementing good-enough? is to watch how guess changes from one iteration to the next and to stop when the
;change is a very small fraction of the guess . Design a square-root procedure that uses this kind of end test. Does this work better for
;small and large numbers? 



(define sq-root-improved (lambda (x)
  (define good-enough-improved? (lambda (x guess) 
    (< (abs (- 1 (/ guess (improve x guess)))) tolerance) ))

  (define iter-sq-root-improved (lambda (x guess)
    (if (good-enough-improved? x guess) 
      guess 
      (iter-sq-root-improved x (improve x guess)))
  ))
  (iter-sq-root-improved x 1)
))



(newline)
(display (sq-root-improved 0.0000001))
(newline)
(display (sq-root 0.0000001))
(newline)
(display (sqrt 0.0000001))
(newline)

;Results of the implementation of good-enough through relative coefficients are more precise than those of the function sq-root that we had
;before. 


