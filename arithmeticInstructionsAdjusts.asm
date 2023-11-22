686p ; Defines Architecture
.model flat, stdcall ; Define Memory Model, Convention to call process
.stack 4096 ; Declaring a Stack
ExitProcess proto,dwExitCode:dword ; Defines prototype of function, Defines Return type

.data ; Variables used in code

.code ; States procedures and instructions
main proc ; Begins initial execution of the code

;1. DAA - Decimal Adjust after Addition
;Initialize AX and BX with given values
MOV AX, 05h ;AX = 05h
MOV BX, 05h ;BX = 05h
ADD AX, BX ;AX = AL + BL
DAA ;Decimal Adjust AX after Addition
;AX will contain the BCD result of the addition

;2. DAS - Decimal Adjust after Subtraction
MOV AX, 20h ;AX = 20h
MOV BX, 05h ;BX = 05h
SUB AX, BX ;AX = AX - BX
DAS ;Decimal Adjust AX after Subtraction
;AX will contain the BCD result of the subtraction

;3. AAA - ASCII Adjust after Addition
MOV AX, 35h ;AX = 35h
MOV BX, 32h ;BX = 32h
ADD AX, BX ;AX = AX + BX
AAA ;ASCII Adjust AX after Addition
;AX will contain the ASCII result of the addition

;4. AAS - ASCII Adjust after Subtraction
MOV AL, 38h ;AL = 38h
MOV BL, 32h ;BL = 32h
SUB AL, BL ;AL = AL - BL
AAS ;ASCII Adjust AL after Subtraction
;AL will contain the ASCII result of the subtraction

;5. AAS - ASCII Adjust after Subtraction
MOV AL, 32h ;AL = 32h
MOV BL, 38h ;BL = 38h
SUB AL, BL ;AL = AL - BL
AAS ;ASCII Adjust AL after Subtraction
;AL will contain the ASCII result of the second subtraction

;6. AAM - ASCII Adjust after Multiplication
MOV AX, 11d ;AX = 11d
MOV BX, 03d ;BX = 03d
MOV AX, 11d ;Set AX to 11d
MUL BX ;Multiply AX by BX
AAM ;ASCII Adjust AX after Multiplication
;AX will contain the ASCII result of the multiplication

;7. AAD - ASCII Adjust before Division
MOV AX, 0408h ;Set AX to 0408h
MOV BL, 04h ;BL = 04h
AAD ;ASCII Adjust AX before Division
DIV BL ;Divide AX by BL
DAA
;AX will contain the ASCII result after division with BCD adjustment

invoke ExitProcess, 0 ;Calling function to exit code with parameter set 0
main endp ; Indicates that main procedure is ending.
end main ; Marks the end of the entire program.