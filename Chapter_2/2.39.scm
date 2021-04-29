;Exercise 2.39.   Complete the following definitions of reverse (exercise 2.18) in terms of fold-right and fold-left from exercise 2.38:


(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
       result
       (iter (op result (car rest))
             (cdr rest))))
  (iter initial sequence))

(define (fold-right op initial sequence) 
  (if (null? sequence) 
      initial 
      (op (car sequence) 
          (fold-right op initial (cdr sequence))))) 

(define (reverse-left sequence)
  (fold-left (lambda (x y) (cons y x)) '() sequence))


(define (reverse-right sequence)
  (fold-right (lambda (x y) (append y (list x))) '() sequence))


;tests
(display (and 
           (equal? (reverse-left '(1 2 3)) (reverse-right '(1 2 3)))
           (equal? (reverse-left '(4 2 3)) (reverse-right '(4 2 3)))
           (equal? (reverse-left '(5 2 3)) (reverse-right '(5 2 3)))))
