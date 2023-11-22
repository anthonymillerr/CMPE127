.386 ; Defines Architecture
.model flat, stdcall ; Define Memory Model, Convention to call process
.stack 4096 ; Declaring a Stack
ExitProcess proto,dwExitCode:dword ; Defines prototype of function, Defines Return type

.data
result DWORD ? ; Conditional value for ‘result’ variable

.code
factorial proc ; Factorial procedure begin
mov eax, 1 ; Initialize result to 1
mov ecx, ebx ; Load counter with input (n)

factorial_loop: ; Label for loop
mul ecx ; Multiply result by counter
loop factorial_loop ; Decrement counter and loop if not zero
mov result, eax ; Store the result in 'result' variable
ret ; Return from procedure
factorial endp

main proc ; Main procedure
mov ebx, 5 ; Set value of n to 5
call factorial ; Call the factorial procedure

invoke ExitProcess, 0 ;Calling function to exit code with parameter set 0
main endp ; Indicates that main procedure is ending.
end main ; Marks the end of the entire program.
