SendMode Input
SetWorkingDir, %A_ScriptDir%
SetTitleMatchMode, 2
#NoEnv
#SingleInstance, force

~Pause::Pause

;===================================================
;          Move the window to the next VD, 
;           then switch to that VD
;===================================================
;   Uses MoveToDesktop.exe (from Github.com) which uses Window key, Alt, Left/Right Arrow to move 'only' the window to the next Virtual Desktop. Still a little sketchy. Such as... creates another desktop if you keep going past the current last VD on the right. Maybe it can be adjusted in the settings .ini?

;   The Task View Window target is:
; %windir%\explorer.exe shell:::{3080F90E-D7AD-11D9-BD98-0000947B0257}
; Copy this into a shortcut if one is wanted

;   The MoveToDesktop.ini which contains the settings, is located in the %Appdata% folder
;   located in - C:\Users\dell\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

#+Right::
    Send, #!{right}
    Sleep, 200
    Send, ^#{right}
Return

#+Left::
    Send, #!{Left}
    Sleep, 200
    Send, ^#{Left}
Return

;===================================================
; Supposed to hide window, move to next/previous virtual desktop,
;       show window. Suggested from pukkandan on reddit (March 11, 2019)
;===================================================
; Kind of works. All sorts of random oddities, such as hiding stickies and losing access to other virtual desktops. Needs some technical tweaking.

; #+Right::
;     WinHide, A, , ahk_exe explorer.exe ; exclude any explorer windows
;     Send, ^#{Right}
;     WinShow, A
;     WinSet, AlwaysOnTop, On, A
;     WinSet, AlwaysOnTop, Off, A
;     WinActivate
; Return

; #+Left::
;     WinHide, A, , ahk_exe explorer.exe ; exclude any explorer windows
;     Send, ^#{Left}
;     WinShow, A
;     WinSet, AlwaysOnTop, On, A
;     WinSet, AlwaysOnTop, Off, A
;     WinActivate
; Return
