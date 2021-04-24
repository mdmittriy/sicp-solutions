;Exercise 2.9.  The width of an interval is half of the difference between its upper and lower bounds. The width is a measure of the
;uncertainty of the number specified by the interval. For some arithmetic operations the width of the result of combining two intervals is a
;function only of the widths of the argument intervals, whereas for others the width of the combination is not a function of the widths of
;the argument intervals. Show that the width of the sum (or diff


;(make-interval 1 2) (make-interval 2 5)
;   width = 0.5             width = 1.5
;
;
;(sum-interval (make-interval 1 2) (make-interval 2 5))
;(3 7)
;width = 2 = 0.5 + 1.5 
;the total width of addition or substraction is equal to the sum of widths of two given intervals
;
;Whereas if we multiply two intervals we get this
;(mul-interval (1 . 3) (2 . 5))
;           width = 1 width = 1.5
;(2 . 15)
;width = 6.5 != 1 + 1.5
