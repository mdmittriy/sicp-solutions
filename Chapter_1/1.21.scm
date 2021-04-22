;Exercise 1.21.  
;Use the smallest-divisor procedure to find the smallest divisor of each of the following numbers: 199, 1999, 19999. 

(define smallest-divisor (lambda (x)
  (define smallest-divisor-iter (lambda (x n)
    (cond 
      ((> (square n) x) x) 
      ((= (modulo x n) 0 ) n)
      (else (smallest-divisor-iter x (+ n 1)))) ))
    (smallest-divisor-iter x 2) ))

(newline)
(display (smallest-divisor 199))
;199
(newline)
(display (smallest-divisor 1999))
;1999
(newline)
(display (smallest-divisor 19999))
;7
(newline)
(display (smallest-divisor 199999))
;199999
(newline)
