686p ; Defines Architecture
.model flat, stdcall ; Define Memory Model, Convention to call process
.stack 4096 ; Declaring a Stack
ExitProcess proto,dwExitCode:dword ; Defines prototype of function, Defines Return type

.data ; Variables used in code

.code ; States procedures and instructions
main proc ; Begins initial execution of the code
MOV AL,5 ;Load value 5 into the AL register
MOV CL,5 ;Load value 5 into the CL register
MOV DL,1 ;Load value 1 into the DL register
CMPXCHG CL,DL ;Compare the values where A==CL is true, it becomes
            ;such that CL becomes the value of DL, as the register windows
            ;demonstrate below.
CMPXCHG CL,DL ;CL is now 1 and since A==CL is now NOT true, it becomes such
            ;that AL becomes the value of CL, as the register windows
            ;demonstrate

invoke ExitProcess, 0 ;Calling function to exit code with parameter set 0
main endp ; Indicates that main procedure is ending.
end main ; Marks the end of the entire program.