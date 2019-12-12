; Andrea Habib   (Andrea.asm)
; Using shift
include \masm32\include\Irvine32.inc
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\Irvine32.lib
includelib \masm32\lib\user32.lib
.data
num DWORD ?
.code
main PROC
;Part 1
mov ecx, 2
mov num, ecx
sar num, 1
mov ecx, num
mov ebx, 30 
mov eax, ebx
sal eax, 4
sal ebx, 2
add eax, ebx
L1:
sar eax, 1

loop L1

call WriteInt

;Part 2
mov eax, 20
mul ebx
div ecx
main ENDP
END main

COMMENT &
300
&
