; Context Sensitive Help in Any Editor -- by Rajat
; https://www.autohotkey.com
; This script makes Ctrl+2 (or another hotkey of your choice) show the help file
; page for the selected AutoHotkey command or keyword. If nothing is selected,
; the command name will be extracted from the beginning of the current line.

; The hotkey below uses the clipboard to provide compatibility with the maximum
; number of editors (since ControlGet doesn't work with most advanced editors).
; It restores the original clipboard contents afterward, but as plain text,
; which seems better than nothing.
#SingleInstance, Force
SetTitleMatchMode, 2

; Ctrl 2 is the default hotkey

$^2:: ; Show the help page for the selected AutoHotkey keyword
	; The following values are in effect only for the duration of this hotkey thread.
	; Therefore, there is no need to change them back to their original values
	; because that is done automatically when the thread ends:
	SetWinDelay 10
	SetKeyDelay 0
	AutoTrim, On

	if A_OSType = WIN32_WINDOWS ; Windows 9x
		Sleep, 500 ; Give time for the user to release the key.

	C_ClipboardPrev = %clipboard%
	clipboard =
	; Use the highlighted word if there is one (since sometimes the user might
	; intentionally highlight something that isn't a command):
	Send, ^c
	ClipWait ; Modified from original 0.1 timing
	if ErrorLevel <> 0
	{
		; Get the entire line because editors treat cursor navigation keys differently:
		Send, {home}+{end}^c
		ClipWait, 0.2
		if ErrorLevel <> 0 ; Rare, so no error is reported.
		{
			clipboard = %C_ClipboardPrev%
			return
		}
	}
	C_Cmd = %clipboard% ; This will trim leading and trailing tabs & spaces.
	clipboard = %C_ClipboardPrev% ; Restore the original clipboard for the user.
	Loop, parse, C_Cmd, %A_Space%`, ; The first space or comma is the end of the command.
	{
		C_Cmd = %A_LoopField%
		break ; i.e. we only need one interation.
	}
	IfWinNotExist, AutoHotkey Help
	{
		; Determine AutoHotkey's location:
		RegRead, ahk_dir, HKEY_LOCAL_MACHINE, SOFTWARE\AutoHotkey, InstallDir
		if ErrorLevel ; Not found, so look for it in some other common locations.
		{
			if A_AhkPath
				SplitPath, A_AhkPath,, ahk_dir
			else IfExist ..\..\AutoHotkey.chm
				ahk_dir = ..\..
			else IfExist %A_ProgramFiles%\AutoHotkey\AutoHotkey.chm
				ahk_dir = %A_ProgramFiles%\AutoHotkey
			else
			{
				MsgBox Could not find the AutoHotkey folder.
				return
			}
		}
		Run %ahk_dir%\AutoHotkey.chm
		WinWait AutoHotkey Help
	}
	; The above has set the "last found" window which we use below:
	WinActivate
	WinWaitActive
	StringReplace, C_Cmd, C_Cmd, #, {#}
	; Made a couple modifications (Mine) (below), more reliable now, but not 100%. Last edited Dec 21, 2021
	ControlClick, , AutoHotkey Help, , Left, 1 ; Mine, needed focus on the window top before Alt N, next. Added Dec 20, 2021
	Send, !n{home}+{end}
	Send, ^a ; Mine, it didn't select all of the search text if the window had already been opened. Added 12:51PM Dec 21, 2021
	Send, %C_Cmd%{enter}
return
