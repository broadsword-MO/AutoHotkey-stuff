#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
#SingleInstance, Force
SetTitleMatchMode, 2
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

;==========================================
;      Run SMPlayer,    CapsLock & P
;==========================================

CapsLock & p::
    If WinActive("SMPlayer ahk_exe smplayer.exe")
        WinMinimize
    Else if WinExist("SMPlayer ahk_exe smplayer.exe")
        WinActivate
    Else
        Run, "C:\Program Files\SMPlayer\smplayer.exe"
Return

