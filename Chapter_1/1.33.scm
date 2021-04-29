;Exercise 1.33.  You can obtain an even more general version of accumulate (exercise 1.32) by introducing the notion of a filter on the terms
;to be combined. That is, combine only those terms derived from values in the range that satisfy a specified condition. The resulting
;filtered-accumulate abstraction takes the same arguments as accumulate, together with an additional predicate of one argument that specifies
;the filter. Write filtered-accumulate as a procedure. Show how to express the following using filtered-accumulate:

;a. the sum of the squares of the prime numbers in the interval a to b (assuming that you have a prime? predicate already written)

(define filtered-accumulate (lambda (predicate combiner null-value term a next b)
  (cond ((> a b)
         null-value)
        ((predicate a)
         (combiner (term a)
                   (filtered-accumulate predicate combiner null-value term (next a) next b)))
        (else
         (filtered-accumulate predicate combiner null-value term (next a) next b)))))


(define prime? (lambda (x) 
  (and (not (= x 1))
       (= (smallest x) x))))

(define smallest (lambda (x) 
  (define iter (lambda (n)
    (if (= (remainder x n) 0) n
      (iter (+ n 1)))))
  (iter 2)))


(define sum-of-squared-primes (lambda (start-index end-index)
  (filtered-accumulate prime? + 0 square start-index (lambda (x) (+ x 1)) end-index)))

;b. the product of all the positive integers less than n that are relatively prime to n (i.e., all positive integers i < n such that
;GCD(i,n) = 1). 

(define product-of-relative-primes (lambda (n)
  (define relative-prime? (lambda (comparand) (= (gcd comparand n) 1)))
  (filtered-accumulate relative-prime? * 1 (lambda (x) x) 2 (lambda (x) (+ x 1)) n))) 

;tests
(display (and 
           (= 87 (sum-of-squared-primes 1 10))
           (= (product-of-relative-primes 10) 189)))


