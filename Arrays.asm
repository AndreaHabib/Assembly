; Andrea Habib   (Andrea.asm)
; Adding arrays
include \masm32\include\Irvine32.inc
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\Irvine32.lib
includelib \masm32\lib\user32.lib
.data
XVAL WORD 20
YVAL WORD 30
ZVAL WORD 40
XYVAL WORD ?
ZXVAL WORD ?
RVAL WORD ?
.code
main PROC
mov ax, XVAL
sub ax, YVAL
mov XYVAL, ax
mov ax, ZVAL
add ax, 3
add ax, XVAL
mov ZXVAL, ax
mov ax, XYVAL
sub ax, ZXVAL
sub ax, 10
sub ax, ZVAL
mov RVAL, ax
movsx eax, RVAL
call DumpRegs	; display the registers
call WRITEINT
exit
main ENDP
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

  EAX=FFFFFF85  EBX=002FB000  ECX=00401000  EDX=00401000
  ESI=00401000  EDI=00401000  EBP=0019FF80  ESP=0019FF74
  EIP=00401054  EFL=00000282  CF=0  SF=1  ZF=0  OF=0  AF=0  PF=0

-123 ;ANS for operation above with given numbers is -123
&