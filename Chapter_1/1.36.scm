;Exercise 1.36.  Modify fixed-point so that it prints the sequence of approximations it generates, using the newline and display primitives
;shown in exercise 1.22. Then find a solution to x^x = 1000 by finding a fixed point of x --> log(1000)/log(x). (Use Scheme's primitive log
;procedure, which computes natural logarithms.) Compare the number of steps this takes with and without average damping. (Note that you 
;cannot start fixed-point with a guess of 1, as this would cause division by log(1) = 0.) 


(define tolerance 0.000001)
(define average (lambda (x y) (/ (+ x y) 2)))
(define close-enough? (lambda (a b)  
  (< (abs (- a b)) tolerance)))

(define fixed-point (lambda (function guess)
  (define counter (lambda (count value)
  ;(display guess)
  ;(newline)
  (let ((next (function value)))
      (if (close-enough? value next)
          (cons count next)
          (counter (+ count 1) next)))))
  (counter 0 guess)))


(define fixed-point-with-average-damp (lambda (function guess)
  (define counter (lambda (count value)
    (let ((next (function value)))
      (if (close-enough? value next)
          (cons count next)
          (counter (+ count 1) (average value next))))))
  (counter 0 guess)))


;tests
(newline) (display (fixed-point (lambda (x) (/ (log 1000) (log x))) 2))
;39 guesses
(newline) (display (fixed-point-with-average-damp (lambda (x) (/ (log 1000) (log x))) 2))
;10 guesses

(newline) (display (fixed-point (lambda (x) (/ (log 1000) (log x))) 10))
;38 guesses
(newline) (display (fixed-point-with-average-damp (lambda (x) (/ (log 1000) (log x))) 10))
;10 guesses

(newline) (display (fixed-point (lambda (x) (/ (log 1000) (log x))) 100))
;41 guesses
(newline) (display (fixed-point-with-average-damp (lambda (x) (/ (log 1000) (log x))) 100))
;14 guesses


;Answer: it is clear from a few tests that fixes-point procedure with average damping takes less loops that the one without average damping
;It is the case because average damping makes guess change more precisely towards the right answer what leads to a shorter amount of steps.


