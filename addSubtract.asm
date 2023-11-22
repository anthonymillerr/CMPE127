.386 ; Defines Architecture
.model flat, stdcall ; Defines Memory Model, Convention to call process
.stack 4096 ; Declaring A Stack
ExitProcess proto,dwExitCode:dword ; Defines prototype of function, Defines Return type

.data ; Variables used in code
a WORD 9 ; Declare type of variable (16 bit) having value of 9
sum DWORD ? ; Declare type of variable (32 bit) but do not wish to initialize using “?”
diff DWORD ? ; Declare type of variable (32 bit) but do not wish to initialize using “?”

.code ; States procedures and instructions
main proc ; Begins initial execution of the code

mov eax, 7 ; To move the value 7 into the eax register.
add eax, 4 ; To add the value 4 into the contents of the eax register.
mov sum, eax ; To move the contents of the eax register into the memory location of
the variable “sum”.

mov eax, 12345 ; To move the hexadecimal value 0x1234 into the eax register.
sub eax, 2 ; To subtract the value stored in the memory location ‘a’ from what is
contained in the eax register.
mov diff, eax ; To move the result of the subtraction into the memory location of the
“diff” variable.

invoke ExitProcess, 0 ; To terminate the program, using 0 as the exit code.

main endp ; Indicates that main procedure is ending
end main ; Marks the end of the entire program