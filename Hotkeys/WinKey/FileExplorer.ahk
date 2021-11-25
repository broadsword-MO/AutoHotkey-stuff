#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

;===================================================
;    Run Windows 10 File Explorer, Windows key e
;===================================================
; Modified from the native use to only open one

#e::
    If WinExist("Explorer")
        WinActivate
    Else
        Run, explorer.exe
Return
