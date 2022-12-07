#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

*CapsLock:: ; Fire the hotkey even if extra modifiers are being held down.
    If (A_ThisHotkey == A_PriorHotkey && A_TimeSincePriorHotkey < 300)
    {
        If GetKeyState("CapsLock", "T")
            SetCapsLockState, off
        else
            SetCapsLockState, on
    }
Return

