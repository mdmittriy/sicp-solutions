(define (cube x) (* x x x))
(define (inc x) (+ 0.001 x))

(define (sum term a next b)
    (if (> a b) 0
    (+ (term a) (sum term (next a) next b))))
    
(define (integral fun a b dx)
    (define (next x) (+ x dx))
    (* dx (sum fun a next b)))

(define (even? x) (= (remainder x 2) 0))

(define (simp fun a b n)
    (define h (/ (- b a) n))
    (define (next x) (+ x h))
    (define (sf x)
        (cond 
            ((= x a) (fun x))
            ((= x (- b h)) (fun x))
            ((even? (round (/ (- x a) h))) (* 4 (fun x)))
            (else (* 2 (fun x)))))

    (/ (* h (sum sf a next b)) 3))


(newline)
(newline)
(display

  (simp cube 0.0 1.0 10000.0)

)
(newline)
(newline)
