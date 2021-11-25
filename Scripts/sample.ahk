#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

;================== Assorted actions ===================
; ^j::
; MsgBox, Wow!
; MsgBox, There are
; Run, notepad.exe
; WinActivate, Untitled - Notepad
; WinWaitActive, Untitled - Notepad
; Send, 7 lines{!}{Enter}
; SendInput, inside the CTRL{+}J hotkey.
; return

;===================================================
;            A generic function
;===================================================
+4:: ; A hotkey to trigger the using of this function
    z:=myfunc(7,9) ; z is given the value of myfunc(). myfunc() being defined below.
    MsgBox, % "outside " z ; MsgBox tells us what the value of our function/equation is
Return

myfunc(x,y) { ; function name and parameters... 
    MsgBox, % "inside function " x*y ; MsgBox tells us what the value of our function/equation is
    MsgBox, Hi
return x*y ; Return (which tells the function, not just us, what the result of our equation is) and what is to be done with the variables.
}



