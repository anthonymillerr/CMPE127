386 ; Defines Architecture
.model flat, stdcall ; Define Memory Model, Convention to call process
.stack 4096 ; Declaring a Stack
ExitProcess proto,dwExitCode:dword ; Defines prototype of function, Defines Return type

.data
input_string db "Microprocessor", 0 ; Input string initialized to “Microprocessor”
output_string db 14 DUP (?) ; Maximum length of 14 for the reversed string

.code
reverse_string proc ; Reverse string procedure begin
lea esi, input_string ; Load source string address
lea edi, output_string ; Load destination string address
mov ecx, 0 ; Initialize loop counter

find_length: ; Find the length of the input string label
cmp byte ptr [esi + ecx], 0 ; Compare the current character to null terminator
je end_find_length ; Jump to end_find_length if null terminator is found
inc ecx ; Increment the loop counter
jmp find_length ; Jump back to find_length
end_find_length:
dec ecx ; Adjust the counter to point to the last character

reverse_loop: ; Reverse the string label
mov al, [esi + ecx] ; Load a character from the end
mov [edi], al ; Store it in the output string
inc edi ; Move to the next position in the output string
dec ecx ; Move to the previous character in the input string
cmp ecx, 0 ; Check if we have reached the beginning of the string
jge reverse_loop ; If not, continue the loop
mov byte ptr [edi], 0 ; Null-terminate the reversed string
; Display the input string

mov ah, 9 ; Function code for displaying a string
lea dx, input_string ; Load the address of the input string
int 3 ; Breakpoint interrupt
; Display the reversed string

mov ah, 9 ; Function code for displaying a string
lea dx, output_string ; Load the address of the reversed string
int 3 ; Breakpoint interrupt
ret ; Return from procedure
reverse_string endp ; End procedure

main proc ; Main procedure
call reverse_string ; Call the reverse_string procedure

invoke ExitProcess, 0 ;Calling function to exit code with parameter set 0
main endp ; Indicates that main procedure is ending.
end main ; Marks the end of the entire program.
