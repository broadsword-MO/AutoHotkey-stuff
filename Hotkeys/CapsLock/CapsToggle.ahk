#SingleInstance, Force ; Skip invocation dialog box and silently replace previously executing instance of this script.
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

~CapsLock:: ; I added tilde 12/5/22, so CapsLock can also be used as a modifier key with other keys
    KeyWait, CapsLock ; Wait forever until CapsLock is released. I added 12/5/22
    ; If the last hotkey was pressed less than 400ms ago and it was the same hotkey (definition of a double press :) )
    If (A_PriorHotkey=A_ThisHotkey && A_TimeSincePriorHotkey<400)
        If GetKeyState("CapsLock","t") ; If CapsLock is toggled on
            SetCapsLockState, AlwaysOff ; turn CapsLock back to AlwaysOff
        Else
            Send, {CapsLock}
Return

; Ternary version below not right yet...
; ~CapsLock::
;     KeyWait, CapsLock
;     If (A_PriorHotkey=A_ThisHotkey && A_TimeSincePriorHotkey<400)
;         GetKeyState("CapsLock","t") ? (SetCapsLockState, Off) : (SetCapsLockState, On)
; Return
; (A_PriorHotkey=A_ThisHotkey && A_TimeSincePriorHotkey<400)