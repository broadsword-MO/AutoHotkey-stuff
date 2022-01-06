#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

#SingleInstance, Force ; Only command in Juho-Lee original autoexe section

~Pause::Pause

;Watch the YouTube video in the following link for guidance:
;ENG: https://youtu.be/5-wp9crAnNM
;KOR: https://youtu.be/UBGyaXh3gGY


/* alternative methods for double press only

~ESC::
KeyWait, ESC, U
KeyWait, ESC, D T0.2
If !ErrorLevel
    Msgbox ESC Double Pressed!
return

~Space::
	if (A_PriorHotkey <> "~Space" or A_TimeSincePriorHotkey > 200)
        return
	Msgbox Space Double Pressed!
return
*/

^NumpadEnter:: ;hotkey - You can also use mouse clicks such as ~LButton
	if (KeyPressCount > 0) { ;if key press count is greater than zero because you have run this hotkey just before
		KeyPressCount += 1 ;add a count to existing key press count
	} else {
		KeyPressCount := 1 ;otherwise this is your first time running the hotkey so set press count to one
	}

	tooltip, % KeyPressCount ;tooltip to show key press count

	SetTimer, KeyPressMonitor, 300 ; start label to monitor subsequent key stroke within the next 300 milliseconds

return

KeyPressMonitor:
	if (KeyPressCount = 1) { ; The key was pressed only once
		msgbox single press
		;Run, calc.exe
	} else if (KeyPressCount = 2) { ; The key was pressed twice
		msgbox double press
		;Run, cmd.exe
	} else if (KeyPressCount > 2) { ; The key was pressed more than twice
		msgbox triple or more presses
		;Run, Chrome.exe
	}
	KeyPressCount := 0 ;reset the count to zero
	SetTimer, KeyPressMonitor, Off ;turn label off to stop monitoring for key strokes
	tooltip, ;turn tooltip off
Return

ESC::ExitApp ; Return is implicit

; Return ; Unnecessary