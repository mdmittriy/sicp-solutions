;Newton's Method
;works
;works
;works
;works

;(define average (lambda (a b) (/ (+ a b) 2)))

;(define av-damp (lambda (f)
; (lambda (x) (average (f x) x))))

;(define sq (lambda (a)
; (fixed-point (av-damp (lambda (x) (/ a x))) 1)))


(define dx 0.00001)


(define method-newton (lambda (f guess)
  (fixed-point (transform-newton f) guess))) 

(define transform-newton (lambda (f)
  (lambda (x) (- x (/ (f x) ((deriv f) x))))))

(define deriv (lambda (f)
  (lambda (x) (/ (- (f (+ x dx)) (f x)) dx)))) 

(define fixed-point (lambda (f guess)
  (define close-enuf? (lambda (v1 v2)
    (< (abs (- v1 v2)) dx)))

  (let ((next (f guess)))
  (if (close-enuf? guess next) next 
    (fixed-point f next)))))


(define cubic (lambda (a b c)
  (lambda (x) (+ (* x x x) (* a x x) (* b x) c))))
  
;(method-newton (cubic a b c) 1)

;f(x) = x^2
;g(x) = x/2 



(newline)
(newline)
;(display ((transform-newton (lambda (x) (* x x))) 3))
;(display (method-newton (lambda (x) (* x x)) 3))
(display (method-newton (cubic 1 2 3) 3))
(newline)
(display (method-newton (cubic (- 8) 0 11) 0))
(newline)
;(display (method-newton (lambda (x) (+ (* x x x) (* 2 x) 2222 (- (* 2 x x)))) 3))
(newline)
(newline)

