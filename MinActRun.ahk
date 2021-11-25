#SingleInstance, Force
#NoEnv
#Warn
SendMode Input
SetTitleMatchMode, 2
SetWorkingDir %A_ScriptDir%


;================== Below is from Stack Overflow 2013 and works ===================
; x::StartClose("ahk_class Notepad", "notepad.exe")

; StartClose(title, exe)
; {
;     IfWinExist, %title%
;         WinClose
;     else
;     {
;         Run, %exe%
;         WinActivate
;     }
; }

;================== Mine ===================
; Modified and then modernized for current AHK syntax. Works 5/11/2021

MinActRun(title, exe) {
    If WinActive(title)
        WinMinimize
    Else If WinExist(title)
        WinActivate
    Else
        Run, %exe%
}
