; File Name:   p61.asm
; Written by:  Henry Hedden
; Description: Write a procedure named TimeInSeconds that takes
; as input the time in registers as follows:
; * ch contains the hour (0-23)
; * cl contains the minute (0-59)
; * dh contains the second (0-59)
; Challenges: 
; Time Spent: 
;
; Test Case:
; Predicted Results:
;
; Actual Results:
; Do they match?
;
; Revision History:
; Date:              Revised By:      Action:
; ------------------------------------------------------------------
; (11/22/17)         HH              Created
; (11/25/17)         HH              Added function call & variables
; (11/25/17)         HH              Started creating _TimeInSeconds

.386
.MODEL FLAT, stdcall
.STACK 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
totalSeconds DWORD 0

.code
_main PROC

MOV  ch, 23
MOV  cl, 50
MOV  dh,  9
CALL _TimeInSeconds
MOV  totalSeconds, eax

INVOKE ExitProcess, 0
_main ENDP

PUBLIC _TimeInSeconds
_TimeInSeconds PROC

MOV  eax, 60
MOV  ebx,  0
MOV   bl, dh
MUL   ch
ADD   al, cl
MOV   cl, 60
MUL   cl
ADD   al, dh

RET

_TimeInSeconds ENDP

END
