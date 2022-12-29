#SingleInstance, Force ; Skip invocation dialog box and silently replace previously executing instance of this script.
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode, Input ; Recommended for new scripts due to its superior speed and reliability.
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir% ; Ensures a consistent starting directory.

; Activate NumLock completely
SetNumLockState, AlwaysOn

;===================================================
;       Set CapsLock as another modifier key
;===================================================
; Works good!! The CapsLock key can now be used as another Modifier Key!!!

; Deactivate CapsLock completely
SetCapsLockState, AlwaysOff

; Double click (toggle) for CapsLock to be used as CapsLock
~CapsLock:: ; I added tilde 12/5/22, so CapsLock can also be used as a modifier key with other keys
    KeyWait, CapsLock ; Wait indefinitely until CapsLock is released. I added 12/5/22
    ; If the last hotkey was pressed less than 400ms ago and it was the same hotkey (definition of a double press :) )
    If (A_PriorHotkey=A_ThisHotkey && A_TimeSincePriorHotkey<400)
        If GetKeyState("CapsLock","t") ; If CapsLock is toggled on
            SetCapsLockState, AlwaysOff ; turn CapsLock back to AlwaysOff
        Else
            Send, {CapsLock}
Return

; This was my previous setup using Alt and CapsLock
; Set the CapsLock key to only work as CapsLock when also pressed with Alt
; !CapsLock:: CapsLock ; Turn CapsLock on/off, toggle
; * NOTE IMPORTANT... Single-line hotkey remapping commands MUST use the same modifier key for it to work. Otherwise, use "Send," and "Return" on multiple lines.

; "Return" unnecessary at the end of this script. Each complete single line command has a "Return" at the end implicitly


; Ternary version below not right yet...

; ~CapsLock::
;     KeyWait, CapsLock
;     If (A_PriorHotkey=A_ThisHotkey && A_TimeSincePriorHotkey<400)
;         GetKeyState("CapsLock","t") ? (SetCapsLockState, Off) : (SetCapsLockState, On)
; Return
; (A_PriorHotkey=A_ThisHotkey && A_TimeSincePriorHotkey<400)