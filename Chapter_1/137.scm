;p71
(define cont-frac (lambda (n d k)
  (define iter (lambda (i)
    (if (> i k) 0
      (/ (d i) (+ (n i) (iter (+ i 1))))
  )))
  (iter 1)))


(define iter-frac (lambda (n d k)
  (define iter (lambda (i res)
    (if (> i k) res
      (iter (+ i 1) (/ (n i) (+ res (d i)))))
    ))
  (iter 1 0)
))

;  _     _     _      _
;1 2 1 1 4 1 1 6 1 1  8
;1 2 3 4 5 6 7 8 9 10 11
;  ^     ^     ^      ^

(define di (lambda (x)
  (if (= (remainder (+ x 1) 3) 0) (* 2 (/ (+ x 1) 3)) 1)))


(define tan-cf (lambda (x k) 
  ((lambda (part) (/ x (+ 1 part)))
  (cont-frac (lambda (n) (+ (* n 2) 1)) (lambda (d) (- (square x))) k))))

(newline)
(newline)
;(display (cont-frac (lambda (n) 1.0) di 1000))
(newline)
(display (tan-cf 0.5 2000))
;(display (iter-frac (lambda (n) (+ (* 2 n) 1) di 1000))
(newline)
(newline)
  
