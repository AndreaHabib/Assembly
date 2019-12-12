; Andrea Habib   (Andrea.asm)
; Find first 0
include \masm32\include\Irvine32.inc
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\Irvine32.lib
includelib \masm32\lib\user32.lib
.data
array SWORD 50 DUP(0)
sentinel SWORD 0FFFFh
NONE BYTE "No 0 found!", 0
FOUND BYTE "First 0 is found!", 0
.code
main PROC
mov esi,OFFSET array
mov ecx,LENGTHOF array
L1:	
cmp WORD PTR [esi],0
je print
add esi,TYPE array
loope L1
jz quit
sub esi, TYPE array
quit:
mov edx, OFFSET NONE
call WriteString

jmp gOut
print:
mov edx, OFFSET FOUND
call WriteString
gOut:

main ENDP
END main

COMMENT &
DUP(0) - fill all array of 50 with 0
If array contains 0: Output:
First 0 is found!
DUP(1) - fill all array of 50 with 1
If array doesn't contain 0: Output:
No 0 found!
&

