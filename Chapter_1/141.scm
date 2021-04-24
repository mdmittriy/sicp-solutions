;p77
(define dx 0.01)

(define inc (lambda (x) (+ x 1) ))

(define double (lambda (f)
  (lambda (x) (f (f x))) ))

(define average (lambda (a b c)
  (/ (+ a b c) 3)))


(define compose (lambda (f g)
  (lambda (x) (f (g x))) ))


(define repeated (lambda (f n)
  (define iter (lambda (g i)
    (cond 
      ((> i n) g)
      (else (iter (compose f g) (+ i 1))))
  ))
  (iter f 2)
))

                  
(define smooth (lambda (f)
  (lambda (x) (average (f (- x dx)) (f x) (f (+ x dx)))) ))

(define smoothed_n (lambda (f n)
  ((repeated smooth n) f)))


(newline)
;(display ((repeated inc 8) 10))
(newline)
;(display ((repeated square 2) 5)) 
(newline)
;(display (((double (double double)) inc) 5))
(newline)
(display ((smooth (lambda (x) (* x x))) 2))
(newline)
(display ((smoothed_n (lambda (x) (* x x)) 5) 2))
;(display ((compose square inc) 6))
(newline)
(newline)
