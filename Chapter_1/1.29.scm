;Exercise 1.29.  Simpson's Rule is a more accurate method of numerical integration than the method illustrated above. Using Simpson's Rule,
;the integral of a function f between a and b is approximated as
;where h = (b - a)/n, for some even integer n, and yk = f(a + kh). (Increasing n increases the accuracy of the approximation.) Define a
;procedure that takes as arguments f, a, b, and n and returns the value of the integral, computed using Simpson's Rule. Use your procedure to
;integrate cube between 0 and 1 (with n = 100 and n = 1000), and compare the results to those of the integral procedure shown above. 

(define dx 0.001)
(define (cube x) (* x x x))
(define (inc x) (+ dx x))

(define (sum term a next b)
    (if (> a b) 0
    (+ (term a) (sum term (next a) next b))))
    
(define (integral fun a b dx)
    (* dx (sum fun a (lambda (x) (+ x dx)) b)))

(define (simp fun a b n)
    (let ((h (/ (- b a) n)))
        (define (simp-eval x)
            (cond 
                ((= x a) (fun x))
                ((= x (- b h)) (fun x))
                ((even? (round (/ (- x a) h))) (* 4 (fun x)))
                (else (* 2 (fun x)))))
        (/ (* h 
              (sum simp-eval a (lambda (x) (+ x h)) b))
           3)))


;tests
(define (approximately-equal a b)
  (< (abs (- a b)) dx))

(display (and
           (approximately-equal (simp cube 0.0 1.0 10000.0) 0.25)))
