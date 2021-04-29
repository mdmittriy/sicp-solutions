;Exercise 1.35.  Show that the golden ratio (section 1.2.2) is a fixed point of the transformation x --> 1 + 1/x, and use this fact to
;compute phi by means of the fixed-point procedure. 

(define tolerance 0.0001)
(define average (lambda (x y) (/ (+ x y) 2)))
(define close-enough? (lambda (a b)  
  (< (abs (- a b)) tolerance)))

(define fixed-point (lambda (function guess)
  (let ((next (function guess)))
      (if (close-enough? guess next)
          next
          (fixed-point function next)))))


(display (close-enough? (fixed-point (lambda (x) (+ 1 (/ 1.0 x))) 1) 1.618))
