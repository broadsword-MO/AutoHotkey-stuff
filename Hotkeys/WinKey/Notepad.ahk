#SingleInstance, Force
#NoEnv
#Warn
SendMode Input
SetTitleMatchMode, 2
SetWorkingDir %A_ScriptDir%
; Works perfectly


;============================================
; Run Windows 10 Notepad,  Windows key n
;============================================

#n::
    ; WinActive("WinTitle with optional- ahk_exe ahk_class ahk_pid", , , )
    If WinActive("Notepad ahk_exe Notepad.exe")
        WinMinimize
    Else If WinExist("Notepad ahk_exe Notepad.exe")
        WinActivate
    Else
        Run, notepad.exe
Return

