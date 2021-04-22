;Exercise 1.25.
;Alyssa P. Hacker complains that we went to a lot of extra work in writing expmod. After all, she says, since we already know
;how to compute exponentials, we could have simply written

(define (fast-exp base power)
  (define (fast-exp-iter base power acc)
  (cond
    ((= power 0) acc)
    ((odd? power) (fast-exp-iter base (- power 1) (* acc base)))
    (else (fast-exp-iter (square base) (/ power 2) acc))))
  (fast-exp-iter base power 1))

(define (expmod-slow base exp m)
    (remainder (fast-exp base exp) m))


;Is she correct? Would this procedure serve as well for our fast prime tester? Explain. 

(define (expmod base exp m)
    (cond ((= exp 0) 1)
        ((even? exp)
            (remainder (square (expmod base (/ exp 2) m))
            m))
        (else
            (remainder (* base (expmod base (- exp 1) m))
            m))))     


;It would be much longer because because it calculates huge numbers which are then used in other operations like remainder what inevitably
;slows down the process. In our original case, however, because we are constantly taking a reminder after each calculation numbers are
;relatively small and thus the result is computed faster.


;tests
(display (expmod-slow 9999 99999 12883))
(display (expmod 9999 99999 12883))
