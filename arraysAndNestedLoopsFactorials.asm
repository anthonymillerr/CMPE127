.386 ; Defines Architecture
.model flat, stdcall ; Define Memory Model, Convention to call process
.stack 4096 ; Declaring a Stack
ExitProcess proto,dwExitCode:dword ; Defines prototype of function, Defines Return type

.data ; Variables used in code
numbers DW 2, 4, 3, 7; Initialize numbers with array values
result DW 4 DUP (1) ; Initialize result with 1,1,1,1 (4 times)
size DW 4 ; Initialize size of array to 4

.code ; States procedures and instructions
main proc ; Begins initial execution of the code
MOV ECX, size ; Initialize counter to array size (4)
MOV ESI, 0 ; Initialize offset to 0

OUTER_LOOP:
MOV AX, 1 ; Initialize the factorial result to 1
MOV BX, [numbers + ESI] ; Load the current number from the array

INNER_LOOP:
MUL BX ; Multiply AX by the current number
DEC BX ; Decrement the current number
CMP BX, 0 ; Check if the current number is greater than 0
JNZ INNER_LOOP ; If yes, continue the inner loop
MOV [result + ESI], AX ; Store the factorial result in the result array
ADD ESI, 2 ; Move to the next element in the array
LOOP OUTER_LOOP ; Continue the outer loop until all elements are processed

invoke ExitProcess, 0 ;Calling function to exit code with parameter set 0
main endp ; Indicates that main procedure is ending.
end main ; Marks the end of the entire program.
