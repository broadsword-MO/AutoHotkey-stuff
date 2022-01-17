#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance, Force

; Seconds counter trailing Tooltip
; i := 0
; Loop {
;     i++
;     ToolTip, Seconds: %i%
;     Sleep, 1000 ; Loop once every second
; }

Tooltip, Static tooltip
Sleep, 60000

~RButton::ExitApp

; Or
~Pause::Pause ; which pauses most of my scripts

