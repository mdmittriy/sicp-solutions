;Exercise 1.3.
;Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers. 

(define sum-largest-squares (lambda (a b c)
    (- (+ (square a) (square b) (square c))
        (square (min a b c))) ))


;tests
(display (and 
    (= 13 (sum-largest-squares 1 2 3))
    (= 25 (sum-largest-squares 2 3 4))
    (= 100 (sum-largest-squares 4 6 8))
    (= 9 (sum-largest-squares (- 3) (- 9) 0)) ))
