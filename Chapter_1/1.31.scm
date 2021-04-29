;Exercise 1.31.  
;a.  The sum procedure is only the simplest of a vast number of similar abstractions that can be captured as higher-order procedures.51 Write
;an analogous procedure called product that returns the product of the values of a function at points over a given range. Show how to define
;factorial in terms of product. Also use product to compute approximations to pi using the given formula

(define (id x) x)
(define (inc-by-two x) (+ x 2))

(define product (lambda (term a next b)
  (define iter (lambda (current-index result)
    (if (> current-index b)
        result
        (iter (next current-index) 
              (* result (term current-index))))))
  (iter a 1)))

(define factorial (lambda (n)
  (product id 1 (lambda (x) (+ x 1)) n)))


(define calculate-pi (lambda (n)
  (* (/ (calculate-pi-numerator n) (calculate-pi-denominator n)) 4)))

(define helper (lambda (start-value end-value)
  (square (product id start-value inc-by-two end-value))))

(define calculate-pi-numerator (lambda (n)
  (if (even? n)
      (* 2 (helper 4 (inc-by-two n)))
      (/ (* 2 (helper 4 (+ n 3)) (+ n 3))))))

(define calculate-pi-denominator (lambda (n)
  (if (even? n)
      (/ (helper 3 (+ n 3)) (+ n 3))
      (helper 3 (inc-by-two n)))))


;b.  If your product procedure generates a recursive process, write one that generates an iterative process. If it generates an iterative
;process, write one that generates a recursive process. 

(define product-recursive (lambda (term a next b)
  (if (> a b) 
      1 
      (* (term a) (product term (next a) next b)))))


;tests
(define approximately-equal? (lambda (a b)
  (< (abs (- a b)) 0.1)))

(display (and
           (approximately-equal? (calculate-pi 100.0) 3.1415)
           (approximately-equal? (calculate-pi 150.0) 3.1415)))

