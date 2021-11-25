#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

~Pause::Suspend

; +a::Toggle := !Toggle
; If (!Toggle)
;     Send, {a down}
; Else
;     Send, {a up}
; Return

; +a::Toggle := !Toggle
; if (Toggle)
;     Loop 20
; {
;     Send {a down} ; Auto-repeat consists of consecutive down-events (with no up-events).
;     Sleep 300 ; The number of milliseconds between keystrokes (or use SetKeyDelay).
; }
; Else
;     Send {a up} ; Release the key.

;================== From Jack Dunnings blog =================== added 11:27AM 6/09/2021
;           Works!
; NumpadEnter::MsgBox % (Switch := !Switch) ; reset
; ? "Switch is on!" ; Ternary operator is equal to If "true"
; : "Switch is off!" ; Ternary operator is equal to Else

;  -----------------------
; +a:: Send % (Switch := !Switch) ; reset
; ? {a down} ; Ternary operator is equal to If "true"
; : {a up} ; Ternary operator is equal to Else 

;================== A simple "while" loop toggle ===================
;   From YouTube video: "AHK is easy to use - AutoHotKey file tutorial"
toggle = 0 ; Apparently unnecessary
#MaxThreadsPerHotkey, 2 ; Maybe unnecessary

f8::
    Toggle := !Toggle
    while Toggle {
        ;Click ; Send a mouse click and ...
        Send a ; Send the letter "a"
        Sleep, 10 ; Wait 10 milliseconds before repeating each time. (There are 1000 ms in one second)
    }
Return


