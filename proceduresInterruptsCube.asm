.386 ; Defines Architecture
.model flat, stdcall ; Define Memory Model, Convention to call process
.stack 4096 ; Declaring a Stack
ExitProcess proto,dwExitCode:dword ; Defines prototype of function, Defines Return type

.data
result DWORD ? ; Conditional value in variable result

.code
cube proc uses ecx ; Cube procedure begin
mov eax, ecx ; Load the number into eax
imul eax, ecx ; Multiply by itself (square)
imul eax, ecx ; Multiply by the original number (cube)
mov result, eax ; Store the result in 'result' variable
ret ; Return from procedure
cube endp ; End cube procedure

main proc ; Main procedure
mov ecx, 4 ; Load value of 4 into ecx register
call cube ; Call the cube procedure

invoke ExitProcess, 0 ; Calling function to exit code with parameter set 0
main endp ; Indicates that main procedure is ending.
end main ; Marks the end of the entire program.
