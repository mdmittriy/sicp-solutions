;Exercise 2.22.  Louis Reasoner tries to rewrite the first square-list procedure of exercise 2.21 so that it evolves an iterative process:

(define (square-list-1 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things) 
              (cons (square (car things))
                    answer))))
  (iter items '()))

;Unfortunately, defining square-list this way produces the answer list in the reverse order of the one desired. Why?

;Answer: Louis after the first iteration of his argument has the first value of the list as the variable answer and then after each iteration 
;he 'envelopes' it with successive values of the list and in the result gets a reversed squared list. 


;Louis then tries to fix his bug by interchanging the arguments to cons:

(define (square-list-2 items)
  (define (iter things answer)
    (if (null? things)
       answer
       (iter (cdr things)
             (cons answer
                   (square (car things))))))
  (iter items '()))

;This doesn't work either. Explain. 

;Answer: by doing so he just interchanged left and right value of each pair. So no instead of pointers being in the 'right box' they are in
;the left one and vice versa for squared values. 
