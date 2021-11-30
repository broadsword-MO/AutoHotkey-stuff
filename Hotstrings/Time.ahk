#NoEnv
#Warn
#SingleInstance, Force
SendMode Input
SetWorkingDir %A_ScriptDir%

~Pause::Suspend

;===================================================
;         Some various time-based hotstrings
;===================================================

::/addnow:: ; e.g. "added 8:44PM Nov 18, 2021" ; last edited 8:48PM Nov 18, 2021
    FormatTime, TimeDate,,h:mmtt MMM dd, yyyy
    Send, added %TimeDate%
Return

::/date:: ; e.g. "Nov 18, 2021" ; last edited 8:48PM Nov 18, 2021
    FormatTime, CurrentDate,,MMM dd, yyyy
    Send, %CurrentDate%
Return

::/le::last edited 

::/lenow:: ; e.g. "last edited 8:47PM Nov 18, 2021" ; last edited 8:48PM Nov 18, 2021
    FormatTime, TimeDate,,h:mmtt MMM dd, yyyy
    Send, last edited %TimeDate%
Return

::/now:: ; e.g. "8:47PM Nov 18, 2021" ; last edited 8:48PM Nov 18, 2021
    FormatTime, TimeDate,,h:mmtt MMM dd, yyyy
    Send, %TimeDate%
Return

::/time:: ; e.g. "2:03PM"
    FormatTime, CurrentTime,,h:mmtt
    Send, %CurrentTime%
Return

::/day:: ; e.g. "Wednesday"
    FormatTime, Day,,dddd
    Send, %Day%
Return

::/yest:: ; e.g. the day before today, "Thursday" added 8:29PM Nov 19, 2021
    DayArr := {1: "Saturday", 2: "Sunday", 3: "Monday", 4: "Tuesday", 5: "Wednesday", 6: "Thursday", 7: "Friday"}
    Key := A_WDay ; A_WDay = current 1-digit day of the week (1-7). 1 is Sunday
    Result := DayArr[Key] 
    Send, %Result%
Return

::/tom:: ; e.g. the day after today, "Saturday" added 8:35PM Nov 19, 2021
    DayArr := {1: "Monday", 2: "Tuesday", 3: "Wednesday", 4: "Thursday", 5: "Friday", 6: "Saturday", 7: "Sunday"}
    Key := A_WDay ; A_WDay = current 1-digit day of the week (1-7). 1 is Sunday
    Result := DayArr[Key]
    Send, %Result%
Return

; Still needed... ::(yesterday's date, next week, last week, etc.)::

;============= some various attempts on time ==============

::/yester:: ; Second best
    DayArr := {Monday: "Sunday", Tuesday: "Monday", Wednesday: "Tuesday", Thursday: "Wednesday", Friday: "Thursday", Saturday: "Friday", Sunday: "Saturday"}
    Key := A_DDDD ; A_DDDD = current day of the week's full name
    Result := DayArr[Key] 
    Send, %Result% 
Return

; last edited 1:37PM 11/20/2021
::/tomo:: ; Second best
    FormatTime, Today,,dddd
    if Today = Sunday
        Send, Monday
    else if Today = Monday
        Send, Tuesday
    else if Today = Tuesday
        Send, Wednesday
    else if Today = Wednesday
        Send, Thursday
    else if Today = Thursday
        Send, Friday
    else if Today = Friday
        Send, Saturday
    else if Today = Saturday
        Send, Sunday
Return

::/yeste:: ; Almost works!!
    DayArr := {1: "Sunday", 2: "Monday", 3: "Tuesday", 4: "Wednesday", 5: "Thursday", 6: "Friday", 7: "Saturday"}
    ; A_WDay = current 1-digit day of the week (1-7). 1 is Sunday
    Key := A_WDay 
    ; This part can't work for Sunday, can't subtract 1 from 1 to get 7
    EnvAdd, Key, -1 
    Result := DayArr[Key] 
    Send, %Result%
Return

::/yesterd:: ; Works!!
    FormatTime, toDay,,dddd ; maybe use A_DDDD instead
    if toDay = Thursday
        Send, Wednesday
    ; etc.
    ; etc.
    ; etc.
Return 

::/yesterda:: ; Works!!
    if A_DDDD = Sunday
        Send, Saturday
    else if A_DDDD = Monday
        Send, Sunday
    else if A_DDDD = Tuesday
        Send, Monday
    else if A_DDDD = Wednesday
        Send, Tuesday
    else if A_DDDD = Thursday
        Send, Wednesday
    else if A_DDDD = Friday
        Send, Thursday
    else if A_DDDD = Saturday
        Send, Friday
Return

; ::/yesterday:: ; e.g. "Wednesday" ; Doesn't work yet
;     FormatTime, YesterDay,,dddd
;     YesterDay -= 1, days
;     Send, %YesterDay%
; Return

;================== For Obsidian ===================

::@today:: ; e.g. "[[2021-11-08, Mon]]"
    FormatTime, Today,,yyyy-MM-dd, ddd
    Send, [[%Today%]]
Return
