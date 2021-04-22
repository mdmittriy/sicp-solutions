;Exercise 1.23.  The smallest-divisor procedure shown at the start of this section does lots of needless testing: After it checks to see if
;the number is divisible by 2 there is no point in checking to see if it is divisible by any larger even numbers. This suggests that the
;values used for test-divisor should not be 2, 3, 4, 5, 6, ..., but rather 2, 3, 5, 7, 9, .... To implement this change, define a procedure
;next that returns 3 if its input is equal to 2 and otherwise returns its input plus 2. Modify the smallest-divisor procedure to use (next 
;test-divisor) instead of (+ test-divisor 1). With timed-prime-test incorporating this modified version of smallest-divisor, run the test
;for each of the 12 primes found in exercise 1.22. Since this modification halves the number of test steps, you should expect it to run about
;twice as fast.  Is this expectation confirmed? If not, what is the observed ratio of the speeds of the two algorithms, and how do you
;explain  he fact that it is different from 2? 


(define smallest-divisor (lambda (x)
  (define smallest-divisor-iter (lambda (x n)
    (cond 
      ((> (square n) x) x) 
      ((= (modulo x n) 0 ) n)
      (else (smallest-divisor-iter x (next n)))) ))
    (smallest-divisor-iter x 2) ))

(define prime? (lambda (x) (= (smallest-divisor x) x) ))

(define (timed-prime-test n)
        (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
    (if (prime? n)
        (report-prime n (- (runtime) start-time))))

(define (report-prime n elapsed-time)
    (newline)
    (display n)
    (display " *** ")
    (display elapsed-time))

(define search-for-primes (lambda (low-bound up-bound)
  (define search-for-primes-loop (lambda (x)
    (timed-prime-test x)
    (if (< x up-bound) (search-for-primes-loop (+ x 2))) ))
  (search-for-primes-loop (if (even? low-bound) (+ low-bound 1) low-bound)) ))

(define next (lambda (n) (if (= n 2) 3 (+ n 2)) ))


(search-for-primes 100000000000 100000000060) 
;0.11s
(newline)
(search-for-primes 1000000000000 1000000000063) 
;0.33s
(newline)
(search-for-primes 10000000000000 10000000000100) 
;1.07s
(newline)
(search-for-primes 100000000000000 100000000000100) 
;3.4s
(newline)


;It is almost exactly twice as fast as it was before implementing the next function. It is the case because the number of tests is reduced
;in half.
