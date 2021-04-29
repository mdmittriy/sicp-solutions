;Exercise 2.37.  Suppose we represent vectors v = (vi) as sequences of numbers, and matrices m = (mij) as sequences of vectors (the rows of
;the matrix).  For example, the matrix is represented as the sequence ((1 2 3 4) (4 5 6 6) (6 7 8 9)). With this representation, we can 
;use sequence operations to concisely express the basic matrix and vector operations. These operations (which are described in any book 
;matrix algebra) are the following: We can define the dot product as

(define (dot-product v w)
    (accumulate + 0 (map * v w)))

;Fill in the missing expressions in the following procedures for computing the other matrix operations. (The procedure accumulate-n is
;in exercise 2.36.)

(define (accumulate op initial sequence)
  (if (null? sequence) 
      initial
      (op (car sequence) 
          (accumulate op initial (cdr sequence)))))


(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (map (lambda (x) (car x)) seqs))
            (accumulate-n op init (map (lambda (x) (cdr x)) seqs)))))


(define (matrix-*-vector m v)
    (map (lambda (x) (dot-product x v)) m))


(define (transpose mat)
    (accumulate-n cons '() mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
       (map (lambda (x) (matrix-*-vector cols x)) m)))


;tests
(display (and 
           (equal? (matrix-*-vector '((1 3) (2 4)) '(5 6)) '(23 34))
           (equal? (transpose '((1 3) (2 4))) '((1 2) (3 4)))
           (equal? (matrix-*-matrix '((1 2) (3 4)) '((1 2) (3 4))) '((7 10) (15 22)))))
