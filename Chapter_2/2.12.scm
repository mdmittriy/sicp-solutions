;Exercise 2.12.  Define a constructor make-center-percent that takes a center and a percentage tolerance and produces the desired interval.
;You must also define a selector percent that produces the percentage tolerance for a given interval. The center selector is the same as the
;one shown above. 

(define (make-center-percent center percentage)
  (make-interval (* center (- 1 percentage)) (* center (+ 1 percentage))))

(define (select-center interval)
  (/ (+  (lower-bound interval) (upper-bound interval)) 2))

(define (select-percent interval)
  (abs (- 1 (/ (lower-bound interval) (select-center interval)))))


(define (make-interval a b) (cons a b))

(define (lower-bound interval) (min (car interval) (cdr interval)))
(define (upper-bound interval) (max (car interval) (cdr interval)))

(define (add-interval x y)
    (make-interval (+ (lower-bound x) (lower-bound y))
                   (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
    (make-interval (- (lower-bound x) (upper-bound y))
                   (- (upper-bound x) (lower-bound y))))

(define (mul-interval x y)
    (let ((p1 (* (lower-bound x) (lower-bound y)))
         (p2 (* (lower-bound x) (upper-bound y)))
         (p3 (* (upper-bound x) (lower-bound y)))
         (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))


(define (div-interval x y)
  (if (not (> (* (upper-bound y) (lower-bound y)) 0)) (error "error can't divide by zero"))
    (mul-interval x 
          (make-interval (/ 1.0 (upper-bound y))
                         (/ 1.0 (lower-bound y)))))


;tests
(display (div-interval (make-interval 1 3) (make-interval -1 1)))
;error
