#SingleInstance, Force
#NoEnv
#Warn
SendMode Input
SetTitleMatchMode, 2 ; 2 = Partial match of WinTitle
SetWorkingDir %A_ScriptDir%

!=::
    if WinActive("Visual Studio Code ahk_exe Code.exe")
        or if WinActive("Notepad")
    Send, {;}==================  ==================={left 20}
        Return

