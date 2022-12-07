#SingleInstance, Force ; Skip invocation dialog box and silently replace previously executing instance of this script.
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 2 ; A window's title can contain WinTitle anywhere inside it to be a match.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

;==========================================
;      Run SMPlayer,    CapsLock p
;==========================================

CapsLock & p::
    If WinActive("SMPlayer ahk_exe smplayer.exe")
        WinMinimize
    Else if WinExist("SMPlayer ahk_exe smplayer.exe")
        WinActivate
    Else
        Run, "C:\Program Files\SMPlayer\smplayer.exe"
Return

