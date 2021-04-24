;Exercise 2.5.  Show that we can represent pairs of nonnegative integers using only numbers and arithmetic operations if we represent the
;pair a and b as the integer that is the product 2a 3b. Give the corresponding definitions of the procedures cons, car, and cdr. 

;Helper procedure to calculate exponents
(define (pow base power)
  (define (iter base power acc)
    (cond 
      ((= power 0) acc)
      ((odd? power) (iter base (- power 1) (* acc base)))
      (else (iter (square base) (/ power 2) acc))))
  (iter base power 1))


(define (my-cons x y)
  (* (pow 2 x) (pow 3 y)))

(define (my-car n)
  (if (even? n) (+ 1 (my-car (/ n 2))) 0))

(define (my-cdr n)
  (if (= (modulo n 3) 0) (+ 1 (my-cdr (/ n 3))) 0))
