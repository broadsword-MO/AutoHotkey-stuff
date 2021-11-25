#SingleInstance, Force
#NoEnv
#Warn
SendMode Input
SetTitleMatchMode, 2 ; 2 = Partial match of WinTitle
SetWorkingDir %A_ScriptDir%

!+=::
    if WinActive("Visual Studio Code ahk_exe Code.exe")
        or if WinActive("Notepad")
    Send, {;}==================================================={enter}{;}{enter}{;}==================================================={up 1}{space 12}
        Return

