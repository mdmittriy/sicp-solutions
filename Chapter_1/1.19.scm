;Exercise 1.19.   
;There is a clever algorithm for computing the Fibonacci numbers in a logarithmic number of steps. Recall the transformation
;of the state variables a and b in the fib-iter process of section 1.2.2: a a + b and b a. Call this transformation T, and observe that
;applying T over and over again n times, starting with 1 and 0, produces the pair Fib(n + 1) and Fib(n). In other words, the Fibonacci
;numbers are produced by applying Tn, the nth power of the transformation T, starting with the pair (1,0). Now consider T to be the special
;case of p = 0 and q = 1 in a family of transformations Tpq, where Tpq transforms the pair (a,b) according to a bq + aq + ap and b bp + aq.
;Show that if we apply such a transformation Tpq twice, the effect is the same as using a single transformation Tp'q' of the same form, and
;compute p' and q' in terms of p and q. This gives us an explicit way to square these transformations, and thus we can compute Tn using
;successive squaring, as in the fast-expt procedure. Put this all together to complete the following procedure, which runs in a logarithmic
;number of steps:41

(define fib (lambda (n)
  (fib-loop 1 0 0 1 n) ))

(define fib-loop (lambda (a b p q count)
  (cond  
    ((= count 0) b)
    ((even? count) 
      (fib-loop 
        a
        b
        (+ (square p) (square q))
        (+ (* 2 p q) (square q))
        (/ count 2)))
    (else (fib-loop 
            (+ (* b q) (* a q) (* a p))
            (+ (* b p) (* a q))
            p
            q
            (- count 1)))) ))
  


;tests
(display (and 
  (= (fib 0) 0)
  (= (fib 1) 1)
  (= (fib 2) 1)
  (= (fib 3) 2)
  (= (fib 4) 3)
  (= (fib 5) 5)
  (= (fib 6) 8)
  (= (fib 7) 13)
  (= (fib 8) 21)
  (= (fib 9) 34)
  (= (fib 10) 55)
  (= (fib 11) 89)))
