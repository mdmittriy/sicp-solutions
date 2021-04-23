;Exercise 2.1.  
;Define a better version of make-rat that handles both positive and negative arguments. Make-rat should normalize the sign so
;that if the rational number is positive, both the numerator and denominator are positive, and if the rational number is negative, only the
;numerator is negative. 

(define make-rat (lambda (num den)
  ((lambda (common-divisor)
           (lambda (pick) 
             (if pick 
                 (if (< (* num den) 0) 
                     (- (abs (/ num common-divisor)))
                     (abs (/ num common-divisor)))
                 (abs (/ den common-divisor)))))
   (gcd num den)) 
)) 


(define numer (lambda (rat) (rat #t) ))
(define denom (lambda (rat) (rat #f) ))
  
(define add-rat (lambda (x y)
  (make-rat (+ (* (numer x) (denom y)) (* (numer y) (denom x)))
            (* (denom x) (denom y))) ))

(define sub-rat (lambda (x y)
  (make-rat (- (* (numer x) (denom y)) (* (numer y) (denom x)))
            (* (denom x) (denom y))) ))

(define mul-rat (lambda (x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))) ))

(define div-rat (lambda (x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))) ))

(define print-rat (lambda (x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x))
  (newline) ))

(print-rat (add-rat (make-rat 1 (- 3)) (make-rat 1 2)))
;2/1
(print-rat (sub-rat (make-rat 2 3) (make-rat 1 (- 2))))
;7/6
(print-rat (mul-rat (make-rat 1 (- 3)) (make-rat 1 2)))
;-1/6
(print-rat (div-rat (make-rat (- 3) 3) (make-rat (- 1) 2)))
;2/1

