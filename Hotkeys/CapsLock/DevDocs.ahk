#SingleInstance, Force ; Skip invocation dialog box and silently replace previously executing instance of this script.
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 2 ; A window's title can contain WinTitle anywhere inside it to be a match.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

; First part works... second part only works if file has Admin privileges or is in the Startup folder,... which of course has Admin privileges

~Pause::Pause

;==========================================
; Run DevDocs.io,      	CapsLock d
;==========================================

Capslock & d::
If WinActive("DevDocs.io ahk_exe msedge.exe")
    WinMinimize
Else if WinExist("DevDocs.io ahk_exe msedge.exe")
    WinActivate
Else
    Run, "C:\Users\dell\AppData\Local\Microsoft\Edge\User Data\Default\Web Applications\_crx__ahiigpfcghkbjfcibpojancebdfjmoop\DevDocs.io.lnk"
Return

