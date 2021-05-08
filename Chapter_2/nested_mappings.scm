(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (enumerate-interval start end)
  (if (> start end)
      '()
      (cons start (enumerate-interval (+ start 1) end))))

(define (filter pred sequence)
  (cond 
    ((null? sequence) '())
    ((pred (car sequence))
      (cons (car sequence) 
            (filter pred (cdr sequence))))
    (else (filter pred (cdr sequence)))))


(define (sum-prime? x)
  (prime? (+ (car x) (cadr x))))

(define (prime? n)
  (define (helper a)
    (cond
        ((> (square a) n) #t)
        ((= (gcd a n) 1) (helper (+ a 1)))
        (else #f)))
  (helper 2))

(define (flat-map proc sequence)
  (accumulate append
              '()
              (map proc sequence)))


(define (prime-sum-pairs n)
  (map (lambda (x) (append x (list (+ (car x) (cadr x)))))
       (filter sum-prime?
               (flat-map (lambda (i)
                                  (map (lambda (j) (list i j))
                                       (enumerate-interval 1 (- i 1))))
                         (enumerate-interval 1 8)))))

(display (prime-sum-pairs 10))
