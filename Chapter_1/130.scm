; page 60

(define (sum term a next b)
  (define (iter a result)
    (if (> (next a) b) result (iter (next a) (+ result (term a)))))
  (iter a 0))

(define inc (lambda (a b)
  (sum (lambda (x) x) a (lambda (x) (+ x 1)) b)))


(newline)
(newline)
(display


(inc 0 10)


)
(newline)
(newline)
