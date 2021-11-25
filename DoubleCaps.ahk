#SingleInstance, Force
#NoEnv
#Warn
SendMode Input
SetWorkingDir %A_ScriptDir%

;===================================================
;   From AutoCorrect.ahk on AutoHotKey.com
;   (originally Laszlo's) added 12:35PM 5/14/2021
;===================================================
;       Works pretty good.

; The first line of code below is the set of letters, digits, and/or symbols
; that are eligible for this type of correction.  Customize if you wish:
keys = abcdefghijklmnopqrstuvwxyz
Loop Parse, keys
    HotKey ~+%A_LoopField%, Hoty
Hoty:
    CapCount := SubStr(A_PriorHotKey,2,1)="+" && A_TimeSincePriorHotkey<999 ? CapCount+1 : 1
    if CapCount = 2
        SendInput % "{BS}" . SubStr(A_ThisHotKey,3,1)
    else if CapCount = 3
        SendInput % "{Left}{BS}+" . SubStr(A_PriorHotKey,3,1) . "{Right}"
Return

;================== Added from Laszlo's script below ===================
~Shift Up:: ; Handle CamelCase
    key0 := SubStr(A_PriorHotKey,2,1)="+" && A_TimeSincePriorHotkey<999 && CapCount=2
    ? SubStr(A_PriorHotKey,3) : ""
Return

~Pause::Suspend

;===================================================
;   From Laszlo on AutoHotKey.com 5/7/2006
;       added 11:42AM 5/14/2021
;===================================================
;    Works decent

; keys = ``1234567890-=qwertyuiop[]\asdfghjkl;'zxcvbnm,./
; Loop Parse, keys
;     HotKey ~+%A_LoopField%, Hoty

; Hoty:
;     StringMid c0, A_PriorHotKey,2, 1
;     StringMid c1, A_ThisHotKey, 3, 1
;     If (c0 = "+" and A_TimeSincePriorHotkey < 500)
;         Send {BS}%c1%
; Return

;===================================================
;   From Laszlo on AutoHotKey.com 2/28/2007
;       added 11:52AM 5/14/2021
;===================================================
;       Sporadic results

; keys = ``1234567890-=qwertyuiop[]\asdfghjkl;'zxcvbnm,./

; Loop Parse, keys

; HotKey ~+%A_LoopField%, Hoty

; Hoty:

;     CapCount := SubStr(A_PriorHotKey,2,1)="+" && A_TimeSincePriorHotkey<999 ? CapCount+1 : 1

;     IfEqual CapCount,2, SendInput % "{BS}" SubStr(A_ThisHotKey,3,1)

;     IfEqual CapCount,3, SendInput % "{Left}{BS}+" SubStr(A_PriorHotKey,3,1) "{Right}"

; Return

;===================================================
;   From Laszlo on AutoHotKey.com 2/23/2009
;       added 12:27PM 5/14/2021
;===================================================
;       Works decent

; keys = ``1234567890-=qwertyuiop[]\asdfghjkl;'zxcvbnm,./
; Loop Parse, keys
;     HotKey ~+%A_LoopField%, Hoty ; Shifted keys to monitor

; keys = 1234567890qwertyuiopasdfghjklzxcvbnm
; Loop Parse, keys
;     HotKey ~%A_LoopField%, Normal ; Unshifted keys to register as hotkeys

; keys = ``-=[]\;',./
; Loop Parse, keys
;     HotKey ~%A_LoopField%, ~Space ; Special chars to keep 2 capitals before

; Hoty:
;     CapCount := SubStr(A_PriorHotKey,2,1)="+" && A_TimeSincePriorHotkey<999 ? CapCount+1 : 1
;     IfEqual CapCount,2, SendInput % "{BS}{" SubStr(A_ThisHotKey,3,1) "}"
;     IfEqual CapCount,3, SendInput % "{Left}{BS}+{" SubStr(A_PriorHotKey,3) "}{Right}"
; Normal:
; Return

; ~Shift Up:: ; Handle CamelCase
;     key0 := SubStr(A_PriorHotKey,2,1)="+" && A_TimeSincePriorHotkey<999 && CapCount=2
;     ? SubStr(A_PriorHotKey,3) : ""
; Return

; ~Space:: ; Restore 2 capitals before special chars
;     If (key0 <> "" && A_PriorHotKey = "~Shift Up" && A_TimeSincePriorHotkey<999)
;         SendInput % "{Left}{BS}+{" key0 "}{Right}"
; Return

