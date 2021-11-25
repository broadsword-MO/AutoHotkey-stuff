#SingleInstance, Force
#NoEnv
#Warn
SendMode Input
SetTitleMatchMode, 2
SetWorkingDir %A_ScriptDir%

;===================================================
;            Hibernate Windows 10,  Ctrl F1
;===================================================

; Parameter #1: Pass 1 instead of 0 to hibernate rather than suspend.
; Parameter #2: Pass 1 instead of 0 to suspend immediately rather than asking each application for permission.
; Parameter #3: Pass 1 instead of 0 to disable all wake events.
^F1::DllCall("PowrProf\SetSuspendState", "Int", 1, "Int", 0, "Int", 0)

