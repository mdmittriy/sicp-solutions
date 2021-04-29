;Exercise 2.33.  Fill in the missing expressions to complete the following definitions of some basic list-manipulation operations as
;accumulations:


(define (accumulate op initial sequence)
  (if (null? sequence) 
      initial
      (op (car sequence) 
          (accumulate op initial (cdr sequence)))))


(define (map proc sequence)
    (accumulate (lambda (x y) (cons (proc x) y)) '() sequence))


(define (append seq1 seq2)
    (accumulate cons seq2 seq1))

(define (length sequence)
    (accumulate (lambda (x y) (+ 1 y)) 0 sequence))





;tests
(display (and 
            (equal? (map square (list 1 2 3 4)) '(1 4 9 16))
            (equal? (append (list 1 2 3) (list 4 5 6)) '(1 2 3 4 5 6))
            (equal? (length (list 1 2 3)) 3)))
