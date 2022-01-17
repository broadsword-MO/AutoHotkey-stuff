#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
#SingleInstance, Force
SetTitleMatchMode, 2
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

;==========================================
;       Run Microsoft Edge browser
;       window group, CapsLock & E
;==========================================
; added 9:15PM Dec 23, 2021
; last edited 11:03AM Jan 07, 2022
        CapsLock & e::
            GroupAdd, EdgeGroup, Microsoft​ Edge ahk_exe msedge.exe
            If WinActive("Microsoft​ Edge ahk_exe msedge.exe") {
                GroupActivate, EdgeGroup, R
                Sleep, 200
                WinMinimize
            } Else if WinExist("Microsoft​ Edge ahk_exe msedge.exe")
            GroupActivate, EdgeGroup
            Else
                Run, "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
        Return

