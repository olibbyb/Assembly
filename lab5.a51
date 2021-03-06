	ORG 00
	JMP MAIN
	ORG 40H
MAIN:
	MOV P1, #0 ;SET P1 AS OUTPUT
	MOV P2, #0 ;SET P2 AS OUTPUT
	MOV TMOD, #66H ;SET COUNTER 0 AND COUNTER 1 TO MODE 2
	MOV P1, #0F0H ;INITIAL VALUE OF P1
	MOV P2, #0E1H ;INITIAL VALUE OF P2

REPEAT:
	SETB TR0 ;START COUNTER 0
	MOV A, P1 ;MOVES VALUE IN P1 TO ACCUMULATOR
	JNB TF0, $ ;WAIT ON COUNTER 0
	SETB P3.0 ;DISPLAY ON PORT 3 PIN 0
	CLR TR0 ;STOP COUNTER 0
	CLR TF0 ;CLEAR COUNTER 0 FLAG
	
	SETB TR1; START COUNTER 1
	MOV A, P2 ;MOVES VALUE IN P2 TO ACCUMULATOR
	JNB TF1, $ ;WAIT ON COUNTER 1
	SETB P3.1 ;DISPLAY ON PORT 3 PIN 1
	CLR TR1 ;STOP COUNTER 1
	CLR TF1 ;CLEAR COUNTER 1 FLAG
	JMP REPEAT ;CAUSES LOOP
	
	END