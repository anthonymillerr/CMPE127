.386 ; Defines Architecture
.model flat, stdcall ; Define Memory Model, Convention to call process
.stack 4096 ; Declaring a Stack
ExitProcess proto,dwExitCode:dword ; Defines prototype of function, Defines Return type

.data ; Variables used in code
sum WORD ? ; Declare type of variable (16 bit) but do not wish to initialize using '?'
var1 WORD 5 ; Declare type of variable (16 bit) having a value of 5

.code ; States procedures and instructions
main proc ; Begins initial execution of the code
MOV AX, 0FFFFh ; Immediate Addressing mode due to data present in the address
                field of instruction. Moving the data 0FFFFh into the AX register.
MOV BX, 7h ; Immediate Addressing mode due to the data present in the address field
            of instruction. Moving the data 7h into the BX register.
ADD AX,BX ; Register mode due to operand placed in a general register, in which data
            is specified by instruction. Add contents of BX register to AX register.
CLC ; Implied mode due to data being part of the instruction, where zero address
        instruction is designed with implied mode. Used to reset the Carry flag to 0).
        Carry Flag changes to 0
MOV sum, AX ; Register mode due to operand placed in a general register, in which
            data is specified by instruction. Add contents of AX register to sum variable.
MOV AX, BX ; Register mode due to operand placed in a general register, in which
            data is specified by instruction. Move the contents of the BX register to the AX
            register.
LEA EBX, var1 ; To load base address, of base register (EBX), of memory location
MOV AX, [EBX] ; Register Indirect mode due to moving the contents of memory
                location addressed by the register EBX to the register AX.
MOV ESI, OFFSET sum ; To load base address, of index register (ESI), of memory
                    location.
MOV BX, [ESI + 02] 
LEA EBX, sum ; To load base address, of base register (EBX), of memory location.
MOV ESI, 02 ; Immediate Addressing mode due to data present in the address field of
                instruction. Moving the displacement data 02 into the ESI index register.
MOV CX, [EBX + ESI] 

invoke ExitProcess, 0 ; To terminate the program, using 0 as exit code.
main endp ; Indicates that the main procedure is ending.
end main ; Marks the end of the entire program.