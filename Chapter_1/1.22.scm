;Exercise 1.22.  Most Lisp implementations include a primitive called runtime that returns an integer that specifies the amount of time the
;system has been running (measured, for example, in microseconds). The following timed-prime-test procedure, when called with an integer n,
;prints n and checks to see if n is prime. If n is prime, the procedure prints three asterisks followed by the amount of time used in
;performing the test.

(define smallest-divisor (lambda (x)
  (define smallest-divisor-iter (lambda (x n)
    (cond 
      ((> (square n) x) x) 
      ((= (modulo x n) 0 ) n)
      (else (smallest-divisor-iter x (+ n 1)))) ))
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

;Using this procedure, write a procedure search-for-primes that checks the primality of consecutive odd integers in a specified range. Use
;your procedure to find the three smallest primes larger than 1000. larger than 10,000. larger than 100,000. larger than 1,000,000. Note the
;time needed to test each prime. Since the testing algorithm has order of growth of (n), you should expect that testing for primes around
;10,000 should take about 10 times as long as testing for primes around 1000. Do your timing data bear this out? How well do the data for
;100,000 and 1,000,000 support the n prediction? Is your result compatible with the notion that programs on your machine run in time
;proportional to the number of steps required for the computation? 


(define search-for-primes (lambda (low-bound up-bound)
  (define search-for-primes-loop (lambda (x)
    (timed-prime-test x)
    (if (< x up-bound) (search-for-primes-loop (+ x 2)))
    ))
  (search-for-primes-loop (if (even? low-bound) (+ low-bound 1) low-bound))
  ))

;Due to the Moore's Law and the age of this book it makes more sense to test these functions on larger ranges of numbers.

(search-for-primes 100000000000 100000000060) 
;0.17s
(newline)
(search-for-primes 1000000000000 1000000000063) 
;0.53s
(newline)
(search-for-primes 10000000000000 10000000000100) 
;1.7s
(newline)
(search-for-primes 100000000000000 100000000000100) 
;5.3s
(newline)

;When the tested numbers are increased 10 times the time it takes to compute the primality increases approximately in square root of 10
;times. It is the case because we check only square root of n times to find the smallest integer of a number n. Therefore we see an increase
