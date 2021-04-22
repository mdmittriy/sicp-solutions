;Exercise 1.24.
;Modify the timed-prime-test procedure of exercise 1.22 to use fast-prime? (the Fermat method), and test each of the 12
;primes you found in that exercise. Since the Fermat test has (log n) growth, how would you expect the time to test primes near 1,000,000 to
;compare with the time needed to test primes near 1000? Do your data bear this out? Can you explain any discrepancy you find? 

;iterative exp function with logarithmic order of growth

(define (expmod base power mod)
  (cond 
    ((= power 0) 1)
    ((odd? power) (remainder (* base (expmod base (- power 1) mod))
                             mod))
    (else (remainder (square (expmod base (/ power 2) mod))
                     mod))))

(define (fermat-test n)
  ((lambda (a) 
       (= (expmod a n n) a))
     (+ 1 (random (- n 1)))))


(define (fast-prime? n times)
  (cond
    ((= times 0) #t)
    ((fermat-test n) (fast-prime? n (- times 1)))
    (else #f)))

(define (prime? n) (fast-prime? n 1000))

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

(define (fast-exp base power)
  (define (fast-exp-iter base power acc)
  (cond
    ((= power 0) acc)
    ((odd? power) (fast-exp-iter base (- power 1) (* acc base)))
    (else (fast-exp-iter (square base) (/ power 2) acc))))
  (fast-exp-iter base power 1))

(newline)
(newline)
(display 10)
(newline)
(search-for-primes (fast-exp 100 10) (+ (fast-exp 100 10) 500))
;0.08
(newline)
(display 11)
(newline)
(search-for-primes (fast-exp 100 11) (+ (fast-exp 100 11) 500))
;0.09
(newline)
(display 12)
(newline)
(search-for-primes (fast-exp 100 12) (+ (fast-exp 100 12) 500))
;0.1
(newline)
(display 13)
(newline)
(search-for-primes (fast-exp 100 13) (+ (fast-exp 100 13) 500))
;0.11
(newline)
(display 23)
(newline)
(search-for-primes (fast-exp 100 23) (+ (fast-exp 100 23) 500))
;0.21
(newline)
(display 24)
(newline)
(search-for-primes (fast-exp 100 24) (+ (fast-exp 100 24) 500))
;0.23


;The number of times I apply tests by changing the variable 'times' has a linear influence on the speed of the algorithm, in particular if I
;increase times in 10 times the time it takes to compute 10x more tests obviously takes 10x time.


