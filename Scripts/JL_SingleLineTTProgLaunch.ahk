#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

; From Juho-Lee.com
; Single Line tooltip to launch programs

; LINK Watch the YouTube video in the following link for guidance:
;ENG: https://youtu.be/_0hQENoxkxs
;KOR: https://youtu.be/OkpL8ojfbOE


#SingleInstance,Force

i:=0
return

+WheelUp::
i++
if i > 6
	i := 6
gosub, tooltipsub
return

+WheelDown::
i--
if i < 1
	i:=1
gosub, tooltipsub
return

tooltipsub:

command1:= "Calculator"
command2:= "Chrome"
command3:= "Desktop"
command4:= "Notepad"
command5:= "New Email"
command6:= "My AutoHotkey Script"

switch i
{
case 1: tooltip, %command1%
case 2: tooltip, %command2%
case 3:	tooltip, %command3%
case 4:	tooltip, %command4%
case 5: tooltip, %command5%
case 6: tooltip, %command6%
}
return

#If MouseIsOver("ahk_class tooltips_class32")

RButton::
MouseGetPos,,, ID
WinClose, ahk_ID %ID%
return

LButton::
ControlGetText, tooltipText,,ahk_class tooltips_class32

switch tooltipText
{
case command1: Run, Calc.exe
case command2: Run, Chrome.exe
case command3: Run, %A_Desktop%
case command4: Run, Notepad.exe
case command5: Run, mailto:
case command6: Run, C:\Users\juho2\Desktop\Temporary Scripts\Test Script 2.ahk
}
Tooltip,
return

#If 

MouseIsOver(WinTitle)
{
	MouseGetPos,,, ID
	return WinExist(WinTitle " ahk_id " ID)
}
return

ESC::ExitApp
;ESC::Tooltip,