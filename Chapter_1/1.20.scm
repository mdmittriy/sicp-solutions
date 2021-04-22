;Exercise 1.20.  
;The process that a procedure generates is of course dependent on the rules used by the interpreter. As an example, consider
;the iterative gcd procedure given above. Suppose we were to interpret this procedure using normal-order evaluation, as discussed in section
;1.1.5. (The normal-order-evaluation rule for if is described in exercise 1.5.) Using the substitution method (for normal order), illustrate
;the process generated in evaluating (gcd 206 40) and indicate the remainder operations that are actually performed. How many remainder
;operations are actually performed in the normal-order evaluation of (gcd 206 40)? In the applicative-order evaluation? 

(define modulo (lambda (a b) 
  (display 1)
  (remainder a b) ))

(define gcd (lambda (a b)
  (if (= (modulo a b) 0) b (gcd b (modulo a b))) ))

(define pow (lambda (b n)
  (if (= n 0) 1
  (* b (pow b (- n 1))) )))

(gcd 206 40)

;Normal-order:
;(gcd 206, 40)
;predicate eval +1
;+1 (gcd 40 (modulo 206 40))
;predicate eval +2
;+2 (gcd (modulo 206 40) (modulo 40 (modulo 206 40)) )
;predicate eval +4
;+4 (gcd (modulo 40 (modulo 206 40)) (modulo (modulo 206 40) (modulo 40 (modulo 206 40)) )))
;predicate ecval +7
;+7 (= (modulo 4 2) 0) --> 2
;final reduction +4
;(modulo (modulo 206 40) (modulo 40 (modulo 206 40)))

;Answer for normal-order is 18

;Applicative-order
;(gcd 206, 40)
;predicate eval +1=1
;(gcd 40 (modulo 206 40))
;+1=2
;(gcd 40 6)
;predicate eval +1=3
;(gcd 6 (modulo 40 6)
;+1=4
;(gcd 6 4)
;predicate eval +1=5
;(gcd 4 (modulo 6 4))
;+1=6
;(gcd 4 2)
;predicate eval +1=7

;Answer for applicative ordre is 7




;Using this function we can reduce the number of times modulo is applied even further to 4

(define gcd-improved (lambda (a b)
  ((lambda (x) 
     (if (= x 0) b (gcd-improved b x)))
     (modulo a b)) ))

