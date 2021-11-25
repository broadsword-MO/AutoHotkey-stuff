#SingleInstance, Force
#NoEnv
#Warn
SendMode Input
SetTitleMatchMode, 2
SetWorkingDir %A_ScriptDir%
; First part works... second part only works if file has Admin privileges or is in the Startup folder,... which of course has Admin privileges


;==========================================
; Run VS Code,      	CapsLock v
;==========================================

Capslock & v::
    If WinExist("Visual Studio Code ahk_exe Code.exe")
        WinActivate
    Else
        Run, "C:\Users\dell\AppData\Local\Programs\Microsoft VS Code\Code.exe"
Return