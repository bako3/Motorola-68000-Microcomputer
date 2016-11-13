           ORG         0
           DC.L        $00506080
           DC.L        $00000100

CRA        EQU         $2003
DDRA       EQU         $2001
PORTA      EQU         DDRA
CRB        EQU         $2007
DDRB       EQU         $2005
PORTB      EQU         DDRB

           ORG         $000300
           DC.B        $7E             ;0
           DC.B        $30             ;1
           DC.B        $6D             ;2
           DC.B        $79             ;3
           DC.B        $33             ;4
           DC.B        $5B             ;5
           DC.B        $5F             ;6
           DC.B        $70             ;7
           DC.B        $FF             ;8
           DC.B        $7B             ;9
           DC.B        $00             ;-A
           DC.B        $00             ;-B
           DC.B        $00             ;-C
           DC.B        $00             ;-D
           DC.B        $00             ;-E
           DC.B        $00             ;-F

           ORG         $000100
BACK       BCLR.B      #2,CRA          ;access DDRA
           MOVE.B      #$00,DDRA       ;first 4 bits are inputs
           BSET.B      #2,CRA          ;access PORTA

           BCLR.B      #2,CRB          ;access DDRB
           MOVE.B      #$FF,DDRB       ;all bits are outputs
           BSET.B      #2,CRB          ;access PORTB

           LEA.L       $000300,A0      ;move look-up table address to pointer
           CLR.L       D0              ;clear D0
           MOVE.B      PORTA,D0        ;move inputs to data register
           ANDI.W      #$00FF, D0      ;zero extend
           MOVE.B      (A0,D0.W),PORTB ;move byte from look-up table
           BRA         BACK