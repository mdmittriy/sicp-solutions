;Exercise 1.26.  Louis Reasoner is having great difficulty doing exercise 1.24. His fast-prime? test seems to run more slowly than his prime?
;test. Louis calls his friend Eva Lu Ator over to help. When they examine Louis's code, they find that he has rewritten the expmod procedure
;to use an explicit multiplication, rather than calling square:

(define (expmod base exp m)
    (cond ((= exp 0) 1)
        ((even? exp)
            (remainder (* (expmod base (/ exp 2) m)
                          (expmod base (/ exp 2) m))
        m))
        (else
            (remainder (* base (expmod base (- exp 1) m))
        m))))

;``I don't see what difference that could make,'' says Louis. ``I do.'' says Eva. ``By writing the procedure like that, you have transformed
;the (log n) process into a (n) process.'' Explain. 


;The expression (expmod base (/ exp 2) m) is evaluated twice in this case and therefore the complexity goes from log_n to n. Whereas by
;using the square procedure this expression is evaluated only once and then multiplied by itself. So by increasing the input in two times
;the original procedure would apply just one more square function, whereas the slow one would have to double the amount of multiplications. 
