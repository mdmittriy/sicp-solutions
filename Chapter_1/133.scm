;p61

(define filtered_accumulate (lambda (pred combiner null_value term a next b)
  (cond ((> a b) null_value)
        ((pred a) (combiner (term a) (filtered_accumulate pred combiner null_value term (next a) next b)))
        (else (filtered_accumulate pred combiner null_value term (next a) next b)))))


(define prime? (lambda (x) (= (smallest x) x)))
(define smallest (lambda (x) 
  (define iter (lambda (n)
    (if (= (remainder x n) 0) n
      (iter (+ n 1)))
  ))
  (iter 2)
))




(newline)
(newline)
(display
(filtered_accumulate prime? + 0 square 2 (lambda (x) (+ x 1)) 10)
)
(newline)
(newline)
