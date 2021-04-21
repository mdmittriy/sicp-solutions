;Exercise 1.4.
;Observe that our model of evaluation allows for combinations whose operators are compound expressions. Use this observation to describe the behavior of the following procedure:

(define (a-plus-abs-b a b)
    ((if (> b 0) + -) a b))

;Depending on the sign of b an 'if' conditional evaluates to a primitive operation '+' or '-' which is then passed on to add b to or substract it from a.
