;Exercise 2.3.  Implement a representation for rectangles in a plane. (Hint: You may want to make use of exercise 2.2.) In terms of your
;constructors and selectors, create procedures that compute the perimeter and the area of a given rectangle. Now implement a different
;representation for rectangles. Can you design your system with suitable abstraction barriers, so that the same perimeter and area procedures
;will work using either representation? 

;The first abstract way to calculate area and perimeter of a given rectangle in a plan

(define (make-point x y) (cons x y))
(define (select-x-axis point) (car point))
(define (select-y-axis point) (cdr point))


(define (make-segment point-a point-b) (cons point-a point-b))
(define (select-start-segment segment) (car segment))
(define (select-end-segment segment) (cdr segment))


(define (make-angle a-segment b-segment) (cons a-segment b-segment))
(define (select-a-segment an_angle) (car an_angle))
(define (select-b-segment an_angle) (cdr an_angle))


(define (make-rect a-angle b-angle) (cons a-angle b-angle))
(define (select-a-angle rectangle) (car rectangle))
(define (select-b-angle rectangle) (cdr rectangle))


(define (same-points? point-a point-b)
  (and 
    (= (select-x-axis point-a) (select-x-axis point-b))
    (= (select-y-axis point-a) (select-y-axis point-b))))
       

(define (select-ab-point an-angle)
  (let 
    ((point-a-start (select-start-segment (select-a-segment an-angle)))
    (point-a-end (select-end-segment (select-a-segment an-angle)))
    (point-b-start (select-start-segment (select-b-segment an-angle)))
    (point-b-end (select-end-segment (select-b-segment an-angle))))
  (cond 
    ((or (same-points? point-a-start point-b-start)
         (same-points? point-a-start point-b-end))
     point-a-start)
    ((or (same-points? point-a-end point-b-start)
         (same-points? point-a-end point-b-end))
     point-a-end))))



(define (select-a-point an-angle)
  (let 
    ((point-a-start (select-start-segment (select-a-segment an-angle)))
    (point-a-end (select-end-segment (select-a-segment an-angle)))
    (point-b-start (select-start-segment (select-b-segment an-angle)))
    (point-b-end (select-end-segment (select-b-segment an-angle))))
  (if (same-points? (select-ab-point an-angle) point-a-start) point-a-end point-a-start)))


(define (select-b-point an-angle)
  (let 
    ((point-a-start (select-start-segment (select-a-segment an-angle)))
    (point-a-end (select-end-segment (select-a-segment an-angle)))
    (point-b-start (select-start-segment (select-b-segment an-angle)))
    (point-b-end (select-end-segment (select-b-segment an-angle))))
  (if (same-points? (select-ab-point an-angle) point-b-start) point-b-end point-b-start)))



(define (rect-perim rectangle)
  (let 
    ((a-side-length (distance 
                        (select-a-point (select-a-angle rectangle))
                        (select-ab-point (select-a-angle rectangle))))
     (b-side-length (distance 
                        (select-b-point (select-a-angle rectangle))
                        (select-ab-point (select-a-angle rectangle)))))
    (* 2 (+ a-side-length b-side-length))))


(define (rect-area rectangle)
  (let 
    ((a-side-length (distance 
                        (select-a-point (select-a-angle rectangle))
                        (select-ab-point (select-a-angle rectangle))))
     (b-side-length (distance 
                        (select-b-point (select-a-angle rectangle))
                        (select-ab-point (select-a-angle rectangle)))))
    (abs (* a-side-length b-side-length))))


(define (distance a-point b-point)
  (let 
    ((delta-x (- (select-x-axis a-point) (select-x-axis b-point)))
     (delta-y (- (select-y-axis a-point) (select-y-axis b-point))))
    (sqrt (+ (square delta-x) (square delta-y)))))




;A second way to do the same thing
(define (rectangle-perim ax ay bx by cx cy dx dy)
  (let 
    ((ab-side-length (distance (make-point ax ay) (make-point bx by)))
    (cb-side-length (distance (make-point cx cy) (make-point bx by))))
    (* (+ ab-side-length cb-side-length) 2)))


(define (rectangle-area ax ay bx by cx cy dx dy)
  (let 
    ((ab-side-length (distance (make-point ax ay) (make-point bx by)))
    (cb-side-length (distance (make-point cx cy) (make-point bx by))))
    (* ab-side-length cb-side-length)))


;tests
(define test-rect-a (make-rect (make-angle 
                                        (make-segment (make-point 0 4)
                                                      (make-point 0 0)) 
                                        (make-segment (make-point 3 0) 
                                                      (make-point 0 0)))
                              (make-angle 
                                        (make-segment (make-point 0 4)
                                                      (make-point 0 0)) 
                                        (make-segment (make-point 3 0) 
                                                      (make-point 0 0)))))

(define test-rect-b (make-rect (make-angle 
                                        (make-segment (make-point 0 7)
                                                      (make-point 0 0)) 
                                        (make-segment (make-point (- 21) 0) 
                                                      (make-point 0 0)))
                              (make-angle 
                                        (make-segment (make-point 0 4)
                                                      (make-point 0 0)) 
                                        (make-segment (make-point 3 0) 
                                                      (make-point 0 0)))))
(display 
  (and
    (= (rect-perim test-rect-a) 14)
    (= (rectangle-perim 0 3 4 3 4 0 0 0) 14)
    (= (rect-area test-rect-a) 12)
    (= (rectangle-area 0 3 4 3 4 0 0 0) 12)
    (= (rect-perim test-rect-b) 56)
    (= (rect-area test-rect-b) 147)))
