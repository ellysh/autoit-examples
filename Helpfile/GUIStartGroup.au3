#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $iButton_1 = 0, $iRadio_1 = 0, $iRadio_2 = 0, $iRadio_3 = 0
	Local $iRadio_4 = 0, $iRadio_5 = 0, $iRadio_6 = 0, $iInput_1 = 0, $iInput_2 = 0

	Opt("GUICoordMode", 1)

	GUICreate("Radio Box Grouping Demo", 400, 280)

	; Create the controls
	$iButton_1 = GUICtrlCreateButton("B&utton 1", 30, 20, 120, 40)
	GUICtrlCreateGroup("Group 1", 30, 90, 165, 160)
	GUIStartGroup()
	$iRadio_1 = GUICtrlCreateRadio("Radio &0", 50, 120, 70, 20)
	$iRadio_2 = GUICtrlCreateRadio("Radio &1", 50, 150, 60, 20)
	$iRadio_3 = GUICtrlCreateRadio("Radio &2", 50, 180, 60, 20)
	GUIStartGroup()
	$iRadio_4 = GUICtrlCreateRadio("Radio &A", 120, 120, 70, 20)
	$iRadio_5 = GUICtrlCreateRadio("Radio &B", 120, 150, 60, 20)
	$iRadio_6 = GUICtrlCreateRadio("Radio &C", 120, 180, 60, 20)
	GUIStartGroup()
	$iInput_1 = GUICtrlCreateInput("Input 1", 200, 20, 160, 30)
	$iInput_2 = GUICtrlCreateInput("Input 2", 200, 70, 160, 30)

	; Set the defaults (radio buttons clicked, default button, etc)
	GUICtrlSetState($iRadio_1, $GUI_CHECKED)
	GUICtrlSetState($iRadio_6, $GUI_CHECKED)
	GUICtrlSetState($iButton_1, $GUI_FOCUS + $GUI_DEFBUTTON)

	; Init our vars that we will use to keep track of radio events
	Local $iRadioVal1 = 0 ; We will assume 0 = first radio button selected, 2 = last button
	Local $iRadioVal2 = 2

	GUISetState(@SW_SHOW)

	Local $iMsg = 0
	; In this message loop we use variables to keep track of changes to the radios, another
	; way would be to use GUICtrlRead() at the end to read in the state of each control.  Both
	; methods are equally valid
	While 1
		$iMsg = GUIGetMsg()
		Select
			Case $iMsg = $GUI_EVENT_CLOSE
				ExitLoop

			Case $iMsg = $iButton_1
				MsgBox($MB_SYSTEMMODAL, "", "Radio " & $iRadioVal1 & @CRLF & "Radio " & Chr($iRadioVal2 + Asc("A")) & @CRLF & GUICtrlRead($iInput_1) & @CRLF & GUICtrlRead($iInput_2))

			Case $iMsg = $iRadio_1 Or $iMsg = $iRadio_2 Or $iMsg = $iRadio_3
				$iRadioVal1 = $iMsg - $iRadio_1

			Case $iMsg = $iRadio_4 Or $iMsg = $iRadio_5 Or $iMsg = $iRadio_6
				$iRadioVal2 = $iMsg - $iRadio_4

		EndSelect
	WEnd

	GUIDelete()
EndFunc   ;==>Example
