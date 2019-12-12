; Andrea Habib   (Andrea.asm)
; Reverse Strings
include \masm32\include\Irvine32.inc
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\Irvine32.lib
includelib \masm32\lib\user32.lib
.data
source BYTE "Original String", 0
target BYTE ?
.code
main PROC
mov edx, OFFSET source
call WriteString
call Crlf
mov esi, 0
mov edi, LENGTHOF source - 2
mov ecx, SIZEOF source
call Reverse
main ENDP
Reverse PROC
L1:
pop ax
mov al, source[esi]
mov target[edi], al
inc esi
dec edi
push ax
loop L1
mov edx, OFFSET target
call WriteString
call Crlf
Reverse ENDP

END main


COMMENT &
C:\project1>\masm32\bin\ml /c /Zd /coff Andrea.asm
Microsoft (R) Macro Assembler Version 6.14.8444
Copyright (C) Microsoft Corp 1981-1997.  All rights reserved.

 Assembling: Andrea.asm

C:\project1>\masm32\bin\Link /SUBSYSTEM:CONSOLE Andrea.obj
Microsoft (R) Incremental Linker Version 5.12.8078
Copyright (C) Microsoft Corp 1992-1998. All rights reserved.


C:\project1>Andrea.exe
Original String
gnirtS lanigirO
&
