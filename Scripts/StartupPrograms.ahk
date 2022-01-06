#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance, Force

; Maybe change this to run on each login/wakeup, not just startup
; Need to consider what other programs to add

TenSeconds := 10 * 1000 ; in milliseconds

Run, C:\Users\dell\Downloads\MEGA\Doug's docs\AHK\CapsMod2.ahk
Sleep, TenSeconds
Run, C:\Users\dell\Downloads\MEGA\Doug's docs\AHK\AutoCorrect.ahk
Sleep, TenSeconds
Run, C:\Users\dell\Downloads\MEGA\Doug's docs\AHK\Hotstrings\Time.ahk
Sleep, TenSeconds
Run, C:\Users\dell\Downloads\MEGA\Doug's docs\AHK\Scripts\ScreenClipByLO.ahk
Sleep, TenSeconds
Run, C:\Users\dell\Downloads\MEGA\Doug's docs\AHK\Hotkeys\CtrlKey\ContextSensitiveHelp.ahk
Sleep, TenSeconds
; What's next?

~Pause::Pause ; Pause this script with the Pause key.
; ExitApp ; Doesn't work, apperently the interior scripts loose admin privileges