; Andrea Habib   (Andrea.asm)
; Encrypt text
include \masm32\include\Irvine32.inc
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\Irvine32.lib
includelib \masm32\lib\user32.lib
KEY = 239
BUFMAX = 128
.data
Prompt  BYTE "Enter the plain text:",0 
Encrypt BYTE "Cipher text: ",0 
Decrypt BYTE "Decrypted: ",0
buffer  BYTE BUFMAX+1 DUP(0)
bufSize DWORD ?
.code
main PROC
mov edx, OFFSET Prompt
call WriteString
mov ecx, BUFMAX
mov edx, OFFSET buffer
call ReadString
mov bufSize, eax
call Crlf
mov edx, OFFSET Encrypt
call WriteString

call Encryption

mov edx, OFFSET buffer
call WriteString
call Crlf

mov edx, OFFSET Decrypt
call WriteString

call Encryption

mov edx, OFFSET buffer
call WriteString
call Crlf

main ENDP

Encryption PROC

pushad 
mov ecx,bufSize
mov esi, 0
L1:
xor buffer[esi], KEY
inc esi
loop L1
popad
ret 

Encryption ENDP

END main
COMMENT &

C:\project1>\masm32\bin\ml /c /Zd /coff Enc.asm
Microsoft (R) Macro Assembler Version 6.14.8444
Copyright (C) Microsoft Corp 1981-1997.  All rights reserved.

 Assembling: Enc.asm

C:\project1>\masm32\bin\Link /SUBSYSTEM:CONSOLE Enc.obj
Microsoft (R) Incremental Linker Version 5.12.8078
Copyright (C) Microsoft Corp 1992-1998. All rights reserved.


C:\project1>Enc.exe
Enter the plain text:Hey

Cipher text: ºèû
Decrypted: Hey
&

