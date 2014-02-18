#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

; -------------------------------------------------------------------------------------
; Example - Press the button to see the value of the radio boxes
; The script also detects state changes (closed/minimized/timeouts, etc).
Func Example()
	Local $iButton_1 = 0, $iRadio_1 = 0, $iRadio_3 = 0

	Opt("GUICoordMode", 1)

	GUICreate("Radio Box Demo", 400, 280)

	; Create the controls
	$iButton_1 = GUICtrlCreateButton("B&utton 1", 30, 20, 120, 40)
	GUICtrlCreateGroup("Group 1", 30, 90, 165, 160)
	GUIStartGroup()
	$iRadio_1 = GUICtrlCreateRadio("Radio &0", 50, 120, 70, 20)
	GUICtrlCreateRadio("Radio &1", 50, 150, 60, 20)
	$iRadio_3 = GUICtrlCreateRadio("Radio &2", 50, 180, 60, 20)

	; Init our vars that we will use to keep track of GUI events
	Local $iRadioVal1 = 0 ; We will assume 0 = first radio button selected, 2 = last button

	; Show the GUI
	GUISetState(@SW_SHOW)

	Local $iMsg = 0
	; In this message loop we use variables to keep track of changes to the radios, another
	; way would be to use GUICtrlRead() at the end to read in the state of each control
	While 1
		$iMsg = GUIGetMsg()
		Select
			Case $iMsg = $GUI_EVENT_CLOSE
				MsgBox($MB_SYSTEMMODAL, "", "Dialog was closed")
				ExitLoop
			Case $iMsg = $GUI_EVENT_MINIMIZE
				MsgBox($MB_SYSTEMMODAL, "", "Dialog minimized", 2)
			Case $iMsg = $GUI_EVENT_MAXIMIZE
				MsgBox($MB_SYSTEMMODAL, "", "Dialog restored", 2)

			Case $iMsg = $iButton_1
				MsgBox($MB_SYSTEMMODAL, "", "Default button clicked:" & @CRLF & "Radio " & $iRadioVal1)

			Case $iMsg >= $iRadio_1 And $iMsg <= $iRadio_3
				$iRadioVal1 = $iMsg - $iRadio_1

		EndSelect
	WEnd

	GUIDelete()
EndFunc   ;==>Example
