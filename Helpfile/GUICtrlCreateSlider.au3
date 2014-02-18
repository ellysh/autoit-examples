#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $slider1, $button, $msg

	GUICreate("slider", 220, 100, 100, 200)
	GUISetBkColor(0x00E0FFFF) ; will change background color

	$slider1 = GUICtrlCreateSlider(10, 10, 200, 20)
	GUICtrlSetLimit(-1, 200, 0) ; change min/max value
	$button = GUICtrlCreateButton("Value?", 75, 70, 70, 20)
	GUISetState(@SW_SHOW)
	GUICtrlSetData($slider1, 45) ; set cursor

	; Loop until the user exits.
	Do
		$msg = GUIGetMsg()

		If $msg = $button Then
			MsgBox($MB_SYSTEMMODAL, "slider1", GUICtrlRead($slider1), 2)
		EndIf
	Until $msg = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
