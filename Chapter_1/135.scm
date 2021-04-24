;p70

(define tol 0.0001)
(define fixed-point (lambda (f guess)
  (define close-enuf? (lambda (v1 v2)  
    (< (abs (- v1 v2)) tol)))
  (newline)
  (display guess)
  (let ((next (f guess)))
      (if (close-enuf? guess next) next (fixed-point f next)))
  ))

(define average (lambda (x y) (/ (+ x y) 2)))

(newline)
(newline)
 ;(display (fixed-point cos 1))
 ;(display (fixed-point (lambda (x) (+ 1 (/ 1.0 x))) 1))
 (display (fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 2))
(newline)
(newline)
(newline)
 (display (fixed-point (lambda (x) (/ (log 1000) (log x))) 2))

(newline)
(newline)
