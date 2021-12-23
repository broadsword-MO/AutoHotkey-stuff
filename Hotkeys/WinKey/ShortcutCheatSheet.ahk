#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance, Force

~Pause::Pause

; From interdimensionalmeme on the Windows 10 reddit.com 12/02/2021

; --------- Hold down Windows key W to see the cheat sheet -------
; #w::
;     Gui, Add, Picture, x0 y0 w%A_ScreenWidth% h%A_ScreenHeight% , %A_MyDocuments%\shortcutcheatsheet.png
;     Gui, Show, x0 y0 w%A_ScreenWidth% h%A_ScreenHeight%, Windows shortcut cheat sheet
;     keywait, w
; #w up::
;     Gui, hide

;================== My toggle version ===================

#w::
    Toggle := !Toggle
    if Toggle {
        Gui, Add, Picture, x0 y0 w%A_ScreenWidth% h%A_ScreenHeight% , %A_MyDocuments%\shortcutcheatsheet.png
        Gui, Show, Maximize, Windows shortcut cheat sheet
    } else if !Toggle {
        Gui, hide
    }
Return

