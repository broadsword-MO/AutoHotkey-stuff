#SingleInstance, Force
#NoEnv
#Warn
SendMode Input
SetTitleMatchMode, 2 ; 2 = Partial match of WinTitle
SetWorkingDir %A_ScriptDir%

!=:: ; Make a secondary title line for AHK
    if WinActive("Visual Studio Code ahk_exe Code.exe")
        or if WinActive("Notepad")
        Send, ^/
    Send, =================={Space 2}==================={left 20}
Return

; Or

; Works, but a bit overdone and a good exercise all the same
!=:: ; Make a secondary title line for AHK
    if WinActive("Visual Studio Code ahk_exe Code.exe") ; If VS Code is active
        or if WinActive("Notepad") ; or if Notepad is active
        ClipSaved:= ClipboardAll ; Temporarily save the Clipboard contents elsewhere
    Sleep, 50 ; Wait 50 milliseconds
    Clipboard:= "" ; Empty the Clipboard so ClipWait can detect when some data arrives
    Clipboard:= "; ==================  ===================" ; Put this on the Clipboard
    ClipWait ; Wait until the clipboard contains data
    Send, ^v ; Ctrl V = Paste the Clipboard contents into active window
    Sleep, 50 ; Wait 50 milliseconds
    Send, {left 20} ; Move the cursor left 20 spaces
    Sleep, 50 ; Wait 50 milliseconds
    Clipboard:= ClipSaved ; Restore the previous Clipboard contents
    ClipSaved:= "" ; Clears the ClipSaved cache to free up memory
Return
