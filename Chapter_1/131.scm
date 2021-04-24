;61

(define product (lambda (term a next b)
  (if (> a b) 1 
  (* a (product term (next a) next b)))))

(define fac (lambda (n)
  (product (lambda (x) x) 1 (lambda (x) (+ x 1)) n)))

(define pi (lambda (n)
  (define sq (lambda (x) (* x x)))
  (define part (lambda (a) 
    (product (lambda (x) x) a (lambda (x) (+ x 2)) (/ n 2))))
  (/ (* 2.0 (sq (part 4.0))) (sq (part 3.0)))))

(define p2 (lambda (n)
  (define sq (lambda (x) (* x x)))
  (cond 
    ((even? n)
      (* 2 (sq (product (lambda (x) x) 4 (lambda (x) (+ x 2)) (+ n 2)))))
    (else 
      (/ (* 2 (sq (product (lambda (x) x) 4 (lambda (x) (+ x 2)) (+ n 3)))) (+ n 3))
      ))))

(define p3 (lambda (n)
  (cond
    ((odd? n)
     (square (product (lambda (x) x) 3 (lambda (x) (+ x 2)) (+ n 2))))
     (else (/ (square (product (lambda (x) x) 3 (lambda (x) (+ x 2)) (+ n 3))) (+ n 3))
     ))))

(define p (lambda (n)
  (* (/ (p2 n) (p3 n)) 4)))




(newline)
(newline)
(display (p2 2))
(newline)
(display (p3 2))
(newline)
(display (p2 3))
(newline)
(display (p3 3))
(newline)
(display (p2 4))
(newline)
(display (p3 4))
(newline)
(display (p2 5))
(newline)
(display (p3 5))
(newline)
(display (p2 6))
(newline)
(display (p3 6))
;(display (product (lambda (x) x) 2 (lambda (x) (+ x 2)) 2))
;(display (product (lambda (x) x) 2 (lambda (x) (+ x 2)) 2))
;(newline)
;(display (product (lambda (x) x) 2 (lambda (x) (+ x 2)) 3))
;(newline)
;(display (product (lambda (x) x) 2 (lambda (x) (+ x 2)) 4))
;(newline)
;(display (product (lambda (x) x) 2 (lambda (x) (+ x 2)) 5))
;(newline)
;(display (product (lambda (x) x) 2 (lambda (x) (+ x 2)) 6))
;(newline)
;(display (product (lambda (x) x) 2 (lambda (x) (+ x 2)) 7))
;(newline)
;(display (product (lambda (x) x) 2 (lambda (x) (+ x 2)) 8))
;(newline)


(newline)
(newline)
