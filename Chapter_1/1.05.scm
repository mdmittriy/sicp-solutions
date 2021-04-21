;Exercise 1.5.  
;Ben Bitiddle has invented a test to determine whether the interpreter he is faced with is using applicative-order evaluation or normal-order evaluation. He defines the following two procedures:

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

;Then he evaluates the expression

(test 0 (p))

;What behavior will Ben observe with an interpreter that uses applicative-order evaluation? What behavior will he observe with an interpreter that uses normal-order evaluation? Explain your answer. (Assume that the evaluation rule for the special form if is the same whether the interpreter is using normal or applicative order: The predicate expression is evaluated first, and the result determines whether to evaluate the consequent or the alternative expression.) 

;Answer: 
;In the case of the applicative-order evaluation the operands of the expression '(test 0 (p))' have to be determined before a function call
;and since '(p)' is self referential and creates an infinite loop the initial expression will never be evaluated.

;On the other hand in case of the normal-order evaluation the inner most expressions are evaluated at last and because the predicate '(= x
;0)' ;it is never evaluated and thus the value of the initial expression is going to be '0'.
