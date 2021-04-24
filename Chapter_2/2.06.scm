;Exercise 2.6.  In case representing pairs as procedures wasn't mind-boggling enough, consider that, in a language that can manipulate
;procedures, we can get by without numbers (at least insofar as nonnegative integers are concerned) by implementing 0 and the operation of
;adding 1 as

(define zero (lambda (f) 
  (lambda (x) x) ))

(define add-1 (lambda (n)
    (lambda (f) (lambda (x) (f ((n f) x))))))

;This representation is known as Church numerals, after its inventor, Alonzo Church, the logician who invented the calculus.
;Define one and two directly (not in terms of zero and add-1). (Hint: Use substitution to evaluate (add-1 zero)). Give a direct definition of
;the addition procedure + (not in terms of repeated application of add-1). 


;add-1
;returns function with one argument 'f' which in turn returns another function that takes argument 'x' and returns 


;(lambda (f) (lambda (x) (f ((n    f)      x))))
;(add-1 zero)
;(lambda (f) (lambda (x) (f ((zero f)      x))))
;(lambda (f) (lambda (x) (f ((lambda (a) a) x)))) 
;(lambda (f) (lambda (x) (f x)))
;;this is one             1
;
;;let's now add-1 to one (changing formal parameters to not get confused)
;(add-1 (add-1 zero))
;(add-1 (lambda (f1) (lambda (x1) (f1 x1))))
;(lambda (f2) (lambda (x2) (f2 ( ((lambda(f1) (lambda (x1) (f1 x1))) f2) x2))))
;(lambda (f2) (lambda (x2) (f2 ( (lambda (x1) (f2 x1)) x2))))
;(lambda (f2) (lambda (x2) (f2 ((lambda (x1) (f2 x1)) x2))))
;(lambda (f2) (lambda (x2) (f2 (f2 x2))))
;;this is two                1   2
;
;(add-1 (lambda (f2) (lambda (x2) (f2 (f2 x2)))))
;(lambda (f3) (lambda (x3) (f3 ((_(lambda (f2) (lambda (x2) (f2 (f2 x2))))_ f3) x3)))))
;(lambda (f3) (lambda (x3) (f3 (_((lambda (f2) (lambda (x2) (f2 (f2 x2)))) f3)_ x3))))
;(lambda (f3) (lambda (x3) (f3 (_(lambda (x2) (f3 (f3 x2)))_x3))))
;(lambda (f3) (lambda (x3) (f3 (f3 (f3 x3)))))
;;this is three              1   2   3

;So to add two numbers we have to have their sum be equal to the number of times a function f is applied inside another function 

;(define add (lambda (x y)
;  (lambda (f) (lambda (x) (f (f (f (f (f ... (f (f x))))))))
;Say x+y=z, then           1  2  3  4  5     z-1 z                        

(define inc (lambda (x) (+ x 1)))

(define church->int (lambda (g)
  ((g inc) 0) ))

(define add (lambda (g1 g2)
  (let 
    ((sum (+ (church->int g1) (church->int g2))))
    (define recur (lambda (x)
      (if (= x 0) zero (add-1 (recur (- x 1))))))
    (recur sum)) ))


;tests
(display (= 4 (church->int (add (add-1 zero) (add-1 (add-1 (add-1 zero)))))))
