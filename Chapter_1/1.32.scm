;Exercise 1.32.  a. Show that sum and product (exercise 1.31) are both special cases of a still more general notion called accumulate that
;combines a collection of terms, using some general accumulation function:
;Accumulate takes as arguments the same term and range specifications as sum and product, together with a combiner procedure (of two
;value to use when the terms run out. Write accumulate and show how sum and product can both be defined as simple calls to accumulate.

;b. If your accumulate procedure generates a recursive process, write one that generates an iterative process. If it generates an iterative
;process, write one that generates a recursive process. 


(define (id x) x)
(define (inc x) (+ x 1))

;linear recursive method 
(define accumulate-recursive (lambda (combiner null_value term a next b)
  (if (> a b) null_value
      (combiner (term a) (accumulate-recursive combiner null_value term (next a) next b)))))
  
(define sum-recursive (lambda (a b) (accumulate-recursive + 0 id a inc b)))
(define product-recursive (lambda (a b) (accumulate-recursive * 1 id a inc b)))

;iterative method
(define accumulate-iter (lambda (combiner null_value term a next b)
  (define iter (lambda (a result)
    (if (> a b) 
        result
        (iter (next a) (combiner result (term a))))))
  (iter a null_value)))

(define sum-iter (lambda (a b) (accumulate-iter + 0 id a inc b)))
(define product-iter (lambda (a b) (accumulate-iter * 1 id a inc b)))


;tests
(display (and
           (= (sum-iter 1 10) (sum-recursive 1 10) 55)
           (= (sum-iter 1 20) (sum-recursive 1 20) 210)
           (= (product-iter 1 10) (product-recursive 1 10) 3628800)
           (= (product-iter 1 20) (product-recursive 1 20) 2432902008176640000)))

