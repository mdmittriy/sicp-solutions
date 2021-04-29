;Exercise 1.8.  
;Newton's method for cube roots is based on the fact that if y is an approximation to the cube root of x, then a better
;approximation is given by the value ...
;Use this formula to implement a cube-root procedure analogous to the square-root procedure.


(define tolerance 0.01)

(define improve (lambda (x guess)
  (/ (+ (/ x (square guess))
        (* 2 guess))
     3) ))

(define third-root-improved (lambda (x)
  (define good-enough-improved? (lambda (x guess) 
    (< (abs (- 1 (/ guess (improve x guess)))) tolerance) ))

  (define iter-third-root-improved (lambda (x guess)
    (if (good-enough-improved? x guess) 
      guess 
      (iter-third-root-improved x (improve x guess)))
  ))
  (iter-third-root-improved x 1)
))


(define appr-eq (lambda (x y) (< (abs (- x y)) tolerance) ))
                      
;tests
(display (and 
         (appr-eq (third-root-improved 8.0) 2)
         (appr-eq (third-root-improved 27.0) 3)
         (appr-eq (third-root-improved 64.0) 4)))
