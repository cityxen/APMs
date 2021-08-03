.386
.model flat, stdcall
option casemap :none

include e:\masm32\include\kernal32.inc
include e:\masm32\include\masm32.inc
includelib e:\masm32\lib\kernal32.lib
includelib e:\masm32\lib\masm32.lib

.data 
    message db "Hello World!", 0

.code

main:
    invoke StdOut, addr message
    invoke ExitProcess,0
end main