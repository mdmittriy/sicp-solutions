;p61

(define (id x) x)
(define (inc x) (+ x 1))
(define (add a b) (+ a b))

;linear recursive method 

(define accumulate (lambda (combiner null_value term a next b)
  (if (> a b) null_value
    (combiner (term a) (accumulate combiner null_value term (next a) next b)))))
  
(define sum (lambda (term a next b) (accumulate + 0 term a next b)))
(define product (lambda (term a next b) (accumulate * 1 term a next b)))

    ;more specific low-level recursive procedures
    (define sum (lambda (term a next b)
      (if (> a b) 0
        (+ a (sum term (next a) next b)))))

    (define product (lambda (term a next b)
      (if (> a b) 1
        (* a (product term (next a) next b)))))


;iterative method

(define accumulate (lambda (combiner null_value te a ne b)
  (define iter (lambda (a res)
    (if (> a b) res
        (iter (ne a) (combiner res (te a))))
    ))
  (iter a null_value)
))

(define sum (lambda (t a n b) (accumulate + 0 t a n b)))
(define product (lambda (t a n b) (accumulate * 1 t a n b)))

    ;more specific low-level recursive procedures
    (define sum (lambda (te a ne b)
      (define iter (lambda (a res)
        (if (> a b) res 
        (iter (ne a) (+ res (te a))))
      ))
      (iter a 0)
    ))


    (define product (lambda (te a ne b)
      (define iter (lambda (a res)
        (if (> a b) res 
        (iter (ne a) (* res (te a))))
      ))
      (iter a 1)
    ))


(newline)
(newline)
(display (sum id 1 inc 10))
(newline)
(display (product id 5 inc 7))
(newline)

