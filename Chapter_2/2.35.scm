;Exercise 2.35.  Redefine count-leaves from section 2.2.2 as an accumulation:

(define (accumulate op initial sequence)
  (if (null? sequence) 
      initial
      (op (car sequence) 
          (accumulate op initial (cdr sequence)))))


;First implementation

(define (fringe tree)
  (cond
    ((null? tree) '())
    ((pair? tree) (append (fringe (car tree)) (fringe (cdr tree))))
    (else (list tree))))


(define (count-leaves-1 tree)
    (accumulate (lambda (x y) (+ 1 y)) 0 (fringe tree)))


;The second way using 
(define (count-leaves tree)
    (accumulate + 0 (map (lambda (x) 1) (fringe tree))))

;tests
(display (and
           (equal? (count-leaves-1 '(((1 2 (3 4) 5)))) 5)
           (equal? (count-leaves-1 '(((1 2 (3 4) 5 6)))) 6)
           (equal? (count-leaves-1 '(((1 2 (3 4) 5 6)) 7 8)) 8)
           (equal? (count-leaves '(((1 2 (3 4) 5)))) 5)
           (equal? (count-leaves '(((1 2 (3 4) 5 6)))) 6)
           (equal? (count-leaves '(((1 2 (3 4) 5 6)) 7 8)) 8) ))

