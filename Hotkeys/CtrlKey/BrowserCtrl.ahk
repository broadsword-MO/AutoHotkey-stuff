#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance, Force

~Pause::Pause ; Pause this script with the Pause key.

#IfWinActive, ahk_exe msedge.exe ; Exclusive to Edge browser, optional
    ~^!Left::Browser_Back
    ~^!Right::Browser_Forward
    ~^!Down::Browser_Search
    ~^!Up:: ; = Browser_Favorites
        Send, ^+o
    Return
#IfWinActive