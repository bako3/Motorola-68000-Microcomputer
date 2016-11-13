           ORG         0
           DC.L        $00506080
           DC.L        $00000100

CRA        EQU         $2003
DDRA       EQU         $2001
PORTA      EQU         DDRA

           ORG         $000100
BACK       BCLR.B      #2,CRA           ;access DDRA
           MOVE.B      #2,DDRA	        ;first input bit input,
					;second bit is output
           BSET.B      #2,CRA		;access PORTA
           MOVE.B      PORTA,D0		;move PORTA to a register (D0)
           LSL.B       #1,D0		;shift D0 left
           MOVE.B      D0,PORTA		;move it back to PORTA to output
           BRA         BACK		;branch to BACK to loop