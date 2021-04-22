;Exercise 1.14.  
;Draw the tree illustrating the process generated by the count-change procedure of section 1.2.2 in making change for 11
;cents. What are the orders of growth of the space and number of steps used by this process as the amount to be changed increases? 

;<coins left> (<coin types left>)

;11(1 5 10) -->   1(1 5 10) --> 1(1) --> +1 
; |
;11(1 5) -->     6(1 5)  --> 1(1)
; |                |          |
;11(1)           6(1)        1(1)
; |                |          |
;+1               +1         +1
;
;For 11 cents answer is 4


