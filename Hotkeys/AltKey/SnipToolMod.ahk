#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
SetTitleMatchMode, 2
#SingleInstance, Force

~Pause::Pause

#!n:: ; Improved UX for the old Windows Snipping Tool
    IfWinExist, Snipping Tool ; If it exists,
        WinActivate, Snipping Tool ; bring it to the fore
    WinClose, Snipping Tool ; Start closing it,
    WinWaitClose, Snipping Tool ; Wait for it to finish everything, such as: Save before closing?
    Run, SnippingTool.exe ; Run a new instance
    WinWait, ahk_exe SnippingTool.exe ; Wait for it to finish loading
    Sleep, 100 ; A little extra safety gap
    ControlSend, , !{n}, ahk_class Microsoft-Windows-SnipperToolbar ; Preselects the 'new' snipping button for you
Return
