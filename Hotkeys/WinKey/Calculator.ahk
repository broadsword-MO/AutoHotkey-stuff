#SingleInstance, Force
#Warn
SetTitleMatchMode, 2 ; 2 = Partial match of WinTitle
SendMode Input
SetWorkingDir, %A_ScriptDir%
; It works!!!

;============================================
; Run Windows 10 Calculator,  Windows key c
;============================================

#c::
    If WinActive("Calculator")
        WinMinimize
    Else if WinExist("Calculator")
        WinActivate
    Else
        Run, calc.exe
Return
