;Exercise 1.11.  
;A function f is defined by the rule that f(n) = n if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n> 3. Write a
;procedure that computes f by means of a recursive process. Write a procedure that computes f by means of an iterative process. 

;Recursive process
(define f1 (lambda (n)
    (cond 
        ((< n 3) n)
        (else 
            (+ (f1 (- n 1)) 
            (* 2 (f1 (- n 2)))
            (* 3 (f1 (- n 3))) 
            )))))

;Iterative process
(define f2 (lambda (n)
    (define iter (lambda (o a b c)
        (if (= c n) o 
            (iter 
              a
              b
              (+ b 
                 (* 2 a)
                 (* 3 o)) 
              (+ c 1)))
    ))    
    (iter 0 1 2 0)
))


;tests
(display 
  (and 
    (= (f1 2) (f2 2))
    (= (f1 3) (f2 3))
    (= (f1 4) (f2 4))
    (= (f1 5) (f2 5))))
