; *** Demo to show a timer window
#include <GUIConstantsEx.au3>
#include <Date.au3>

Opt("TrayIconDebug", 1)

Global $timer, $Secs, $Mins, $Hour, $Time

Example()

Func Example()
	; Create GUI
	GUICreate("Timer", 120, 50)
	GUICtrlCreateLabel("00:00:00", 10, 10)
	GUISetState(@SW_SHOW)
	; Start timer
	$timer = TimerInit()
	AdlibRegister("Timer", 50)
	While 1
		; FileWriteLine("debug.log",@MIN & ":" & @SEC & " ==> before")
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				Exit
		EndSwitch
		; FileWriteLine("debug.log",@MIN & ":" & @SEC & " ==> after")
	WEnd
EndFunc   ;==>Example

Func Timer()
	_TicksToTime(Int(TimerDiff($timer)), $Hour, $Mins, $Secs)
	Local $sTime = $Time ; save current time to be able to test and avoid flicker..
	$Time = StringFormat("%02i:%02i:%02i", $Hour, $Mins, $Secs)
	If $sTime <> $Time Then ControlSetText("Timer", "", "Static1", $Time)
EndFunc   ;==>Timer
