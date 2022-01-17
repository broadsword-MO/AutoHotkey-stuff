#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance, Force

; Testing the timing of MsgBox and Sleep and how to create vars

TenSeconds := 10 * 1000 ; milliseconds
MsgBox,,, Hi, 10

; Seconds counter floating Tooltip
i := 0
Loop {
    i++
    ToolTip, Seconds: %i%
    Sleep, 1000 ; update every second
}

; Huh, script doesn't continue while loop is still counting...

Sleep, TenSeconds
MsgBox, ; Default text: "Press OK to continue."
Sleep, TenSeconds
send, {return}
MsgBox,,, It's been 10 seconds, 15
Sleep, TenSeconds
MsgBox, Hello
Sleep, TenSeconds
send, {return}
MsgBox, What are you still doing here?

~RButton::ExitApp
; Or
~Pause::Pause

