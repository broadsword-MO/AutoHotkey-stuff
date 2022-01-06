;Watch the YouTube video in the following link for guidance:
;ENG: https://youtu.be/7JsrCTViXBI
;KOR: https://youtu.be/50FZYI1qx_k

;https://www.autohotkey.com/docs/scripts/index.htm#TooltipMouseMenu
;hotkey changed from long press MButton to RButton

; ToolTip Mouse Menu (requires XP/2k/NT) -- by Rajat
; https://www.autohotkey.com
; This script displays a popup menu in response to briefly holding down
; the middle mouse button.  Select a menu item by left-clicking it.
; Cancel the menu by left-clicking outside of it.  A recent improvement
; is that the contents of the menu can change depending on which type of
; window is active (Notepad and Word are used as examples here).

; You can set any title here for the menu:
MenuTitle = Select: ;create menu title

	SetFormat, float, 0.0 ;not required
	SetBatchLines, 10ms ;not necessary
	SetTitleMatchMode, 2 ;required for dynamic menu
	#SingleInstance, Force

	;___________________________________________
	;_____Menu Definitions______________________

	; Create / Edit Menu Items here.
	; You can't use spaces in keys/values/section names.

	; Don't worry about the order, the menu will be sorted.

	MenuItems = Notepad/Calculator/Section 3/Section 4/Section 5 ;create menu items separated by /

	;___________________________________________
	;______Dynamic menuitems here_______________

	; Syntax:
	;     Dyn# = MenuItem|Window title

	Dyn1 = MS Word|- Microsoft Word ;create dynamic menu item and window title for the menu to show up separated by |
	Dyn2 = Notepad_Dynamic|- Notepad
	;~ Dyn3 = SciTE|SciTE4AutoHotkey ;reserved to demo how dynamic menu item can be created

	;___________________________________________

	Exit

	;___________________________________________
	;_____Menu Sections_________________________

	; Create / Edit Menu Sections here.

Notepad: ;create non-spaced labels for menu items
	Run, Notepad.exe
Return

Calculator:
	Run, Calc
Return

Section3:
	MsgBox, You selected 3
Return

Section4:
	MsgBox, You selected 4
Return

Section5:
	MsgBox, You selected 5
Return

MSWord:
	MsgBox, this is a dynamic entry (word)
Return

Notepad_Dynamic:
	MsgBox, this is a dynamic entry (notepad)
Return

;~ SciTE: ;reserved to demo how dynamic menu item can be created
;~ MsgBox, this is a dynamic entry (SciTE)
;~ Return

;___________________________________________
;_____Hotkey Section________________________

^RButton::

	;prepares dynamic menu

	DynMenu =
	Loop
	{
		IfEqual, Dyn%A_Index%,, Break ;break out of loop if DynX is empty

		StringGetPos, ppos, dyn%A_Index%, | ;separate out dynamic menu by menu name and window name
		StringLeft, item, dyn%A_Index%, %ppos%
		ppos += 2
		StringMid, win, dyn%A_Index%, %ppos%, 1000

		IfWinActive, %win%, ;add dynamic menu only if the window is active
			DynMenu = %DynMenu%/%item%
	}

	;Joins sorted main menu and dynamic menu
	Sort, MenuItems, D/
	TempMenu = %MenuItems%%DynMenu%

	;clears earlier entries
	Loop
	{
		IfEqual, MenuItem%A_Index%,, Break
		MenuItem%A_Index% =
	}

	;creates new entries
	Loop, Parse, TempMenu, /
	{
		MenuItem%A_Index% = %A_LoopField%
	}

	;creates the menu
	Menu = %MenuTitle%
	Loop
	{
		IfEqual, MenuItem%A_Index%,, Break
		numItems ++ ;variable to store number of menu items (counted by loop iterations)
		StringTrimLeft, MenuText, MenuItem%A_Index%, 0 ;not sure why this is here
		Menu = %Menu%`n%MenuText%
	}

	MouseGetPos, mX, mY
	Hotkey, ~LButton, MenuClick ;convert LButton to a hotkey
	Hotkey, ~LButton, On ;enable the hotkey if it is currently disabled
	ToolTip, %Menu%, %mX%, %mY% ;show tooltip of menu at current cursor loc
	WinActivate, %MenuTitle% ;required to by default activate the tooltip to prepare for the next mouse click
Return

MenuClick:
	Hotkey, ~LButton, Off ;disable the hotkey if it is currently enabled
	IfWinNotActive, %MenuTitle% ;if you clicked elsewhere and so tooltip is not the active window, otherwise you clicked on the tooltip so skip these lines
	{
		ToolTip
		Return
	}

	MouseGetPos, mX, mY
	ToolTip
	;use msgbox % mY to see the math result
	mY += 10	;space after which first line starts | adjustment may be required (increase number to start further down from the top of tooltip)
	;~ msgbox % mY
	mY /= 23	;space taken by each line | adjustment may be required (decrease number to narrow down the height of each row and vice versa)
	;~ msgbox % mY
IfLess, mY, 1, Return ;do nothing if the number is less than 1, i.e. you clicked the title area
IfGreater, mY, %numItems%, Return ;do nothing if mY exceeds the number of menu items
StringTrimLeft, TargetSection, MenuItem%mY%, 0
StringReplace, TargetSection, TargetSection, %A_Space%,, A ;remove all spaces
Gosub, %TargetSection%
Return

ESC::ExitApp