;Exercise 2.23.  The procedure for-each is similar to map. It takes as arguments a procedure and a list of elements. However, rather than
;forming a list of the results, for-each just applies the procedure to each of the elements in turn, from left to right. The values returned
;by applying the procedure to the elements are not used at all -- for-each is used with procedures that perform an action, such as printing.
;The value returned by the call to for-each (not illustrated above) can be something arbitrary, such as true. Give an implementation of
;for-each. 


(define (for-each function items)
  (cond ((null? items) #t) 
        (else (function (car items))
              (for-each function (cdr items)))))


(define (show x)
  (newline)
  (display x))

;tests
(for-each show (list 1 2 3 4))
;1
;2
;3
;4
