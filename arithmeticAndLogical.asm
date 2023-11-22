386 ; Defines Architecture
.model flat, stdcall ; Define Memory Model, Convention to call process
.stack 4096 ; Declaring a Stack
ExitProcess proto,dwExitCode:dword ; Defines prototype of function, Defines Return type

.data ; Variables used in code
a WORD 9 ; Declare type of variable (16 bit) having a value of 9
b WORD 5 ; Declare type of variable (16 bit) having value of 5
mask_ WORD 30 ; Declare type of variable (16 bit) having value of 30
x WORD 2 ; Declare type of variable (16 bit) having value of 2
sum WORD ? ; sum = a+b
sub1 WORD ? ; sub1 = a-b
product WORD ? ; product = a*b
quotient WORD ? ; quotient = a/b
remainder WORD ? ; remainder = a%b
a_minus WORD ? ; a_minus = -a
b_plus1 WORD ? ; b_plus1 = b+1 (Don't use ADD)
a_and_mask WORD ? ; a_and_mask = a & mask
b_or_mask WORD ? ; b_or_mask = b | mask
a_shr_x WORD ? ; a_shr_x = shift right a by x times
b_shl_x WORD ? ; b_shl_x = shift left b by x times
a_ror_x WORD ? ; a_ror_x = rotate right a by x times
b_rcl_x WORD ? ; b_rcl_x = rotate left with carry b by x times

.code ; States procedures and instructions
main proc ; Begins initial execution of the code

;Arithmetic Instruction sum = a + b
mov ax, a ; Load 'a' into AX register
add ax, b ; Add 'b' to AX
mov sum, ax ; Store the result in 'sum'

;Arithmetic Instruction sub1 = a - b
mov ax, a ; Load 'a' into AX register
sub ax, b ; Subtract 'b' from AX
mov sub1, ax ; Store the result in 'sub1'

;Arithmetic Instruction product = a*b
mov ax, a ; Load 'a' into AX register
imul ax, b ; Multiply AX by 'b'
mov product, ax ; Store the result in 'product'

;Arithmetic Instruction quotient = a/b
mov ax, a ; Load 'a' into AX register
cwd ; Convert AX
idiv b ; Divide by 'b', quotient in AX
mov quotient, ax ; Store the quotient in 'quotient'

;Arithmetic Instruction remainder = a%b
mov ax, a ; Load 'a' into AX register
cwd ; Convert AX
idiv b ; Divide by 'b', remainder in DX
mov remainder, dx ; Store the remainder in 'remainder'

;Arithmetic Instruction a_minus = -a
mov ax, a ; Load 'a' into AX register
neg ax ; Negate the value in AX
mov a_minus, ax ; Store the result in 'a_minus'

;Arithmetic Instruction b_plus1 = b + 1 (Not using ADD)
mov ax, b ; Load 'b' into AX register
inc ax ; Increment AX by 1
mov b_plus1, ax ; Store the result in 'b_plus1'

;Logical Instruction a_and_mask = a & mask_
mov ax, a ; Load 'a' into AX register
and ax, mask_ ; Execute AND with 'mask_'
mov a_and_mask, ax ; Store the result in 'a_and_mask'

;Logical Instruction b_or_mask = b | mask_
mov ax, b ; Load 'b' into AX register
or ax, mask_ ; Execute OR with 'mask_'
mov b_or_mask, ax ; Store the result in 'b_or_mask'

;Logical Instruction a_shr_x = shift right a by x times
mov ax, a ; Load 'a' into AX register
mov cx, x ; Load 'x' into CX register
shr ax, cl ; Shift AX right by CL bits
mov a_shr_x, ax ; Store the result in 'a_shr_x'

;Logical Instruction b_shl_x = shift left b by x times
mov ax, b ; Load 'b' into AX register
mov cx, x ; Load 'x' into CX register
shl ax, cl ; Shift AX left by CL bits
mov b_shl_x, ax ; Store the result in 'b_shl_x'

;Logical Instruction a_ror_x = rotate right a by x times
mov ax, a ; Load 'a' into AX register
mov cx, x ; Load 'x' into CX register
ror ax, cl ; Rotate AX right by CL bits
mov a_ror_x, ax ; Store the result in 'a_ror_x'

;Logical Instruction b_rcl_x = rotate left with carry b by x times
mov ax, b ; Load 'b' into AX register
mov cx, x ; Load 'x' into CX register
rcl ax, cl ; Rotate AX left with carry by CL bits
mov b_rcl_x, ax ; Store the result in 'b_rcl_x'

invoke ExitProcess, 0 ; To terminate the program, using 0 as exit code.
main endp ; Indicates that the main procedure is ending.
end main ; Marks the end of the entire program.
