	ORG 00
	LJMP MAIN
	
	ORG 0BH ;TIMER 0 ITNERRUPT
	LJMP TIMER0H
	
	ORG 01BH ;TIMER 1 INTERRUPT
	LJMP TIMER1H
	
	ORG 40H
MAIN:
	MOV TMOD, #11H ;TIMER 0 AND TIMER 1 FOR MODE 1
	MOV IE, #82H ;ENABLE TIMER 0
	MOV IE, #88H ;ENABLE TIMER 1
	SETB TR0 ;START TIMER 0
	MOV A, P1 ;READ P1
	MOV P2, A ;DISPLAY VALUE ON P2
	JNB TF0, J0 ;IF OVERFLOW
	JNB TF1, J1 ;IF OVERFLOW
	SETB P3.0 ;STATUS OF TF0
	SETB P3.1 ;STATUS OF TF1
	LJMP MAIN ;LOOP BACK

J0:
	LJMP TIMER0H
J1:
	LJMP TIMER1H

	ORG 100H
TIMER0H:
	CLR TF1 ;CLEARS TF1
	SETB TR1 ;START TIMER 1
	RETI
	
	ORG 140H
TIMER1H:
	CLR TF0 ;CLEARS TF0
	MOV P2, P1 ;UPDATE P2 WITH P1 VALUE
	SETB TR0 ;START TIMER 0
	RETI
	
	END