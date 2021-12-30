#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
#SingleInstance, Force
SetTitleMatchMode, 2
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

;==========================================
;    Run Microsoft Edge browser
;     window group, CapsLock & E
;==========================================
; added 9:15PM Dec 23, 2021 ; Doesn't work right yet...
CapsLock & e::
    GroupAdd, EdgeGroup, Microsoft​ Edge ahk_exe msedge.exe
    If WinActive("Microsoft​ Edge ahk_exe msedge.exe")
        GroupActivate, EdgeGroup, R
    ;WinMinimize
    Else if WinExist("Microsoft​ Edge ahk_exe msedge.exe")
        WinActivate
    Else
        Run, "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
Return

