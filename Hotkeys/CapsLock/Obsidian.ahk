#SingleInstance, Force
#NoEnv
#Warn
SendMode Input
SetTitleMatchMode, 2
SetWorkingDir %A_ScriptDir%
; First parts work... third part only works if file has Admin privileges or is in the Startup folder,... which of course has Admin privileges

; ==========================================
;       Run Obsidian, 		CapsLock o
; ==========================================

CapsLock & o::
    If WinActive("brain - Obsidian ahk_exe Obsidian.exe")
        WinMinimize
    Else if WinExist("brain - Obsidian ahk_exe Obsidian.exe")
        WinActivate
    Else
        Run, "C:\Users\dell\AppData\Local\Obsidian\Obsidian.exe"
Return

