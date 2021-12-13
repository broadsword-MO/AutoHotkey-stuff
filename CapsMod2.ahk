#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
#SingleInstance, Force
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 2 ; 2 = Partial match of WinTitle
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

; Activate NumLock completely
SetNumlockState, AlwaysOn

;===================================================
;            Set CapsLock as another modifier key
;===================================================
; Works good!! The CapsLock key can now be used as another Modifier Key!!!

; Deactivate CapsLock completely
SetCapslockState, AlwaysOff

; Set the CapsLock key to only work as CapsLock when also pressed with Alt
!CapsLock:: CapsLock
; IMPORTANT... Single-line hotkey remapping commands MUST use the same modifier key for it to work. Otherwise, use "Send," and "Return" on multiple lines.

; "Return" unnecessary at the end of this script. Each complete single line command has a "Return" at the end implicitly

;===================================================
;                       HOTKEYS
;===================================================

;================== Suspend the script with the Pause button ===================
~Pause::Pause ; Pause this script with the Pause key. With the ~ in front of Pause then "When the hotkey fires, its key's native function will not be blocked (hidden from the system)" so that the hotkey is still received by all other scripts that use it as well.

;===================================================
;            Some hotkeys that use Ctrl
;===================================================

;================== Hibernate Windows 10 (Ctrl F1) ===================
^F1::DllCall("PowrProf\SetSuspendState", "Int", 1, "Int", 0, "Int", 0)

;===================================================
;            Some hotkeys that use Alt
;===================================================

;================== Make a primary title line for AHK (Alt shift =) ===================
!+=::
    ; ("WinTitle and/or optional- ahk_exe ahk_class ahk_pid", , , )
    if WinActive("Visual Studio Code ahk_exe Code.exe")
        or if WinActive("Notepad")
    Send, {;}==================================================={enter}{;}{enter}{;}==================================================={up 1}{space 12}
        Return

        ;================== Make a secondary title line for AHK (Alt =) ===================

        ;           Works, but a bit overdone and a good exercise all the same
        !=::
            if WinActive("Visual Studio Code ahk_exe Code.exe") ; If VS Code is active
                or if WinActive("Notepad") ; or if Notepad is active
                ClipSaved:= ClipboardAll ; Temporarily save the Clipboard contents elsewhere
            Sleep, 50 ; Wait 50 milliseconds
            Clipboard:= "" ; Empty the Clipboard so ClipWait can detect when some data arrives
            Clipboard:= ";==================  ===================" ; Put this on the Clipboard
            ClipWait ; Wait until the clipboard contains data
            Send, ^v ; Ctrl V = Paste the Clipboard contents into active window
            Sleep, 50 ; Wait 50 milliseconds
            Send, {left 20} ; Move the cursor left 20 spaces
            Sleep, 50 ; Wait 50 milliseconds
            Clipboard:= ClipSaved ; Restore the previous Clipboard contents
            ClipSaved:= "" ; Clears the ClipSaved cache to free up memory
        Return

        ;==================================================
        ;         Some hotkeys that use CapsLock
        ;==================================================

        ;================ Run SMPlayer, CapsLock p =================
        ; last edited 8:33PM Nov 24, 2021
        CapsLock & p::MinActRun("SMPlayer ahk_exe smplayer.exe", "C:\Program Files\SMPlayer\smplayer.exe")

        ;========== Run Obsidian, CapsLock o ===========
        ; last edited 3:05PM 5/12/2021
        CapsLock & o::MinActRun("brain - Obsidian ahk_exe Obsidian.exe", "C:\Users\dell\AppData\Local\Obsidian\Obsidian.exe")

        ;========== Run VS Code,    CapsLock v ===========
        ; last edited 11:12AM 6/07/2021
        CapsLock & v::MinActRun("Visual Studio Code ahk_exe Code.exe", "C:\Users\dell\AppData\Local\Programs\Microsoft VS Code\Code.exe")

        ;==================================================
        ;      Some hotkeys that use the Windows key
        ;==================================================

        ;================== Set active Window Always on Top, Windows key A ===================
        #a::Winset, Alwaysontop, , A ; Toggles the active Window to be always on top

        ;========== Run Windows 10 Calculator,  Windows key C ===========
        #c::MinActRun("Calculator", "calc.exe") ; Quote marks still necessary around the Windows native application file when in this function

        ;========== Show desktop - toggle (native), Windows key D ===========

        ;========== Run File Explorer (modified from native), Windows key E ===========
        #e::MinActRun("ahk_class CabinetWClass", "explorer.exe")

        ;========== Run Windows 10 Notepad,     Windows key N ===========
        #n::MinActRun("Notepad ahk_exe Notepad.exe", "notepad.exe")

        ;================== Suspend all hotkeys, Windows key End ===================
        ; #End:: Suspend ; Doesn't suspend all for some reason... only its own script

        ;===================================================
        ;                   Hotstrings
        ;===================================================

        ;================== Some AHK commands ===================
        ::ws:: ; Run Window Spy
            MinActRun("Window Spy", "C:\Program Files\AutoHotkey\WindowSpy.ahk")
        Return

        ;================== Email addresses ===================
        ::ts1g::thesonseeker1@gmail.com
        ::ts1p::thesonseeker1@protonmail.com

        ;================== for Obsidian notes ===================
        ::kan:: ; Makes a basic, projects type, kanban board
            if WinActive("brain - Obsidian ahk_exe Obsidian.exe")
                Send, ---`rkanban-plugin: basic`r---`r{#}{#} Ideas 💡`r`r`r{#}{#} Todo ↘`r`r`r{#}{#} Doing 🛠`r`r`r{#}{#} Done 🛏`r`r`r**Complete**`r
        Return

        ;================== Some hotstrings for writing JavaScript ===================
        :o:csl::console.log(){Left} ; console.log(|)
        ::jvs::JavaScript

        ;================== YouTube download command ===================
        ::ytdl::youtube-dl

        ;===================================================
        ;            MinActRun function
        ;===================================================
        MinActRun(title, exe) {
            If WinActive(title)
                WinMinimize
            Else If WinExist(title)
                WinActivate
            Else
                Run, %exe%
        }

