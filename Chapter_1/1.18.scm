;Exercise 1.18.  Using the results of exercises 1.16 and 1.17, devise a procedure that generates an iterative process for multiplying two
;integers in terms of adding, doubling, and halving and uses a logarithmic number of steps.40

(define mul (lambda (a b)
  (define (halve x) (/ x 2))
  (define (double x) (* x 2))

  (define mul-iter (lambda (a b x)
    (cond
      ((= b 1) (+ a x))
      ((odd? b) (mul-iter a (- b 1) (+ x a)))
      (else (mul-iter (double a) (halve b) x))) ))
  (mul-iter a b 0)
))

;tests
(display (and
  (= (mul 3 4) (* 3 4))
  (= (mul 8 4) (* 8 4))
  (= (mul 2 7) (* 2 7))
  (= (mul 6 6) (* 6 6))
  (= (mul 3 9) (* 3 9))))
