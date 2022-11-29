#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance, Force

~Pause::Pause ; Pause this script with the Pause key.

#IfWinNotActive, ahk_exe Code.exe ; Excludes VS Code (conflicting commands)
    ~^!Left::Browser_Back ; Browser_Back
    ~^!Right::Browser_Forward ; Browser_Forward
    ~^!Down::Browser_Search ; Browser_Search
    ~^!Up:: ; = Browser_Favorites
        Send, ^+o ; Send ctrl shift o, the shortcut for Edge favorites
    Return
#IfWinNotActive
