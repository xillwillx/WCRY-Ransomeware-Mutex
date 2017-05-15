.386
.model flat,stdcall
option casemap:none

include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc
include \masm32\include\user32.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib
includelib \masm32\lib\user32.lib


.data
 szMutex        db "Global\MsWinZonesCacheCounterMutexA0",0
 szMsg          db "WCRY Ransomware Mutex Prevention",00Ah, 00Dh, 0
 szMsg2         db "Minimize this window and keep running to protect machine",00Ah, 00Dh, 0
 szMessage      db "WCRY Mutex already exists, machine is already infected!",0

.code

start:
   invoke StdOut, addr szMsg
   invoke StdOut, addr szMsg2
   invoke CreateMutex, NULL, TRUE, addr szMutex  	;Try to create mutex
    test eax, eax									;Check if exists
    invoke GetLastError
   cmp eax,ERROR_ALREADY_EXISTS
     jne @F											;IF exists then let them know, if not then loop forever to protect
   invoke MessageBox,0,addr szMessage,addr szMsg,MB_ICONINFORMATION
   invoke ExitProcess, 0   
@@:
invoke Sleep, 100
jmp  @B

end start
