.386 ; Defines Architecture
.model flat, stdcall ; Define Memory Model, Convention to call process
.stack 4096 ; Declaring a Stack
ExitProcess proto,dwExitCode:dword ; Defines prototype of function, Defines Return type

.data ; Variables used in code
num1 WORD 5 ; Input number
my_sum WORD ? ;Variable to store the sum

.code ; States procedures and instructions
main proc ; Begins initial execution of the code
mov ecx, 0 ; Initialize ECX register with 0
mov cx, num1 ; Initialize CX register with num1

;loop for sum
sum_loop:
add my_sum, cx ; Add current value of CX to my_sum
loop sum_loop ; Decrement CX and loop if CX is not zero

invoke ExitProcess, 0 ;Calling function to exit code with parameter set 0
main endp ; Indicates that main procedure is ending.
end main ; Marks the end of the entire program.