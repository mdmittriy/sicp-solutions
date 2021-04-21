;Exercise 1.12
;The following pattern of numbers is called Pascal's triangle.

;1 1 1 1 1 1
;1 2 3 4 5   
;1 3 6 10
;1 4 10 20
;1 5 
;1

;The numbers at the edge of the triangle are all 1, and each number inside the triangle is the sum of the two numbers above it.35 Write a
;procedure that computes elements of Pascal's triangle by means of a recursive process. 

(define pascal-recursive (lambda (row col)
    (if (or (= row 0) (= col 0)) 1
           (+ (pascal-recursive row (- col 1)) 
              (pascal-recursive (- row 1) col))) ))

;Compute number in pascal's triangle given the row and column using the formula with factorials.
(define pascal-math (lambda (row col)
    (define ! (lambda (n)
        (if (= n 0) 1
        (* n (! (- n 1))))
    ))
    (/ (! (+ col row)) (* (! row) (! col)))
))



;tests
(display (and
    (= (pascal-math 3 3) (pascal-recursive 3 3))
    (= (pascal-math 4 8) (pascal-recursive 4 8))
    (= (pascal-math 5 7) (pascal-recursive 5 7))
    (= (pascal-math 6 6) (pascal-recursive 6 6))
    (= (pascal-math 7 5) (pascal-recursive 7 5))
    (= (pascal-math 8 4) (pascal-recursive 8 4))
))
