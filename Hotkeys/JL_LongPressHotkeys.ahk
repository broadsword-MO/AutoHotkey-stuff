#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

#SingleInstance, Force ; Only command in Juho-Lee original autoexe section

~Pause::Pause

;Watch the YouTube video in the following link for guidance:
;ENG: https://youtu.be/SOvyZPUc1gE
;KOR: https://youtu.be/7qBfQOXCYi8

;single alt press hotkey
~Alt:: ; NOTE - it's not !:: because that means you press shift + 1 (i.e. exclamation mark !) to launch the hotkey
	Run, Chrome.exe
return

;long press hotkey
~RAlt:: ;do not use Alt or LAlt because you may use left alt often e.g. when alt tabbing. RCtrl for right control.
	KeyWait, RAlt, T1 ;waits for alt key to be lifted. The number after T represents number of seconds
	If ErrorLevel ;no key press found within specified time
		Run, Chrome.exe
return

;long press double hotkey
~Alt & a::
	KeyWait, a, T1
	If ErrorLevel
		Run, Chrome.exe
return

;tab/short press hotkey with a long press option to abort launch
~RAlt::
	KeyWait, RAlt, T2
	If ErrorLevel {
		KeyWait, RAlt, T10 ;suppresses hotkey repeating too quickly
	} else {
		Run, Chrome.exe
	}