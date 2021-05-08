(define (scale-list items factor)
  (define (scale-iter items-left)
    (if (null? items-left)
        '()
        (cons (* (car items-left) factor)
              (scale-iter (cdr items-left)))))
  (scale-iter items))

(display (scale-list (list 1 2 3 4) 10))
