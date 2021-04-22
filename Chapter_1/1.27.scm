;Exercise 1.27.  Demonstrate that the Carmichael numbers listed in footnote 47 really do fool the Fermat test. That is, write a procedure
;that takes an integer n and tests whether an is congruent to a modulo n for every a<n, and try your procedure on the given Carmichael
;numbers.

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

(define (prime? n) (fast-prime? n 100))

           
(display (or
    (prime? 1105)
    (prime? 1729)
    (prime? 2465)
    (prime? 2821)
    (prime? 6601)
    (prime? 561)))
;#t

;Wheras it should be false since all of these numbers are not prime.

