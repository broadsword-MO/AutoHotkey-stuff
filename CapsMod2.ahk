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
!CapsLock:: CapsLock ; Turn CapsLock on/off, toggle
; IMPORTANT... Single-line hotkey remapping commands MUST use the same modifier key for it to work. Otherwise, use "Send," and "Return" on multiple lines.

; "Return" unnecessary at the end of this script. Each complete single line command has a "Return" at the end implicitly

;===================================================
;                       HOTKEYS
;===================================================

;================== Suspend the script with the Pause button ===================
~Pause::Pause ; Pause this script with the Pause key.
; With the ~ in front of Pause then "When the hotkey fires, its key's native function will not be blocked (hidden from the system)" so that the hotkey is still received by all other scripts that use it as well.

;===================================================
;            Some hotkeys that use Ctrl
;===================================================

;================== Hibernate Windows 10 (Ctrl F1) ===================
^F1:: ; Hibernate Windows 10 ; last edited 5:51PM Jan 16, 2022
    DllCall("PowrProf\SetSuspendState", "Int", 1, "Int", 0, "Int", 0) ; Win10 hibernate
    Sleep, 120000 ; Sleep 2 minutes
    Run, "C:\Users\dell\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\StartupPrograms.ahk - Shortcut.lnk"
Return

;================== Browser Controls ===================
; #IfWinActive, ahk_exe msedge.exe ; Exclusive to Edge browser, optional
~^Left::Browser_Back ; Browser_Back
~^Right::Browser_Forward ; Browser_Forward
~^Down::Browser_Search ; Browser_Search
~^Up:: ; Browser_Favorites
    Send, ^+o ; Send ctrl shift o, the shortcut for Edge favorites
Return
; #IfWinActive

;===================================================
;            Some hotkeys that use Alt
;===================================================

;================== Make a primary title line for AHK (Alt shift =) ===================
~!+=:: ; Make a primary title line for AHK
    ; ("WinTitle and/or optional- ahk_exe ahk_class ahk_pid", , , )
    if WinActive("Notepad")
    Send, {;} ==================================================={enter}{;}{enter}{;} ==================================================={up 1}{space 12}
        Return 

        ;================== Make a secondary title line for coding, Alt = ===================
        ~!=:: ; Make a secondary title line for code
            if WinActive("Notepad")
                ; Send, ^/
            Send, {;} =================={Space 2}==================={left 20}
                Return

                ;==================================================
                ;         Some hotkeys that use CapsLock
                ;==================================================

                ;================== Run/cycle MS Edge browser windows group, CapsLock e ===================
                ; added 11:06AM Jan 07, 2022
                CapsLock & e::
                    GroupAdd, EdgeGroup, Microsoft​ Edge ahk_exe msedge.exe ; The U+200b char is nec.
                    If WinActive("Microsoft​ Edge ahk_exe msedge.exe") { ; The U+200b char is nec.
                        GroupActivate, EdgeGroup, R
                        Sleep, 200
                        WinMinimize
                    } Else if WinExist("Microsoft​ Edge ahk_exe msedge.exe") ; The U+200b char is nec.
                    GroupActivate, EdgeGroup
                    Else
                        Run, "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
                Return

                ;================== Run Obsidian, CapsLock o ===================
                ; last edited 3:05PM 5/12/2021
                CapsLock & o:: ; MinActRun Obsidian
                    MinActRun("brain - Obsidian ahk_exe Obsidian.exe", "C:\Users\dell\AppData\Local\Obsidian\Obsidian.exe")
                Return

                ;================ Run SMPlayer, CapsLock p =================
                ; last edited 8:33PM Nov 24, 2021
                CapsLock & p:: ; MinActRun SMPlayer
                    MinActRun("SMPlayer ahk_exe smplayer.exe", "C:\Program Files\SMPlayer\smplayer.exe")
                return

                ;========== Run VS Code,  CapsLock v ===========
                ; last edited 11:12AM 6/07/2021
                CapsLock & v:: ; MinActRun VS Code
                    MinActRun("Visual Studio Code ahk_exe Code.exe", "C:\Users\dell\AppData\Local\Programs\Microsoft VS Code\Code.exe")
                Return

                ;==================================================
                ;      Some hotkeys that use the Windows key
                ;==================================================

                ;================== Set active Window Always on Top, Windows key A ===================
                #a:: ; Set active Window Always on Top, toggle
                    Winset, Alwaysontop, , A ; Toggles the active Window to be always on top
                Return

                ;========== Run Windows 10 Calculator,  Windows key C ===========
                #c:: ; MinActRun Windows 10 Calculator
                    MinActRun("Calculator", "calc.exe") ; Quote marks still necessary around the Windows native application file when in this function
                Return

                ;========== Show desktop - toggle (native), Windows key D ===========

                ;========== Run File Explorer (modified from native), Windows key E ===========
                #e:: ; MinActRun File Explorer
                    MinActRun("ahk_class CabinetWClass", "explorer.exe")
                Return

                ;========== Run Windows 10 Notepad, Windows key N ===========
                #n:: ; MinActRun Windows 10 Notepad
                    MinActRun("Notepad ahk_exe Notepad.exe", "notepad.exe")
                Return

                ;================== Windows key cheat sheet toggle, Windows key W ===================
                ; Add a "No #Warn" for this somehow
                #w:: ; Windows key cheat sheet, toggle
                    Toggle := !Toggle
                    if Toggle {
                        Gui, Add, Picture, x0 y0 w%A_ScreenWidth% h%A_ScreenHeight% , %A_MyDocuments%\shortcutcheatsheet.png
                        Gui, Show, Maximize, Windows shortcut cheat sheet
                    } else if !Toggle {
                        Gui, hide
                    }
                Return

                ;================== Suspend all hotkeys, Windows key End ===================
                ; #End:: Suspend ; Doesn't suspend all for some reason... only its own script

                ;===================================================
                ;                   Hotstrings
                ;===================================================

                ;================== Some AHK commands ===================
                ::ws:: ; Run AHK Window Spy
                    MinActRun("Window Spy", "C:\Program Files\AutoHotkey\WindowSpy.ahk")
                Return

                ;================== Email addresses =================== 
                ::ts1g::thesonseeker1@gmail.com
                ::ts1p::thesonseeker1@protonmail.com

                ;================== for Obsidian notes ===================
                ::kan:: ; Obsidian - Makes a basic, projects type, kanban board
                    if WinActive("brain - Obsidian ahk_exe Obsidian.exe")
                        Send, ---`rkanban-plugin: basic`r---`r{#}{#} Ideas 💡`r`r`r{#}{#} Todo ↘`r`r`r{#}{#} Doing 🛠`r`r`r{#}{#} Done 🛏`r`r`r**Complete**`r
                Return

                ;================== Some hotstrings for writing JavaScript ===================
                ; No longer necessary, native to VS Code, Emmet or extensions
                ; :o:csl::console.log(){;}{Left 2} ; console.log(|);
                ; :o:for(::for (let i = 0{;} i < arr.length; i{+}{+}) {{}`n{}

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

