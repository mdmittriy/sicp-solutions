;Exercise 2.36.  The procedure accumulate-n is similar to accumulate except that it takes as its third argument a sequence of sequences,
;which are all assumed to have the same number of elements. It applies the designated accumulation procedure to combine all the first
;elements of the sequences, all the second elements of the sequences, and so on, and returns a sequence of the results. For instance, if s is
;a sequence containing four sequences, ((1 2 3) (4 5 6) (7 8 9) (10 11 12)), then the value of (accumulate-n + 0 s) should be the sequence
;(22 26 30). Fill in the missing expressions in the following definition of accumulate-n:

(define (accumulate op initial sequence)
  (if (null? sequence) 
      initial
      (op (car sequence) 
          (accumulate op initial (cdr sequence)))))


(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (first-of-every-sequence seqs))
            (accumulate-n op init (rest-of-every-sequence seqs)))))

(define (rest-of-every-sequence seqs)
  (cond  ((null? seqs) '())
         ((null? (car seqs)) '())
         (else (cons (cdar seqs) (rest-of-every-sequence (cdr seqs))))))
  

(define (first-of-every-sequence seqs)
  (if (null? seqs) 
      '()
      (cons (caar seqs) (first-of-every-sequence (cdr seqs)))))


(display (and 
           (equal? (accumulate-n + 0 '((1 2 3) (4 5 6) (7 8 9) (10 11 12))) '(22 26 30))
           (equal? (accumulate-n + 0 '((2 2 3) (4 5 6) (7 8 9) (10 11 12))) '(23 26 30))
           (equal? (accumulate-n + 0 '((3 2 3) (4 5 6) (7 8 9) (10 11 12))) '(24 26 30))
           ))
