; Xiaoyun Wang 
; 46 rules

; Add S at the beginning of the string

0 * * L A1
A1 _ S R A

; change x to a's and b's

A 0 a R A
A 1 b R A
A # * R RR ; read right side of #
A _ _ R TRJ; there is no #


; RR; to read 
RR 0 a L C0; move left and compare if it is 0
RR 1 b L C1; move left and compare if it is 1

RR * * R RR;  keep moving
RR _ * L TD; to decide whether reject or accept

; compare if 0
C0 * * L C0
C0 _ * R C0C

; compare if 1

C1 * * L C1
C1 _ * R C1C

;C0C and C1C
C0C a % R RR; the same
C0C b ! R RR; different
C0C * * R C0C; else keep moving
C0C # * R TRJ ; means |y|>|x|

C1C b % R RR ; the same
C1C a ! R RR ; different
C1C * * R C1C; else keep moving
C1C # * R TRJ ; means |y|>|x|

;move to the Left 
TD * * L TD
TD _ * R MT1; decide and in a _; get to the left side of string


;MT1;more than 1 #
MT1 # * R DCD; there is one #
MT1 * * R MT1; else keep 

;DCD decide if there is more than 1 # 
DCD # * R TRJ; x and y are exactly same go to "to reject" 
DCD * * R DCD; go to next step to see whether there is only one different
DCD _ _ L NDCD;might need to change
DCD S * R NDCD; to judge the chars between S and #   

; NDCD; to check number of ! is 1 or not
NDCD * * L NDCD
NDCD S * R TNE; to find if there is more than 1 unequal chars in x and y   

; TNE ; if there are more than one ! 
TNE ! * R TME
TNE # * R TRJ
TNE * * R TNE


;TME

TME # * R TAC; only one ! |x|=|y| 
TME % * R TME; keep searching
TME * * R TRJ; |x|>|y| or more than 1 !


; TRJ; to reject, eliminate all the chars and then return 0
TRJ * * R TRJ
TRJ _ * L RJ 

;RJ

RJ * _ L RJ
RJ S 0 L halt



; TAC; to accept eliminate all the chars and then return 1
TAC * * R TAC
TAC _ * L AC

; AC
AC * _ L AC
AC S 1 L halt

