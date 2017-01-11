states:         q1,q2,q3,q4,q5,q6,q7,qA,qR
input_alphabet: 0,1
tape_alphabet:  0,1,_
start_state:    q1
accept_state:   qA
reject_state:   qR

delta:  
        q1,0 -> q2,_,R
        q1,1 -> q3,_,R
        q1,_ -> qA,_,S 
    
        q2,_ -> q4,_,L
        q2,? -> q2,?,R

        q3,_ -> q5,_,L
        q3,? -> q3,?,R

        q4,0 -> q6,_,L
        q4,_ -> qA,_,S 
        q4,? -> qR,?,S
        
        q5,1 -> q6,_,L
        q5,_ -> qA,_,S
        q5,? -> qR,?,S

        q6,_ -> qA,_,S
        q6,? -> q7,?,L
        
        q7,_ -> q1,_,R
        q7,? -> q7,?,L

        
        
