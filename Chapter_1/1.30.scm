;Exercise 1.30.  The sum procedure above generates a linear recursion. The procedure can be rewritten so that the sum is performed
;iteratively. Show how to do this by filling in the missing expressions in the following definition:

(define (sum term a next b)
  (define (iter a result)
    (if (> (next a) b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

;tests
(define (inc x) (+ x 1))
(define add-all (lambda (a b)
  (sum (lambda (x) x) a inc (inc b))))

(display (and
           (= (add-all 1 5) 15)
           (= (add-all 1 10) 55)
           (= (add-all 1 20) 210)))


