.386 ; Defines Architecture
.model flat, stdcall ; Define Memory Model, Convention to call process
.stack 4096 ; Declaring a Stack
ExitProcess proto,dwExitCode:dword ; Defines prototype of function, Defines Return type

.data ; Variables used in code
numbers DW 2, 4, 3, 7 ; Initialize numbers with array values
result DW 4 DUP (0) ; Initialize result with 0,0,0,0 (4 times)

.code ; States procedures and instructions
main proc ; Begins initial execution of the code
MOV ECX, 4 ; Initialize counter to array size
MOV ESI, 0 ; Initialize offset to 0

OUTER_LOOP:
MOV AX, [numbers + ESI] ; Load the current number into AX
IMUL AX, AX ; Multiply AX by itself to get the square
MOV [result + ESI], AX ; Store the result in the result array
ADD ESI, 2 ; Move to the next number in the array
LOOP OUTER_LOOP ; Repeat the outer loop

invoke ExitProcess, 0 ;Calling function to exit code with parameter set 0
main endp ; Indicates that main procedure is ending.
end main ; Marks the end of the entire program.
