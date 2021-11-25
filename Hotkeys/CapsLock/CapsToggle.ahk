#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%


Capslock::

If (A_TimeSincePriorHotkey<400 && A_PriorHotkey=A_ThisHotkey) ;if the last hotkey was pressed less than 400ms ago and it was the same hotkey (def of double press :) )

 If GetKeyState("Capslock","t") ;If capslock is set

  SetCapsLockState, Off ;turn capslock off

 Else

  SetCapsLockState, On ;turn it on

Return