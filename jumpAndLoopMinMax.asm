.386 ; Defines Architecture
.model flat, stdcall ; Define Memory Model, Convention to call process
.stack 4096 ; Declaring a Stack
ExitProcess proto,dwExitCode:dword ; Defines prototype of function, Defines Return type

.data ; Variables used in code
num1 WORD 5 ; Initialize num1 as 5
num2 WORD 8 ; Initialize num2 as 8
num3 WORD 2 ; Initialize num3 as 2
max_num WORD ? ;Variable to store max number
min_num WORD ? ;Variable to store minimum number

.code ; States procedures and instructions
main proc ; Begins initial execution of the code
mov ax, num1 ; Initialize ax to num1
mov bx, num2 ; Initialize bx to num2
cmp ax,bx ; Compare num1 and num2.
jle c1 ; If num1<=num2 then jump to c1.

;If num1 > num2, set max_num to num1 and min_num to num2
mov max_num, ax
mov min_num, bx
jmp skip ; Jump to skip instruction set

c1:
; If num1 <= num2, set max_num to num2 and min_num to num1
mov max_num, bx
mov min_num, ax

skip:
mov ax, num3 ; Set ax to num3
cmp ax, max_num ; Compare num3 with max_num
jle c2 ; If num3 <= max_num, jump to c2
;If num3 > max_num, set max_num to num3
mov max_num, ax

c2:
cmp ax,min_num ; Compare num3 with min_num
jge done ; If num3 >= min_num, jump to done
;If num3 < min_num, set min_num to num3
mov min_num, ax

done:
invoke ExitProcess, 0 ;Calling function to exit code with parameter set 0
main endp ; Indicates that main procedure is ending.
end main ; Marks the end of the entire program.