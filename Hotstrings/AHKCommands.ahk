#SingleInstance, Force
#NoEnv
#Warn
SendMode Input
SetTitleMatchMode, 2
SetWorkingDir %A_ScriptDir%

;===================================================
;            Windows Spy,   ws
;===================================================

::ws::
    If WinActive("Window Spy")
        WinMinimize
    Else if WinExist("Window Spy")
        WinActivate
    Else
        Run, "C:\Program Files\AutoHotkey\WindowSpy.ahk"
Return


;===================================================
;            Autohotkey Help
;===================================================

; ::  Need to decide on some trigger
    If WinActive("AutoHotkey Help")
        WinMinimize
    Else if WinExist("AutoHotkey Help")
        WinActivate
    Else
        Run, "C:\Program Files\AutoHotkey\AutoHotkey.chm"
Return
