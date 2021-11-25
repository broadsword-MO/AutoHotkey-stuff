#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
#SingleInstance, Force
SetTitleMatchMode, 2
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

;==========================================
; Run VLC Media Player,       CapsLock & l
;==========================================

CapsLock & l::
    If WinActive("VLC media player ahk_exe vlc.exe")
        WinMinimize
    Else if WinExist("VLC media player ahk_exe vlc.exe")
        WinActivate
    Else
        Run, "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe"
Return

